#! /usr/bin/env python

import rospy, cv2, cv_bridge, numpy
from sensor_msgs.msg import Image

class Follower:
	# Constructor	
	def __init__(self):
		# Instantiate a CvBridge object
		self.bridge = cv_bridge.CvBridge()

		# Create a CV window
		cv2.namedWindow("window", 1)

		# Create a Subscriber to /camera/rgb/image_raw
		self.image_sub = rospy.Subscriber("camera/rgb/image_raw", Image, self.image_callback)
	
	# Callback function
	def image_callback(self, msg):
		# Get the image using the CV bridge
		image = self.bridge.imgmsg_to_cv2(msg)

		# Get the HSV representation of the obtained RGB image
		hsv = cv2.cvtColor(image, cv2.COLOR_BGR2HSV)

		# Define HSV boundaries for the filter (filter the yellow line)
		lower_yellow = numpy.array([ 50,  50, 170])
		upper_yellow = numpy.array([255, 255, 190])

		# Generate a binary HSV image inly with the pixels within the filter boundaries
		mask = cv2.inRange(hsv, lower_yellow, upper_yellow)

		# Apply the mask to the original image
		masked = cv2.bitwise_and(image, image, mask=mask)

		# Show image in opened window
		cv2.imshow("window", mask)
		
		# Wait 3 ms
		cv2.waitKey(3)

if __name__ == '__main__':
	# Initialize
	rospy.init_node('follower')
	follower = Follower()

	# Pass control to ROS
	rospy.spin()
