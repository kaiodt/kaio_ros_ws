#! /usr/bin/env python

import rospy
from std_msgs.msg import Int32

def topic_publisher():
	rospy.init_node('topic_publisher')
	pub = rospy.Publisher('counter', Int32, queue_size=5)
	rate = rospy.Rate(2)
	
	counter = 0

	while not rospy.is_shutdown():
		pub.publish(counter)
		counter += 1
		rate.sleep()

if __name__ == '__main__':
	try:
		topic_publisher()
	except rospy.ROSInterruptException:
		pass
		
