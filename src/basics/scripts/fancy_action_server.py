#! /usr/bin/env python

import rospy
import time
import actionlib
from basics.msg import TimerAction, TimerGoal, TimerResult, TimerFeedback

# Callback funtion, invoked when a new goal is received
def do_timer(goal):
	start_time = time.time()		# Save current time
	update_count = 0				# Initialize update counter
	
	# The maximum time is 60 seconds. Abort if given goal is greater.
	if goal.time_to_wait.to_sec() > 60.0:
		result = TimerResult()
		result.time_elapsed = rospy.Duration.from_sec(time.time() - start_time)
		result.updates_sent = update_count
		server.set_aborted(result, "Timer aborted due to too long wait")
		return
	
	# Go over the goal time in 1.0 s increments, testing for preemption and
	# sending updates in between pauses
	while (time.time() - start_time) < goal.time_to_wait.to_sec():
		
		# Check for preemption and abort if true
		if server.is_preempt_requested():
			result = TimerResult()
			result.time_elapsed = rospy.Duration.from_sec(time.time() - start_time)
			result.updates_sent = update_count
			server.set_preempted(result, "Timer preempted")
			return
		
		# Send feedback
		feedback = TimerFeedback()
		feedback.time_elapsed = rospy.Duration.from_sec(time.time() - start_time)
		feedback.time_remaining = goal.time_to_wait - feedback.time_elapsed
		server.publish_feedback(feedback)
		update_count += 1		# Increment update counter
		
		# Sleep for 1.0 sec
		time.sleep(1.0)
	
	# If the loop is concluded, the timer succeeded. Send the final result.
	result = TimerResult()
	result.time_elapsed = rospy.Duration.from_sec(time.time() - start_time)
	result.updates_sent = update_count
	server.set_succeeded(result, "Timer completed successfully")

# Initialize the node
rospy.init_node('fancy_action_server')

# Create a SimpleActionServer (server_name, action_type, callback, autostart)
server = actionlib.SimpleActionServer('timer', TimerAction, do_timer, False)

# Start the server
server.start()

# Pass control to ROS and wait for goal messages
rospy.spin()

