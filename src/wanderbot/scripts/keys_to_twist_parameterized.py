#! /usr/bin/env python

import rospy
from std_msgs.msg import String
from geometry_msgs.msg import Twist

# Dictionary with the key mapping:
# key:[rot_vel,lin_vel]

key_mapping = {'w':[0,1], 'x':[0,-1],
               'a':[1,0], 'd':[-1,0],
               's':[0,0]}

# Velocity scales (default)
g_vel_scales = [0.1,0.1]

# Callback function
def keys_cb(msg, twist_pub):
	global g_last_twist			# Variable to store the last message sent
	global g_vel_scales			# Variable to store the velocity scale	

	# Certify that a valid and known key was received	
	if len(msg.data) == 0 or not key_mapping.has_key(msg.data[0]):
		return
	
	# Retrieve the velocities according to the key
	vels = key_mapping[msg.data[0]]

	# Prepare the message and publish						
	g_last_twist.angular.z = vels[0] * g_vel_scales[0]
	g_last_twist.linear.x = vels[1]  * g_vel_scales[1]
	twist_pub.publish(g_last_twist)

if __name__ == '__main__':
	# Initialize the node	
	rospy.init_node('keys_to_twist')
	
	# Create a Publisher to /cmd_vel
	twist_pub = rospy.Publisher('cmd_vel', Twist, queue_size=1)

	# Create a Subscriber to /keys
	rospy.Subscriber('keys', String, keys_cb, twist_pub)

	# Publish rate = 10 Hz
	rate = rospy.Rate(10)

	# Create initial message (empty)
	g_last_twist = Twist()

	# Check if the parameters were changed
	if rospy.has_param('~angular_scale'):
		g_vel_scales[0] = rospy.get_param('~angular_scale')
	else:
		rospy.logwarn("Angular scale not provided. Using %.1f" %\
                      g_vel_scales[0])

	if rospy.has_param('~linear_scale'):
		g_vel_scales[1] = rospy.get_param('~linear_scale')
	else:
		rospy.logwarn("Linear scale not provided. Using %.1f" %\
                      g_vel_scales[1])

	# Keep publishing the last message, which may change if a new key
	# is pressed.
	while not rospy.is_shutdown():
		twist_pub.publish(g_last_twist)
		rate.sleep()

