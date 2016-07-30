#! /usr/bin/env python

import rospy
from basics.msg import Complex

def callback(msg):
	print 'Real:', msg.real
	print 'Imaginary:', msg.imaginary
	print

def message_subscriber():
	rospy.init_node('message_subscriber')
	sub = rospy.Subscriber('complex', Complex, callback)

	rospy.spin()

if __name__ == '__main__':
	message_subscriber()


