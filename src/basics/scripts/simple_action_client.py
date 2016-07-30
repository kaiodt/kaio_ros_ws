#! /usr/bin/env python

import rospy
import actionlib
from basics.msg import TimerAction, TimerGoal, TimerResult

# Initialize the node
rospy.init_node('timer_action_client')

# Create a SimpleActionClient (server_name, action_type)
client = actionlib.SimpleActionClient('timer', TimerAction)

# Wait for the action server to come up
client.wait_for_server()

# Create the goal
goal = TimerGoal()
goal.time_to_wait = rospy.Duration.from_sec(5.0)

# Send the goal to the server and wait for the result
client.send_goal(goal)
client.wait_for_result()

# Print the retrieved result
print('Time elapsed: %f'%(client.get_result().time_elapsed.to_sec()))

