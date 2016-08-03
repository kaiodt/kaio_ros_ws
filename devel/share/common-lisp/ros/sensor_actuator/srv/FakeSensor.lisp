; Auto-generated. Do not edit!


(cl:in-package sensor_actuator-srv)


;//! \htmlinclude FakeSensor-request.msg.html

(cl:defclass <FakeSensor-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass FakeSensor-request (<FakeSensor-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <FakeSensor-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'FakeSensor-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sensor_actuator-srv:<FakeSensor-request> is deprecated: use sensor_actuator-srv:FakeSensor-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <FakeSensor-request>) ostream)
  "Serializes a message object of type '<FakeSensor-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <FakeSensor-request>) istream)
  "Deserializes a message object of type '<FakeSensor-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<FakeSensor-request>)))
  "Returns string type for a service object of type '<FakeSensor-request>"
  "sensor_actuator/FakeSensorRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'FakeSensor-request)))
  "Returns string type for a service object of type 'FakeSensor-request"
  "sensor_actuator/FakeSensorRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<FakeSensor-request>)))
  "Returns md5sum for a message object of type '<FakeSensor-request>"
  "c3d2506862045c1ddfbe5c9ef23688f4")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'FakeSensor-request)))
  "Returns md5sum for a message object of type 'FakeSensor-request"
  "c3d2506862045c1ddfbe5c9ef23688f4")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<FakeSensor-request>)))
  "Returns full string definition for message of type '<FakeSensor-request>"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'FakeSensor-request)))
  "Returns full string definition for message of type 'FakeSensor-request"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <FakeSensor-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <FakeSensor-request>))
  "Converts a ROS message object to a list"
  (cl:list 'FakeSensor-request
))
;//! \htmlinclude FakeSensor-response.msg.html

(cl:defclass <FakeSensor-response> (roslisp-msg-protocol:ros-message)
  ((quaternion
    :reader quaternion
    :initarg :quaternion
    :type geometry_msgs-msg:Quaternion
    :initform (cl:make-instance 'geometry_msgs-msg:Quaternion)))
)

(cl:defclass FakeSensor-response (<FakeSensor-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <FakeSensor-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'FakeSensor-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sensor_actuator-srv:<FakeSensor-response> is deprecated: use sensor_actuator-srv:FakeSensor-response instead.")))

(cl:ensure-generic-function 'quaternion-val :lambda-list '(m))
(cl:defmethod quaternion-val ((m <FakeSensor-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sensor_actuator-srv:quaternion-val is deprecated.  Use sensor_actuator-srv:quaternion instead.")
  (quaternion m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <FakeSensor-response>) ostream)
  "Serializes a message object of type '<FakeSensor-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'quaternion) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <FakeSensor-response>) istream)
  "Deserializes a message object of type '<FakeSensor-response>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'quaternion) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<FakeSensor-response>)))
  "Returns string type for a service object of type '<FakeSensor-response>"
  "sensor_actuator/FakeSensorResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'FakeSensor-response)))
  "Returns string type for a service object of type 'FakeSensor-response"
  "sensor_actuator/FakeSensorResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<FakeSensor-response>)))
  "Returns md5sum for a message object of type '<FakeSensor-response>"
  "c3d2506862045c1ddfbe5c9ef23688f4")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'FakeSensor-response)))
  "Returns md5sum for a message object of type 'FakeSensor-response"
  "c3d2506862045c1ddfbe5c9ef23688f4")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<FakeSensor-response>)))
  "Returns full string definition for message of type '<FakeSensor-response>"
  (cl:format cl:nil "geometry_msgs/Quaternion quaternion~%~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'FakeSensor-response)))
  "Returns full string definition for message of type 'FakeSensor-response"
  (cl:format cl:nil "geometry_msgs/Quaternion quaternion~%~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <FakeSensor-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'quaternion))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <FakeSensor-response>))
  "Converts a ROS message object to a list"
  (cl:list 'FakeSensor-response
    (cl:cons ':quaternion (quaternion msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'FakeSensor)))
  'FakeSensor-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'FakeSensor)))
  'FakeSensor-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'FakeSensor)))
  "Returns string type for a service object of type '<FakeSensor>"
  "sensor_actuator/FakeSensor")