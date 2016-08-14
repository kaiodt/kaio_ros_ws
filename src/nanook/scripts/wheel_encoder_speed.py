#! /usr/bin/env python

import rospy
import serial
import time
from std_msgs.msg import Int32, Float32
from math import pi

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
		self.wheel_diameter = rospy.get_param("~wheel_diameter", 0.1)
		self.ticks_per_rev = rospy.get_param("~ticks_per_rev", 10)

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

		# Internal variables
		self.ticks_per_meter = int(self.ticks_per_rev / (pi * self.wheel_diameter))
		self.encoder_history = [0] * 2	# Store 2 encoder reading values
		self.speed_history = [0] * 4
		self.last_time = rospy.Time.now()		
		
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
		
		del self.encoder_history[0]
		self.encoder_history.append(reading)

		return reading

	#############################################################
	def get_encoder_delta(self):
	#############################################################
		
		delta = self.encoder_history[1] - self.encoder_history[0]
		
		if (abs(delta) > 8000000):
			
			if (self.encoder_history[0] >= 0 and self.encoder_history[0] < 100000):
				delta = 0x00ffffff - delta
			else:
				delta = delta + 0x00ffffff

		return delta

	#############################################################
	def calc_speed(self):
	#############################################################

		delta = self.get_encoder_delta() * 1.0
		dt = rospy.Time.now() - self.last_time
		self.last_time = rospy.Time.now()

		speed = (delta / self.ticks_per_meter) / dt.to_sec()
		del self.speed_history[0]
		self.speed_history.append(speed)

		return self.speed_mean(self.speed_history)

	#############################################################
	def speed_mean(self, speed_history):
	#############################################################
		
		total = 0
		for s in speed_history:
			total = total + s

		return total / len(speed_history)

	#############################################################
	def spin(self):
	#############################################################

		while not rospy.is_shutdown():
			
			encoder_reading = self.read_encoder()
			speed_reading = self.calc_speed()

			encoder_msg = Int32()
			encoder_msg.data = encoder_reading
			self.encoder_pub.publish(encoder_msg)

			speed_msg = Float32()
			speed_msg.data = speed_reading
			self.speed_pub.publish(speed_msg)

			self.encoder_rate.sleep()

#############################################################
#############################################################

if __name__ == '__main__':

	wheel_encoder = WheelEncoder()	
	wheel_encoder.spin()

