#! /usr/bin/env python

import sys, unittest, time
import rospy, rostest
from std_msgs.msg import String

class TestTalker(unittest.TestCase):
	def __init__(self, *args):
		super(TestTalker, self).__init__(*args)
		self.success = False

	# Callback function: signals if the correct message was received
	def callback(self, data):
		self.success = data.data and data.data.startswith('hello_world')

	# Function that runs the actual test
	def test_talker(self):
		# Initialize the node
		rospy.init_node('test_talker')
		# Subscribe to the /chatter topic
		rospy.Subscriber('chatter', String, self.callback)
		# Timeout = 10 sec
		timeout_t = time.time() + 10.0

		# Wait for either ROS shutdown, success or timeout
		while (not rospy.is_shutdown() and not self.success and time.time() < timeout_t):
			time.sleep(0.1)

		# Report the test result
		self.assert_(self.success)

if __name__ == '__main__':
	# (pkg, test_name, test_class, arguments)
	rostest.rosrun('basics', 'talker_test', TestTalker, sys.argv)
