#! /usr/bin/env python

import rospy, actionlib
from fake_actuator import FakeActuator
from std_msgs.msg import Float32
from sensor_actuator.srv import Light, LightResponse
from sensor_actuator.msg import RotationAction, RotationFeedback, RotationResult

def volume_callback(msg):
	actuator.set_volume(min(100, max(0, int(msg.data * 100))))

def light_callback(request):
	actuator.toggle_light(request.on)
	return LightResponse(actuator.light_on())

def rotation_callback(goal):
	feedback = RotationFeedback()
	result = RotationResult()

	actuator.set_position(goal.orientation)
	success = True

	rate = rospy.Rate(10)

	while fabs(goal.orientation - actuator.position()) > 0.01:
		if a.is_preempt_requested():
			success = False
			break

		feedback.current_orientation = actuator.position()
		a.publish_feedback(feedback)
		rate.sleep()

	result.final_orientation = actuator.position()

	if success:
		a.set_succeeded(result)
	else:
		a.set_preempted(result)

if __name__ == '__main__':
	actuator = FakeActuator()

	# Initialize the node
	rospy.init_node('fake_actuator')

	# Topic for the volume
	t = rospy.Subscriber('fake_actuator/volume', Float32, volume_callback)

	# Service for the light
	s = rospy.Service('fake_actuator/light', Light, light_callback)

	# Action for the position
	a = actionlib.SimpleActionServer('fake_actuator/position', RotationAction, 
									 execute_cb = rotation_callback,
									 auto_start = False)

	a.start()

	# Start everything
	rospy.spin()
