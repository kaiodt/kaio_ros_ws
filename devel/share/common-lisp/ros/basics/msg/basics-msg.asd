
(cl:in-package :asdf)

(defsystem "basics-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :actionlib_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "Complex" :depends-on ("_package_Complex"))
    (:file "_package_Complex" :depends-on ("_package"))
    (:file "TimerAction" :depends-on ("_package_TimerAction"))
    (:file "_package_TimerAction" :depends-on ("_package"))
    (:file "TimerResult" :depends-on ("_package_TimerResult"))
    (:file "_package_TimerResult" :depends-on ("_package"))
    (:file "TalkActionGoal" :depends-on ("_package_TalkActionGoal"))
    (:file "_package_TalkActionGoal" :depends-on ("_package"))
    (:file "TimerFeedback" :depends-on ("_package_TimerFeedback"))
    (:file "_package_TimerFeedback" :depends-on ("_package"))
    (:file "TalkGoal" :depends-on ("_package_TalkGoal"))
    (:file "_package_TalkGoal" :depends-on ("_package"))
    (:file "TimerActionResult" :depends-on ("_package_TimerActionResult"))
    (:file "_package_TimerActionResult" :depends-on ("_package"))
    (:file "TalkFeedback" :depends-on ("_package_TalkFeedback"))
    (:file "_package_TalkFeedback" :depends-on ("_package"))
    (:file "TalkResult" :depends-on ("_package_TalkResult"))
    (:file "_package_TalkResult" :depends-on ("_package"))
    (:file "TalkActionResult" :depends-on ("_package_TalkActionResult"))
    (:file "_package_TalkActionResult" :depends-on ("_package"))
    (:file "TimerActionGoal" :depends-on ("_package_TimerActionGoal"))
    (:file "_package_TimerActionGoal" :depends-on ("_package"))
    (:file "TalkActionFeedback" :depends-on ("_package_TalkActionFeedback"))
    (:file "_package_TalkActionFeedback" :depends-on ("_package"))
    (:file "TimerActionFeedback" :depends-on ("_package_TimerActionFeedback"))
    (:file "_package_TimerActionFeedback" :depends-on ("_package"))
    (:file "TalkAction" :depends-on ("_package_TalkAction"))
    (:file "_package_TalkAction" :depends-on ("_package"))
    (:file "TimerGoal" :depends-on ("_package_TimerGoal"))
    (:file "_package_TimerGoal" :depends-on ("_package"))
  ))