#! /usr/bin/env python

import rospy
from std_msgs.msg import Int32

def callback(msg):
	print msg.data

def topic_subscriber():
	rospy.init_node('topic_subscriber')
	sub = rospy.Subscriber('counter', Int32, callback)

	rospy.spin()

if __name__ == '__main__':
	topic_subscriber()

