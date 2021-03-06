#! /usr/bin/env python

import rospy
import serial
import time
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
		self.encoder_publish_rate = rospy.get_param("~encoder_publish_rate", 10)


		# Publishing rate
		self.encoder_rate = rospy.Rate(self.encoder_publish_rate)

		# Connect to encoder via serial
		try:
			rospy.loginfo("Connecting to encoder at %s." % self.serial_port)		
			self.serial_encoder = serial.Serial(self.serial_port, self.baud_rate)
			time.sleep(1)
		
		except serial.SerialException:
			rospy.logerr("Failed to connect to encoder in port %s." % self.serial_port)
			raise RuntimeError

		rospy.loginfo("Connected to encoder!")

		# Publishers
		self.encoder_pub = rospy.Publisher("encoder_count", Int32, queue_size=10)
		self.speed_pub = rospy.Publisher("wheel_speed", Float32, queue_size=10)

	#############################################################
	def read_serial(self, bytes):
	#############################################################
		
		self.serial_encoder.write(chr(1))
		return self.serial_encoder.read(bytes)

	#############################################################
	def read_encoder(self):
	#############################################################
		
		data = self.read_serial(4)
		reading = ord(data[0]) | (ord(data[1])<<8) | (ord(data[2])<<16) | (ord(data[3])<<24) & 0x00ffffff
		return reading

	#############################################################
	def spin(self):
	#############################################################

		while not rospy.is_shutdown():
			encoder_reading = self.read_encoder()
			encoder_msg = Int32()
			encoder_msg.data = encoder_reading
			self.encoder_pub.publish(encoder_msg)
			self.encoder_rate.sleep()

#############################################################
#############################################################

if __name__ == '__main__':

	wheel_encoder = WheelEncoder()	
	wheel_encoder.spin()

