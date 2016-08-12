#! /usr/bin/env python

import rospy
import serial
from std_msgs.msg import Int32, Float32

#############################################################
class WheelEncoder:
#############################################################

	#############################################################
	def __init__(self):
	#############################################################

		# Initialize node
		rospy.init_node("wheel_encoder")

		# Get parameters
		self.nodename = rospy.get_name()
		self.serial_port = rospy.get_param("~serial_port", "/dev/ttyACM0")
		self.baud_rate = rospy.get_param("~baud_rate", 9600)

		# Connect to encoder via serial
		try:
			rospy.loginfo("Connecting to encoder at %s." % self.serial_port)		
			self.serial_encoder = serial.Serial(self.serial_port, self.baud_rate)
		
		except serial.SerialException:
			rospy.logerr("Failed to connect to encoder in port %s." % self.serial_port)
			raise RuntimeError

		rospy.loginfo("Connected to encoder!")

		# Publishers
		encoder_pub = rospy.Publisher("encoder_count", Int32, queue_size=10)
		speed_pub = rospy.Publisher("wheel_speed", Float32, queue_size=10)



