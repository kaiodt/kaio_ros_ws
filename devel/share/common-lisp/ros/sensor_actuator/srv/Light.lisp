; Auto-generated. Do not edit!


(cl:in-package sensor_actuator-srv)


;//! \htmlinclude Light-request.msg.html

(cl:defclass <Light-request> (roslisp-msg-protocol:ros-message)
  ((on
    :reader on
    :initarg :on
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass Light-request (<Light-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Light-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Light-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sensor_actuator-srv:<Light-request> is deprecated: use sensor_actuator-srv:Light-request instead.")))

(cl:ensure-generic-function 'on-val :lambda-list '(m))
(cl:defmethod on-val ((m <Light-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sensor_actuator-srv:on-val is deprecated.  Use sensor_actuator-srv:on instead.")
  (on m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Light-request>) ostream)
  "Serializes a message object of type '<Light-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'on) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Light-request>) istream)
  "Deserializes a message object of type '<Light-request>"
    (cl:setf (cl:slot-value msg 'on) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Light-request>)))
  "Returns string type for a service object of type '<Light-request>"
  "sensor_actuator/LightRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Light-request)))
  "Returns string type for a service object of type 'Light-request"
  "sensor_actuator/LightRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Light-request>)))
  "Returns md5sum for a message object of type '<Light-request>"
  "a8e1711976dcda1b8b978eee81e85498")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Light-request)))
  "Returns md5sum for a message object of type 'Light-request"
  "a8e1711976dcda1b8b978eee81e85498")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Light-request>)))
  "Returns full string definition for message of type '<Light-request>"
  (cl:format cl:nil "bool on~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Light-request)))
  "Returns full string definition for message of type 'Light-request"
  (cl:format cl:nil "bool on~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Light-request>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Light-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Light-request
    (cl:cons ':on (on msg))
))
;//! \htmlinclude Light-response.msg.html

(cl:defclass <Light-response> (roslisp-msg-protocol:ros-message)
  ((status
    :reader status
    :initarg :status
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass Light-response (<Light-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Light-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Light-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sensor_actuator-srv:<Light-response> is deprecated: use sensor_actuator-srv:Light-response instead.")))

(cl:ensure-generic-function 'status-val :lambda-list '(m))
(cl:defmethod status-val ((m <Light-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sensor_actuator-srv:status-val is deprecated.  Use sensor_actuator-srv:status instead.")
  (status m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Light-response>) ostream)
  "Serializes a message object of type '<Light-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'status) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Light-response>) istream)
  "Deserializes a message object of type '<Light-response>"
    (cl:setf (cl:slot-value msg 'status) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Light-response>)))
  "Returns string type for a service object of type '<Light-response>"
  "sensor_actuator/LightResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Light-response)))
  "Returns string type for a service object of type 'Light-response"
  "sensor_actuator/LightResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Light-response>)))
  "Returns md5sum for a message object of type '<Light-response>"
  "a8e1711976dcda1b8b978eee81e85498")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Light-response)))
  "Returns md5sum for a message object of type 'Light-response"
  "a8e1711976dcda1b8b978eee81e85498")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Light-response>)))
  "Returns full string definition for message of type '<Light-response>"
  (cl:format cl:nil "bool status~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Light-response)))
  "Returns full string definition for message of type 'Light-response"
  (cl:format cl:nil "bool status~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Light-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Light-response>))
  "Converts a ROS message object to a list"
  (cl:list 'Light-response
    (cl:cons ':status (status msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'Light)))
  'Light-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'Light)))
  'Light-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Light)))
  "Returns string type for a service object of type '<Light>"
  "sensor_actuator/Light")