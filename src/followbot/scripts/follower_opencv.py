#! /usr/bin/env python

import rospy
from sensor_msgs.msg import Image
import cv2, cv_bridge

class Follower:
	# Constructor	
	def __init__(self):
		# Instantiate a CvBridge object
		self.bridge = cv_bridge.CvBridge()
		
		# Create a CV window
		cv2.namedWindow("window", 1)

		# Create a Subscriber to /camera/rgb/image_raw
		self.image_sub = rospy.Subscriber('camera/rgb/image_raw', Image, self.image_callback)
	
	# Callback function
	def image_callback(self, msg):
		# Get the image using the CV bridge
		image = self.bridge.imgmsg_to_cv2(msg, desired_encoding='bgr8')

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
