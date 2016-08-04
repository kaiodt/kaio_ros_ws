#! /usr/bin/env python

import rospy
import actionlib
from basics.msg import TalkAction, TalkGoal, TalkResult

# Initialize the node
rospy.init_node('speaker_client')

# Create an action client and wait for the server
client = actionlib.SimpleActionClient('speak', TalkAction)
client.wait_for_server()

# Create a goal
goal = TalkGoal()
goal.sentence = "hello world, hello world, hello world, hello world"

# Send goal and wait for result
client.send_goal(goal)
client.wait_for_result()

# Print final status
print '[RESULT] State: %d' % client.get_state()
print '[RESULT] Status: %s'% client.get_goal_status_text()
