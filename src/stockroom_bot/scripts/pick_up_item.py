#! /usr/bin/env python

import os, sys, rospy, tf, actionlib, moveit_commander
from control_msgs.msg import (GripperCommandAction, GripperCommandGoal)
from geometry_msgs.msg import *
from tf.transformations import quaternion_from_euler
from look_at_bin import look_at_bin

if __name__ == '__main__':
 	moveit_commander.roscpp_initialize(sys.argv)
 	rospy.init_node('pick_up_item')

 	args = rospy.myargv(argv = sys.argv)

  	if len(args) != 2:
		print "usage: pick_up_item.py BIN_NUMBER"
		sys.exit(1)
  
	item_frame = "item_{0}".format(int(args[1]))

	gripper = actionlib.SimpleActionClient("gripper_controller/gripper_action",
    										GripperCommandAction)
	gripper.wait_for_server()

	arm = moveit_commander.MoveGroupCommander("arm")
	arm.allow_replanning(True)

	tf_listener = tf.TransformListener()
	rate = rospy.Rate(10)

	gripper_goal = GripperCommandGoal()
	gripper_goal.command.max_effort = 10.0

	p = Pose()
	p.position.x = 0.4
	p.position.z = 0.7
	p.orientation = Quaternion(*quaternion_from_euler(0, 1, 1))
  
	arm.set_pose_target(p)
	arm.go(True)

	look_at_bin()

	while not rospy.is_shutdown():
		rate.sleep()
    
		try:
			t = tf_listener.getLatestCommonTime('/base_link', item_frame)
      		
			if (rospy.Time.now() - t).to_sec() > 0.2:
				rospy.sleep(0.1)
				continue

			(item_translation, item_orientation) = \
				tf_listener.lookupTransform('/base_link', item_frame, t)
    
		except(tf.Exception, tf.LookupException,
			tf.ConnectivityException, tf.ExtrapolationException):
			continue

		gripper_goal.command.position = 0.15
		gripper.send_goal(gripper_goal) 
		gripper.wait_for_result(rospy.Duration(1.0))

		print "item: " + str(item_translation)
    	
		p.position.x = item_translation[0] - 0.01
		p.position.y = item_translation[1]
		p.position.z = item_translation[2] + 0.04
		p.orientation = Quaternion(*quaternion_from_euler(0, 1.2, 0))
    
		arm.set_pose_target(p)
		arm.go(True) 

		os.system("rosservice call clear_octomap") 
   
		gripper_goal.command.position = 0
		gripper.send_goal(gripper_goal)
		gripper.wait_for_result(rospy.Duration(2.0))

		p.position.x = 0.05
		p.position.y = -0.15
		p.position.z = 0.75
		p.orientation = Quaternion(*quaternion_from_euler(0, -1.5, -1.5))
    	
		arm.set_pose_target(p)
		arm.go(True)
    	
		break
