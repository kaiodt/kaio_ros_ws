#! /usr/bin/env python

import rospy, tf
from gazebo_msgs.srv import *
from geometry_msgs.msg import *

if __name__ == '__main__':
	# Initialize node	
	rospy.init_node('stock_products')

	# Wait for the service we are going to use
	rospy.wait_for_service('gazebo/delete_model')
	rospy.wait_for_service('gazebo/spawn_sdf_model')
	
	# Create the ServiceProxy's
	delete_model = rospy.ServiceProxy('gazebo/delete_model', DeleteModel)
	spawn_model = rospy.ServiceProxy('gazebo/spawn_sdf_model', SpawnModel)

	# Define the orientation of the products (all the same)
	orient = Quaternion(*tf.transformations.quaternion_from_euler(0, 0, 0))

	# Load the product model file to send via ROS service
	with open("/home/kaiodt/kaio_ros_ws/src/stockroom_bot/models/product_0/model.sdf", 'r') as f:
		product_xml = f.read()

	# Delete all previous product models (to reset)
	for product_num in xrange(0, 12):
		item_name = "product_{0}_0".format(product_num)
		delete_model(item_name)

	# Spawn the products in the bins (fixed locations)
	for product_num in xrange(0, 12):
		bin_y = 2.8 * (product_num / 6) - 1.4
		bin_x = 0.5 * (product_num % 6) - 1.5

		# Set the item name and pose
		item_name = "product_{0}_0".format(product_num)
		item_pose = Pose(Point(x=bin_x, y=bin_y, z=2), orient)
		
		# Spawn the item
		spawn_model(item_name, product_xml, "", item_pose, "world")
