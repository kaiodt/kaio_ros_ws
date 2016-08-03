;; Auto-generated. Do not edit!


(when (boundp 'sensor_actuator::FakeSensor)
  (if (not (find-package "SENSOR_ACTUATOR"))
    (make-package "SENSOR_ACTUATOR"))
  (shadow 'FakeSensor (find-package "SENSOR_ACTUATOR")))
(unless (find-package "SENSOR_ACTUATOR::FAKESENSOR")
  (make-package "SENSOR_ACTUATOR::FAKESENSOR"))
(unless (find-package "SENSOR_ACTUATOR::FAKESENSORREQUEST")
  (make-package "SENSOR_ACTUATOR::FAKESENSORREQUEST"))
(unless (find-package "SENSOR_ACTUATOR::FAKESENSORRESPONSE")
  (make-package "SENSOR_ACTUATOR::FAKESENSORRESPONSE"))

(in-package "ROS")



(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass sensor_actuator::FakeSensorRequest
  :super ros::object
  :slots ())

(defmethod sensor_actuator::FakeSensorRequest
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass sensor_actuator::FakeSensorResponse
  :super ros::object
  :slots (_quaternion ))

(defmethod sensor_actuator::FakeSensorResponse
  (:init
   (&key
    ((:quaternion __quaternion) (instance geometry_msgs::Quaternion :init))
    )
   (send-super :init)
   (setq _quaternion __quaternion)
   self)
  (:quaternion
   (&rest __quaternion)
   (if (keywordp (car __quaternion))
       (send* _quaternion __quaternion)
     (progn
       (if __quaternion (setq _quaternion (car __quaternion)))
       _quaternion)))
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/Quaternion _quaternion
    (send _quaternion :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/Quaternion _quaternion
       (send _quaternion :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/Quaternion _quaternion
     (send _quaternion :deserialize buf ptr-) (incf ptr- (send _quaternion :serialization-length))
   ;;
   self)
  )

(defclass sensor_actuator::FakeSensor
  :super ros::object
  :slots ())

(setf (get sensor_actuator::FakeSensor :md5sum-) "c3d2506862045c1ddfbe5c9ef23688f4")
(setf (get sensor_actuator::FakeSensor :datatype-) "sensor_actuator/FakeSensor")
(setf (get sensor_actuator::FakeSensor :request) sensor_actuator::FakeSensorRequest)
(setf (get sensor_actuator::FakeSensor :response) sensor_actuator::FakeSensorResponse)

(defmethod sensor_actuator::FakeSensorRequest
  (:response () (instance sensor_actuator::FakeSensorResponse :init)))

(setf (get sensor_actuator::FakeSensorRequest :md5sum-) "c3d2506862045c1ddfbe5c9ef23688f4")
(setf (get sensor_actuator::FakeSensorRequest :datatype-) "sensor_actuator/FakeSensorRequest")
(setf (get sensor_actuator::FakeSensorRequest :definition-)
      "
---
geometry_msgs/Quaternion quaternion


================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w
")

(setf (get sensor_actuator::FakeSensorResponse :md5sum-) "c3d2506862045c1ddfbe5c9ef23688f4")
(setf (get sensor_actuator::FakeSensorResponse :datatype-) "sensor_actuator/FakeSensorResponse")
(setf (get sensor_actuator::FakeSensorResponse :definition-)
      "
---
geometry_msgs/Quaternion quaternion


================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w
")



(provide :sensor_actuator/FakeSensor "c3d2506862045c1ddfbe5c9ef23688f4")


