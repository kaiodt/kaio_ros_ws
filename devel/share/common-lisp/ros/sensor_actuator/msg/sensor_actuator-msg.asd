
(cl:in-package :asdf)

(defsystem "sensor_actuator-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :actionlib_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "RotationActionResult" :depends-on ("_package_RotationActionResult"))
    (:file "_package_RotationActionResult" :depends-on ("_package"))
    (:file "RotationActionFeedback" :depends-on ("_package_RotationActionFeedback"))
    (:file "_package_RotationActionFeedback" :depends-on ("_package"))
    (:file "RotationFeedback" :depends-on ("_package_RotationFeedback"))
    (:file "_package_RotationFeedback" :depends-on ("_package"))
    (:file "RotationActionGoal" :depends-on ("_package_RotationActionGoal"))
    (:file "_package_RotationActionGoal" :depends-on ("_package"))
    (:file "RotationGoal" :depends-on ("_package_RotationGoal"))
    (:file "_package_RotationGoal" :depends-on ("_package"))
    (:file "RotationResult" :depends-on ("_package_RotationResult"))
    (:file "_package_RotationResult" :depends-on ("_package"))
    (:file "RotationAction" :depends-on ("_package_RotationAction"))
    (:file "_package_RotationAction" :depends-on ("_package"))
  ))