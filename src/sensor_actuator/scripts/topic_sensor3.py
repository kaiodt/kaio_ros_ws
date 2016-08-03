#! /usr/bin/env python

import rospy, tf
from math import pi
from threading import Lock
from fake_sensor import FakeSensor
from geometry_msgs.msg import Quaternion

# Convert from radians to Quaternion
def make_quaternion(angle):
	q = tf.transformations.quaternion_from_angle(0, 0, angle)
	return Quaternion(*q)

def save_value(value):
	# Get the lock on angle
	with lock:
		# Update the value of angle, based on the sensor measurement
		angle = value * 2 * pi / 100.0

if __name__ == '__main__':
	# Create a lock for angle, to prevent simultaneous access	
	lock = Lock()

	sensor = FakeSensor()
	sensor.register_callback(save_value)

	rospy.init_node('fake_sensor')

	pub = rospy.Publisher('angle', Quaternion, queue_size=10)

	angle = None
	rate = rospy.Rate(10)

	while not rospy.is_shutdown():
		with lock:
			if angle:
				q = make_quaternion(angle)
				pub.publish(q)

		rate.sleep()
