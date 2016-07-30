#! /usr/bin/env python

import rospy
from geometry_msgs.msg import Twist
from sensor_msgs.msg import LaserScan

# Callback function. Execute when a message is received in /scan
def scan_callback(msg):
	# Global variable for the distance to the closest object
	global g_range_ahead
	g_range_ahead = min(msg.ranges)

# Iniialize the variable with an arbitrary value (to start)
g_range_ahead = 1 

# Create a Subscriber to /scan
scan_sub = rospy.Subscriber('scan', LaserScan, scan_callback)

# Create a Publisher to /cmd_vel
cmd_vel_pub = rospy.Publisher('cmd_vel', Twist, queue_size=1)

# Initialize the node
rospy.init_node('wander')

# We alternate the state between forward/turning.
state_change_time = rospy.Time.now()	# Keep track of time
driving_forward = True					# Flag for forward/turning

# Publish to /cmd_vel at 10 Hz
rate = rospy.Rate(10)

while not rospy.is_shutdown():
	if driving_forward:
		# Check if an obstacle is too close or if it's time to change state
		if (g_range_ahead < 0.8 or rospy.Time.now() > state_change_time):
			driving_forward = False
			# We turn for 5 sec
			state_change_time = rospy.Time.now() + rospy.Duration(5)
	else:
		if rospy.Time.now() > state_change_time:
			driving_forward = True
			# We go forward for 10 sec
			state_change_time = rospy.Time.now() + rospy.Duration(15)
	
	# Create Twist message to publish
	twist = Twist()

	# Decide which velocity to publish (forward/turning)
	if driving_forward:
		twist.linear.x = 0.3
	else:
		twist.angular.z = 0.3
	
	# Publish to /cmd_vel
	cmd_vel_pub.publish(twist)
	
	# Wait for (1/10 sec)
	rate.sleep()

