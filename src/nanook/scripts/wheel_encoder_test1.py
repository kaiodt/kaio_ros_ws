#! /usr/bin/env python

import rospy
import serial
import time
from std_msgs.msg import Int32, Float32

rospy.init_node("wheel_encoder")

serial_port = rospy.get_param("~serial_port", "/dev/ttyACM0")
baud_rate = rospy.get_param("~baud_rate", 9600)
encoder_publish_rate = rospy.get_param("~encoder_publish_rate", 1)

encoder_rate = rospy.Rate(encoder_publish_rate)

try:
	rospy.loginfo("Connecting to encoder at %s." % serial_port)		
	serial_encoder = serial.Serial(serial_port, baud_rate)
		
except serial.SerialException:
	rospy.logerr("Failed to connect to encoder in port %s." % serial_port)
	raise RuntimeError

time.sleep(1)

rospy.loginfo("Connected to encoder!")

# Publishers
encoder_pub = rospy.Publisher("encoder_count", Int32, queue_size=10)
speed_pub = rospy.Publisher("wheel_speed", Float32, queue_size=10)

def read_serial(bytes):
	rospy.loginfo("Read serial.")
	serial_encoder.write(chr(1))
	return serial_encoder.read(bytes)

def read_encoder():
	rospy.loginfo("Read encoder.")
	data = read_serial(4)
	reading = ord(data[0]) | (ord(data[1])<<8) | (ord(data[2])<<16) | (ord(data[3])<<24) & 0x00ffffff
	print reading
	return reading

#############################################################
def read_encoder_test():
#############################################################
	rospy.loginfo("Read encoder test.")
	num = int('1')
	num = chr(num)
	serial_encoder.write(num)
	rospy.loginfo("Request sent")
	data = serial_encoder.read(4)
	rospy.loginfo("Received")
	#print "data[0] =" + str(ord(data[0]))
	#print "data[1] =" + str(ord(data[1]))
	#print "data[2] =" + str(ord(data[2]))
	#print "data[3] =" + str(ord(data[3]))
	#reading = ord(data[0]) | (ord(data[1])<<8) | (ord(data[2])<<16) | (ord(data[3])<<24) & 0x00ffffff

	#print reading
	#return reading

if __name__ == '__main__':
	rospy.loginfo("Spin")
	while not rospy.is_shutdown():
		#encoder_reading = self.read_encoder()
		encoder_reading = read_encoder_test()
		encoder_msg = Int32()
		encoder_msg.data = encoder_reading
		encoder_pub.publish(encoder_msg)
		encoder_rate.sleep()

