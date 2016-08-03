#! /usr/bin/env python

import rospy, tf
from math import pi
from geometry_msgs.msg import Quaternion
from fake_sensor import FakeSensor

# Convert from radians to Quaternion
def make_quaternion(angle):
	q = tf.transformations.quaternion_from_euler(0, 0, angle)
	return Quaternion(*q)

def publish_value(value):
	angle = value * 2 * pi / 100.0
	q = make_quaternion(angle)
	pub.publish(q)

if __name__ == '__main__':
	global pub	
	rospy.init_node('fake_sensor')
	pub = rospy.Publisher('angle', Quaternion, queue_size=10)
	sensor = FakeSensor()
	sensor.sensor.register_callback(publish_value)
