#! /usr/bin/env python

import rospy
import math
from std_msgs.msg import String
from geometry_msgs.msg import Twist

# Dictionary with the key mapping:
# key:[rot_vel,lin_vel]

key_mapping = {'w':[0,1], 'x':[0,-1],
               'a':[1,0], 'd':[-1,0],
               's':[0,0]}

#g_twist_pub = None
#g_target_twist = None
#g_last_twist = None
#g_last_send_time = None
#g_vel_scales = [0.1, 0.1]
#g_vel_ramps = [1, 1]


# Step a velocity (scalar) towards the a target (if needed)
def ramped_vel(v_prev, v_target, t_prev, t_now, ramp_rate):
	step = ramp_rate * (t_now - t_prev).to_sec()	# Step size
	sign = 1.0 if (v_target > v_prev) else -1.0		# Increase/Decrease
	error = math.fabs(v_target - v_prev)			# Error
	
	# If the target can be achieved in this step, return it.
	if error < step:
		return v_target
	# Else, update the current velocity 
	else:
		return v_prev + sign * step

# Step the Twisted type velocity using the ramped_vel method
def ramped_twist(prev, target, t_prev, t_now, ramps):
	tw = Twist()
	tw.angular.z = \
		ramped_vel(prev.angular.z, target.angular.z, t_prev, t_now, ramps[0])
	tw.linear.x = \
		ramped_vel(prev.linear.x, target.linear.x, t_prev, t_now, ramps[1])

	return tw

# Update the current Twist velocity and publish to /cmd_vel
def send_twist():
	global g_last_twist_send_time, g_target_twist, g_last_twist
	global g_vel_ramps, g_twist_pub

	t_now = rospy.Time.now()	# Get current time

	# Update the velocities
	g_last_twist = \
	ramped_twist(g_last_twist, g_target_twist, g_last_twist_send_time, t_now, g_vel_ramps)
	
	# Update time of last updated velocity
	g_last_twist_send_time = t_now

	# Publish Twist velocity to /cmd_vel
	g_twist_pub.publish(g_last_twist)

# Callback function. Executed when a message is received in /keys.
def keys_cb(msg):
	global g_target_twist, g_vel_scales
	
	# Certify that a valid and known key was received	
	if len(msg.data) == 0 or not key_mapping.has_key(msg.data[0]):
		return

	# Retrieve the velocities according to the key
	vels = key_mapping[msg.data[0]]

	# Update the target velocity values
	g_target_twist.angular.z = vels[0] * g_vel_scales[0]
	g_target_twist.linear.x = vels[1]  * g_vel_scales[1]

# Get the parameters (if defined), or return the default values
def fetch_param(name, default):
	if rospy.has_param(name):
		return rospy.get_param(name)
	else:
		rospy.logwarn("Parameter [%s] not defined. Defaulting to %.3f" %\
                      (name, default))
		return default

if __name__ == '__main__':
	# Initialize the node	
	rospy.init_node('keys_to_twist')
	
	# Create a Publisher to /cmd_vel
	g_twist_pub = rospy.Publisher('cmd_vel', Twist, queue_size=1)

	# Create a Subscriber to /keys
	rospy.Subscriber('keys', String, keys_cb)
	
	# Create two Twist global variables	
	g_target_twist = Twist()	# Target velocity. Updated from /keys.
	g_last_twist = Twist()		# Last velocity. Updated by the ramp procedure.
	
	# Create global variables for the velocities and accelerations (default values)
	g_vel_scales = [0.1, 0.1]
	g_vel_ramps = [1.0, 1.0]

	# Verify if the parameters were set. If not, set to default values.
	g_vel_scales[0] = fetch_param('~angular_scale', 0.1)	# Angular velocity
	g_vel_scales[1] = fetch_param('~linear_scale', 0.1)		# Linear velocity
	g_vel_ramps[0] = fetch_param('~angular_accel', 1.0)		# Angular acceleration
	g_vel_ramps[1] = fetch_param('~linear_accel', 1.0)		# Linear acceleration

	# Publish rate = 20 Hz
	rate = rospy.Rate(20)
	
	# Keep track of the time in order to step through the target velocity
	g_last_twist_send_time = rospy.Time.now()

	# Main loop
	while not rospy.is_shutdown():
		send_twist()
		rate.sleep()

