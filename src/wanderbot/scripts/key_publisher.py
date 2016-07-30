#! /usr/bin/env python

import rospy
import sys, select, tty, termios
from std_msgs.msg import String

if __name__ == '__main__':
	# Create a Publisher to /keys
	key_pub = rospy.Publisher('keys', String, queue_size=1)

	# Initialize the node 
	rospy.init_node('keyboard_driver')

	# Publish rate = 100 Hz
	rate = rospy.Rate(100)
	
	# To get the keystrokes from the keyboard continuously and as soon as
	# they are pressed, we need to modify the way the Unix terminal operates.
	# Originally, the console buffers an entire line of text, only sending it
	# to programs when the user presses Enter. We want to receive the keys
	# as soon as they are pressed instead.

	old_attr = termios.tcgetattr(sys.stdin)	# Save original configuration
	tty.setcbreak(sys.stdin.fileno())		# Modify terminal operation
	
	print "Publishing keytroskes. Press Ctrl-C to exit..."

	while not rospy.is_shutdown():
		# If a user pressed a key, publish it to the /keys topic		
		if select.select([sys.stdin], [], [], 0)[0] == [sys.stdin]:
			key_pub.publish(sys.stdin.read(1))

		rate.sleep()	# Wait
	
	# As we modified the console configuration, we have to restore to the
	# original one, using the saved attributes.
	termios.tcsetattr(sys.stdin, termios.TCSADRAIN, old_attr)
