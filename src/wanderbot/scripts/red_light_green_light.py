#! /usr/bin/env python

import rospy
from geometry_msgs.msg import Twist

# Create a Publisher
cmd_vel_pub = rospy.Publisher('cmd_vel', Twist, queue_size=1)

# Initialize the node
rospy.init_node('red_light_green_light')

# Create the two messsages
red_light_twist = Twist()			# Stop
green_light_twist = Twist()			# Go forward
green_light_twist.linear.x = 0.5

driving_forward = False					# Flag for run/stop
light_change_time = rospy.Time.now()	# Keep track of change
rate = rospy.Rate(10)					# Publish rate (10 Hz)

while not rospy.is_shutdown():
	if driving_forward:
		cmd_vel_pub.publish(green_light_twist)	# Go forward
	else:
		cmd_vel_pub.publish(red_light_twist)	# Stop

	# Change the state each 3 sec	
	if light_change_time < rospy.Time.now():
		driving_forward = not driving_forward
		light_change_time = rospy.Time.now() + rospy.Duration(3)
	
	rate.sleep()
