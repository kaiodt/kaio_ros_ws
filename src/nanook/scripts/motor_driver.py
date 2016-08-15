#! /usr/bin/env python

import rospy
import serial
import time
from std_msgs.msg import UInt8


#############################################################
class MotorDriver:
#############################################################

	#############################################################
	def __init__(self):
	#############################################################

		# Initialize node
		rospy.init_node("motor_driver")
	
		# Get parameters
		self.serial_port = rospy.get_param("~serial_port", "/dev/ttyACM0")
		self.baud_rate = rospy.get_param("~baud_rate", 9600)

		# Connect to motor driver via serial
		try:
			rospy.loginfo("Connecting to motor driver at %s." % self.serial_port)		
			self.serial_driver = serial.Serial(self.serial_port, self.baud_rate)
			time.sleep(1)
		
		except serial.SerialException:
			rospy.logerr("Failed to connect to motor driver in port %s." % self.serial_port)
			raise RuntimeError

		rospy.loginfo("Connected to motor driver!")

		# Stop both motors		
		self.send_command(0)

		# Subscribers
		rospy.Subscriber("left_motor_commands", UInt8, self.left_motor_callback)
		rospy.Subscriber("right_motor_commands", UInt8, self.right_motor_callback)	

	#############################################################
	def send_command(self, speed):
	#############################################################

		speed = chr(speed)
		self.serial_driver.write(speed)

	#############################################################
	def left_motor_callback(self, command):
	#############################################################

		self.send_command(command.data)

	#############################################################
	def right_motor_callback(self, command):
	#############################################################

		self.send_command(command.data)

#############################################################
#############################################################

if __name__ == '__main__':

	motor_driver = MotorDriver()
	rospy.spin()
	
