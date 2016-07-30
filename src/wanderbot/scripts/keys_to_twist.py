#! /usr/bin/env python

import rospy
from std_msgs.msg import String
from geometry_msgs.msg import Twist

# Define desired linear and angular velocities
lin_vel = 0.5
ang_vel = 0.5

# Dictionary with the key mapping:
# key:[rot_vel,lin_vel]

key_mapping = {'w':[0,lin_vel], 'x':[0,-lin_vel],
               'a':[ang_vel,0], 'd':[-ang_vel,0],
               's':[0,0]}

# Callback function
def keys_cb(msg, twist_pub):
	# Certify that a valid and known key was received	
	if len(msg.data) == 0 or not key_mapping.has_key(msg.data[0]):
		return
	
	# Retrieve the velocities according to the key
	vels = key_mapping[msg.data[0]]

	# Prepare the message and publish		
	t = Twist()				
	t.angular.z = vels[0]
	t.linear.x = vels[1]
	twist_pub.publish(t)

if __name__ == '__main__':
	# Initialize the node	
	rospy.init_node('keys_to_twist')
	
	# Create a Publisher to /cmd_vel
	twist_pub = rospy.Publisher('cmd_vel', Twist, queue_size=1)

	# Create a Subscriber to /keys
	rospy.Subscriber('keys', String, keys_cb, twist_pub)

	# Give control to ROS	
	rospy.spin()
	
