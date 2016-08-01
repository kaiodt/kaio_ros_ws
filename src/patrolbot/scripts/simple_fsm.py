#! /usr/bin/env python

import rospy
from smach import State, StateMachine
from time import sleep

# Define the states - Classes that inherit from the State class

class One(State):
	def __init__(self):
		# Call the parent class constructor, passing all the possible outcomes of the state
		State.__init__(self, outcomes=['success'])
	
	# execute method - where the actions are descripted
	def execute(self, userdata):
		print 'one'
		sleep(1)

		return 'success'	# One of the outcomes should be returned

class Two(State):
	def __init__(self):
		# Call the parent class constructor, passing all the possible outcomes of the state
		State.__init__(self, outcomes=['success'])

	# execute method - where the actions are descripted
	def execute(self, userdata):
		print 'two'
		sleep(1)

		return 'success'	# One of the outcomes should be returned

if __name__ == '__main__':
	# Create a StateMachine, passing a list of its possible overall outcomes	
	sm = StateMachine(outcomes=['success'])

	# Populate the state machine with our states
	with sm:
		# (state_name, state_instance, transitions={dict with the transitions})
		StateMachine.add('ONE', One(), transitions={'success':'TWO'})
		StateMachine.add('TWO', Two(), transitions={'success':'ONE'})

	# Execute the state machine
	sm.execute()
