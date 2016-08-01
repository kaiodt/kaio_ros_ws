#! /usr/bin/env python

import sys, rospy, tf, actionlib
from geometry_msgs.msg import *
from move_base_msgs.msg import MoveBaseAction, MoveBaseGoal
from tf.transformations import quaternion_from_euler
from std_srvs.srv import Empty
from look_at_bin import look_at_bin

if __name__ == '__main__':
	# Initialize the node	
	rospy.init_node('go_to_bin')

	# Clear the existing cost maps using the appropriate service
	rospy.wait_for_service("/move_base/clear_costmaps")
	rospy.ServiceProxy("/move_base/clear_costmaps", Empty)()
	
	# Get the bin_number from the command line (arguments)
	args = rospy.myargv(argv=sys.argv)
	
	# Certify that a corrent number of arguments was entered
	if len(args) != 2:
		print "Usage: go_to_bin.py BIN_NUMBER"
		sys,exit(1)

	bin_number = int(args[1])

	# Create a client for 'move_base' action	
	move_base = actionlib.SimpleActionClient('move_base', MoveBaseAction)
	move_base.wait_for_server()

	# Create the goal pose from based on the bin number
	goal = MoveBaseGoal()
	goal.target_pose.header.frame_id = 'map'
	goal.target_pose.pose.position.x = 0.5 * (bin_number % 6) - 1.5
	goal.target_pose.pose.position.y = 1.1 * (bin_number / 6) - 0.55

	if bin_number >= 6:
		yaw = 1.57
	else:
		yaw = -1.57

	orient = Quaternion(*quaternion_from_euler(0, 0, yaw))

	goal.target_pose.pose.orientation = orient

	# Send goal and wait for result
	move_base.send_goal(goal)
	move_base.wait_for_result()

	# Look at bin
	look_at_bin()
	
