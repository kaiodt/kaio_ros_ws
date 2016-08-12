#! /usr/bin/env python

"""
	twist_to_motors - converts a twist message to motor commands based on
	differential drive.
   
   
    Copyright (C) 2012 Jon Stephan. 
     
    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
"""

import rospy
import roslib
from std_msgs.msg import Float32
from geometry_msgs.msg import Twist

#############################################################
#############################################################
class TwistToMotors():
#############################################################
#############################################################

	#############################################################
	def __init__(self):
	#############################################################

		rospy.init_node("twist_to_motors")
		nodename = rospy.get_name()
		rospy.loginfo("%s started" % nodename)

		self.w = rospy.get_param("~base_width", 0.2)	# Distance between wheels

		# Publishers of the left and right target velocities (in m/sec)
		self.pub_lmotor = rospy.Publisher('lwheel_vtarget', Float32, queue_size=10)
		self.pub_rmotor = rospy.Publisher('rwheel_vtarget', Float32, queue_size=10)

		# Subscriber to get the Twist target velocity
		rospy.Subscriber('cmd_vel_mux/input/teleop', Twist, self.twistCallback)

		# Parameters for the loop that sets the target velocities
		self.rate = rospy.get_param("~rate", 50)
		self.timeout_ticks = rospy.get_param("~timeout_ticks", 2)

		# Left and right wheel velocities (in m/sec)
		self.left = 0
		self.right = 0

	#############################################################
	def spin(self):
	#############################################################

		r = rospy.Rate(self.rate)	# For the loop that sets the target velocities
		idle = rospy.Rate(10)		# For the main loop
		#then = rospy.Time.now()

		# Keep track of how many times the target set loop was executed
		self.ticks_since_target = self.timeout_ticks

		###### Main Loop  ######

		while not rospy.is_shutdown():

			###### Loop to set the target velocities  ######

			while not rospy.is_shutdown() and self.ticks_since_target < self.timeout_ticks:
				self.spinOnce()
				r.sleep()

			idle.sleep()

	#############################################################
	def spinOnce(self):
	#############################################################

		# Differential drive equations:
		# dx = (v_left + v_right) / 2
		# dr = (v_right - v_left) / w

		# Calculate the left and right velocities from differential drive equations
		self.left = 1.0 * self.dx - self.dr * self.w / 2        
		self.right = 1.0 * self.dx + self.dr * self.w / 2         

		rospy.logdebug("publishing wheel velocities: (left: %f, right: %f)" % (self.left, self.right))

		# Publish target velocities
		self.pub_lmotor.publish(self.left)
		self.pub_rmotor.publish(self.right)

		# Increment loop times counter
		self.ticks_since_target += 1

	#############################################################
	def twistCallback(self, msg):
	#############################################################

		rospy.logdebug("Twist message received in callback: %s" % str(msg))

		self.ticks_since_target = 0		# Reset loop times counter
		self.dx = msg.linear.x			# Linear x speed (in m/sec)
		self.dy = msg.linear.y			# Linear y speed (in m/sec)
		self.dr = msg.angular.z			# Angular z speed (in rad/sec)

#############################################################
#############################################################

if __name__ == '__main__':
	""" main """
	twistToMotors = TwistToMotors()
	twistToMotors.spin()
