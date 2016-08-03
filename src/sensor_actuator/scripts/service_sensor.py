#! /usr/bin/env python

import rospy, tf
from math import pi
from fake_sensor import FakeSensor
from geometry_msgs.msg import Quaternion
from sensor_actuator.srv import FakeSensor, FakeSensorResponse

def make_quaternion(angle):
	q = tf.transformations.quaternion_from_euler(0, 0, angle)
	return Quaternion(*q)

def callback(request):
	angle = sensor.sensor.value() * 2 * pi / 100.0
	q = make_quaternion(angle)

	return FakeSensorResponse(q)

if __name__ == '__main__':
	sensor = FakeSensor()
	
	rospy.init_node('fake_sensor')

	service = rospy.Service('angle', FakeSensor, callback)


