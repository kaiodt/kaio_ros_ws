#! /usr/bin/env python

import rospy
import threading, time, pyttsx
import actionlib
from basics.msg import TalkAction, TalkGoal, TalkResult

class TalkNode:

	def __init__(self, node_name, action_name):
		# Initialize the node
		rospy.init_node(node_name)
		# Create the action server
		self.server = actionlib.SimpleActionServer(action_name, TalkAction, self.do_talk, False)
		# Initialize the speech engine		
		self.engine = pyttsx.init()
		# Create the thread that will run the event loop
		self.engine_thread = threading.Thread(target=self.loop)
		# Start the thread		
		self.engine_thread.start()
		# Set the parameters (from the parameter server or default values)
		self.engine.setProperty('volume', rospy.get_param('~volume', 1.0))
		self.engine.setProperty('rate', rospy.get_param('~rate', 200.0))
		self.preempt = rospy.get_param('~preempt', False)
		# Start the action server
		self.server.start()

	# Thread for the pyttsx event loop (we use an external loop)
	def loop(self):
		self.engine.startLoop(False)
		
		# Check if it's time to shut down in between repeated calls to the library's
		# iterate() function
		while not rospy.is_shutdown():
			self.engine.iterate()
			time.sleep(0.1)
		
		# End the pyttsx loop when the external loop is shut down (ROS)
		self.engine.endLoop()
	
	# Goal callback function
	def do_talk(self, goal):
		# Pass goal to the speech engine
		self.engine.say(goal.sentence)

		# Monitor for completion
		while self.engine.isBusy():
			# If preemption during execution is enabled and one is requested, stop
			if self.preempt and self.server.is_preempted_requested():
				self.engine.stop()
				
				# Wait until the engine loop is completely finished
				while self.engine.isBusy():
					time.sleep(0.1)
				
				# Report the preemption via the action server
				self.server.set_preempted(TalkResult(), "Talk preempted.")
				return

			time.sleep(0.1)
		
		# If there is no preemption, report successful result
		self.server.set_succeeded(TalkResult(), "Talk completed successfully.")

# Instantiate a TalkNode object
talker = TalkNode('speaker', 'speak')

# Pass control to ROS
rospy.spin()
