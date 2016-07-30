#! /usr/bin/env python

import rospy
import actionlib
import time
from basics.msg import TimerAction, TimerGoal, TimerResult, TimerFeedback

# Feedback callback. Executed when a feedback is received.
def feedback_cb(feedback):
	# Print contents of feedback message
	print('[Feedback] Time elapsed: %f'%(feedback.time_elapsed.to_sec()))
	print('[Feedback] Time remaining: %f'%(feedback.time_remaining.to_sec()))

# Initialize the node
rospy.init_node('timer_action_client')

# Create a SimpleActionClient (server_name, action_type)
client = actionlib.SimpleActionClient('timer', TimerAction)

# Wait for the action server to come up
client.wait_for_server()

# Create the goal
goal = TimerGoal()
goal.time_to_wait = rospy.Duration.from_sec(5.0)	# Fixed time: 5.0 sec
# Uncomment this line to test server-side abort:
#goal.time_to_wait = rospy.Duration.from_sec(500.0)

# Send the goal to the server (declare the feedback callback)
client.send_goal(goal, feedback_cb=feedback_cb)

# Uncomment these lines to test goal preemption:
time.sleep(3.0)
client.cancel_goal()

# Wait for the result and print it
client.wait_for_result()
print('[Result] State: %d'%(client.get_state()))
print('[Result] Status: %s'%(client.get_goal_status_text()))
print('[Result] Time elapsed: %f'%(client.get_result().time_elapsed.to_sec()))
print('[Result] Updates sent: %d'%(client.get_result().updates_sent))

