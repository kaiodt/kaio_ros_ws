; Auto-generated. Do not edit!


(cl:in-package basics-msg)


;//! \htmlinclude TimerGoal.msg.html

(cl:defclass <TimerGoal> (roslisp-msg-protocol:ros-message)
  ((time_to_wait
    :reader time_to_wait
    :initarg :time_to_wait
    :type cl:real
    :initform 0))
)

(cl:defclass TimerGoal (<TimerGoal>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TimerGoal>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TimerGoal)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name basics-msg:<TimerGoal> is deprecated: use basics-msg:TimerGoal instead.")))

(cl:ensure-generic-function 'time_to_wait-val :lambda-list '(m))
(cl:defmethod time_to_wait-val ((m <TimerGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader basics-msg:time_to_wait-val is deprecated.  Use basics-msg:time_to_wait instead.")
  (time_to_wait m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TimerGoal>) ostream)
  "Serializes a message object of type '<TimerGoal>"
  (cl:let ((__sec (cl:floor (cl:slot-value msg 'time_to_wait)))
        (__nsec (cl:round (cl:* 1e9 (cl:- (cl:slot-value msg 'time_to_wait) (cl:floor (cl:slot-value msg 'time_to_wait)))))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 0) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __nsec) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TimerGoal>) istream)
  "Deserializes a message object of type '<TimerGoal>"
    (cl:let ((__sec 0) (__nsec 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 0) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __nsec) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'time_to_wait) (cl:+ (cl:coerce __sec 'cl:double-float) (cl:/ __nsec 1e9))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TimerGoal>)))
  "Returns string type for a message object of type '<TimerGoal>"
  "basics/TimerGoal")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TimerGoal)))
  "Returns string type for a message object of type 'TimerGoal"
  "basics/TimerGoal")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TimerGoal>)))
  "Returns md5sum for a message object of type '<TimerGoal>"
  "861563d4afc38bffed1a53c61a474261")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TimerGoal)))
  "Returns md5sum for a message object of type 'TimerGoal"
  "861563d4afc38bffed1a53c61a474261")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TimerGoal>)))
  "Returns full string definition for message of type '<TimerGoal>"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%# This is an action definition file, which has three parts: ~%# the goal, the result, and the feedback.~%#~%# Part 1: Goal, to be sent by the client~%#~%# The amount of time we want to wait~%duration time_to_wait~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TimerGoal)))
  "Returns full string definition for message of type 'TimerGoal"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%# This is an action definition file, which has three parts: ~%# the goal, the result, and the feedback.~%#~%# Part 1: Goal, to be sent by the client~%#~%# The amount of time we want to wait~%duration time_to_wait~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TimerGoal>))
  (cl:+ 0
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TimerGoal>))
  "Converts a ROS message object to a list"
  (cl:list 'TimerGoal
    (cl:cons ':time_to_wait (time_to_wait msg))
))
