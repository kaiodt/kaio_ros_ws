#! /usr/bin/env python

import rospy
import time
import actionlib
from basics.msg import TimerAction, TimerGoal, TimerResult

# Callback funtion, invoked when a new goal is received
def do_timer(goal):
	start_time = time.time()					# Save current time
	time.sleep(goal.time_to_wait.to_sec())		# Wait the time given in the goal
	
	# Build the result message

	result = TimerResult()
	# Fill in the time_elapsed (ROS duration format)
	result.time_elapsed = rospy.Duration.from_sec(time.time() - start_time)
	# The updates functionality is not implemented here	
	result.updates_sent = 0		
	# Inform that we succeeded and return the result	
	server.set_succeeded(result)

# Initialize the node
rospy.init_node('timer_action_server')

# Create a SimpleActionServer (server_name, action_type, callback, autostart)
server = actionlib.SimpleActionServer('timer', TimerAction, do_timer, False)

# Start the server
server.start()

# Pass control to ROS and wait for goal messages
rospy.spin()

