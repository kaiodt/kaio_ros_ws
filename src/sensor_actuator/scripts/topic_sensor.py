#! /usr/bin/env python

import rospy, tf
from math import pi
from geometry_msgs.msg import Quaternion
from fake_sensor import FakeSensor

# Convert from radians to Quaternion
def make_quaternion(angle):
	q = tf.transformations.quaternion_from_euler(0, 0, angle)
	return Quaternion(*q)

if __name__ == '__main__':
	sensor = FakeSensor()

	rospy.init_node('fake_sensor')

	pub = rospy.Publisher('angle', Quaternion, queue_size=10)

	rate = rospy.Rate(10)

	while not rospy.is_shutdown():
		# Take the raw value from the sensor and convert to radians
		angle = sensor.sensor.value() * 2 * pi / 100.0

		q = make_quaternion(angle)

		pub.publish(q)

		rate.sleep()
