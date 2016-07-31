#! /usr/bin/env python

import rospy, cv2, cv_bridge, numpy
from sensor_msgs.msg import Image
from geometry_msgs.msg import Twist

class Follower:
	# Constructor	
	def __init__(self):
		# Instantiate a CvBridge object
		self.bridge = cv_bridge.CvBridge()

		# Create a CV window
		cv2.namedWindow("window", 1)

		# Create a Subscriber to /camera/rgb/image_raw
		self.image_sub = rospy.Subscriber("camera/rgb/image_raw", Image, self.image_callback)

		# Create a Publisher to /cmd_vel_mux/input/teleop
		self.cmd_vel_pub = rospy.Publisher("cmd_vel_mux/input/teleop", Twist, queue_size=1)

		# Create a Twist message
		self.twist = Twist()

	# Callback function
	def image_callback(self, msg):
		# Get the image using the CV bridge
		image = self.bridge.imgmsg_to_cv2(msg, desired_encoding='bgr8')

		# Get the HSV representation of the obtained RGB image
		hsv = cv2.cvtColor(image, cv2.COLOR_BGR2HSV)

		# Define HSV boundaries for the filter (filter the yellow line)
		lower_yellow = numpy.array([ 10,  10,  10])
		upper_yellow = numpy.array([255, 255, 250])

		# Generate a binary HSV image inly with the pixels within the filter boundaries
		mask = cv2.inRange(hsv, lower_yellow, upper_yellow)

		# Restrict the search only to a 20-row portion correspondig to ~1m in front of the robot.
		h, w, d = image.shape				# Image dimensions
		search_top = 3 * h/4				# Search window should start at 3/4 of the image (top-bottom)
		search_bot = search_top + 20		# Search window ends 20 rows below the starting row
		
		mask[0:search_top, 0:w] = 0			# Zero all the rows above the start of search window
		mask[search_bot:h, 0:w] = 0			# Zero all the rows below the end of search window

		# In the search window, estimate the center of the line and draw a red circle.
		# Apply a P-Controller and send velocity commands.

		M = cv2.moments(mask)	# Calculate the moments in order to find the centroid

		if M['m00'] > 0:
			cx = int(M['m10']/M['m00'])						# Centroid x-coordinate
			cy = int(M['m01']/M['m00'])						# Centroid y-coordinate
			cv2.circle(image, (cx,cy), 20, (0,0,255), -1)	# Draw a red circle centered at the centroid
			
			# P-Controller
			err = cx - w/2								# Try to keep the line centered
			self.twist.linear.x = 0.2					# Constant linear velocity
			self.twist.angular.z = -float(err) / 100	# Controlled angular velocity (kp = -1/100)
			
			# Publish new velocity
			self.cmd_vel_pub.publish(self.twist)

		# Show image in opened window
		cv2.imshow("window", image)
		
		# Wait 3 ms
		cv2.waitKey(3)

if __name__ == '__main__':
	# Initialize
	rospy.init_node('follower')
	follower = Follower()

	# Pass control to ROS
	rospy.spin()
