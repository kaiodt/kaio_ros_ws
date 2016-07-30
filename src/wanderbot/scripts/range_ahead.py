#! /usr/bin/env python

import rospy
from sensor_msgs.msg import LaserScan

# Callback function. Executed when a message arrives.
def scan_callback(msg):
	# Distance to what is ahead of the robot
	range_ahead = msg.ranges[len(msg.ranges)/2]

	# Print
	print "Range ahead: %0.1f" % range_ahead

# Initialize the node
rospy.init_node('range_ahead')

# Create a Subscriber to topic /scan
scan_sub = rospy.Subscriber('scan', LaserScan, scan_callback)

# Give control to ROS
rospy.spin()
