;; Auto-generated. Do not edit!


(when (boundp 'sensor_actuator::Light)
  (if (not (find-package "SENSOR_ACTUATOR"))
    (make-package "SENSOR_ACTUATOR"))
  (shadow 'Light (find-package "SENSOR_ACTUATOR")))
(unless (find-package "SENSOR_ACTUATOR::LIGHT")
  (make-package "SENSOR_ACTUATOR::LIGHT"))
(unless (find-package "SENSOR_ACTUATOR::LIGHTREQUEST")
  (make-package "SENSOR_ACTUATOR::LIGHTREQUEST"))
(unless (find-package "SENSOR_ACTUATOR::LIGHTRESPONSE")
  (make-package "SENSOR_ACTUATOR::LIGHTRESPONSE"))

(in-package "ROS")





(defclass sensor_actuator::LightRequest
  :super ros::object
  :slots (_on ))

(defmethod sensor_actuator::LightRequest
  (:init
   (&key
    ((:on __on) nil)
    )
   (send-super :init)
   (setq _on __on)
   self)
  (:on
   (&optional __on)
   (if __on (setq _on __on)) _on)
  (:serialization-length
   ()
   (+
    ;; bool _on
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _on
       (if _on (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _on
     (setq _on (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass sensor_actuator::LightResponse
  :super ros::object
  :slots (_status ))

(defmethod sensor_actuator::LightResponse
  (:init
   (&key
    ((:status __status) nil)
    )
   (send-super :init)
   (setq _status __status)
   self)
  (:status
   (&optional __status)
   (if __status (setq _status __status)) _status)
  (:serialization-length
   ()
   (+
    ;; bool _status
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _status
       (if _status (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _status
     (setq _status (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass sensor_actuator::Light
  :super ros::object
  :slots ())

(setf (get sensor_actuator::Light :md5sum-) "a8e1711976dcda1b8b978eee81e85498")
(setf (get sensor_actuator::Light :datatype-) "sensor_actuator/Light")
(setf (get sensor_actuator::Light :request) sensor_actuator::LightRequest)
(setf (get sensor_actuator::Light :response) sensor_actuator::LightResponse)

(defmethod sensor_actuator::LightRequest
  (:response () (instance sensor_actuator::LightResponse :init)))

(setf (get sensor_actuator::LightRequest :md5sum-) "a8e1711976dcda1b8b978eee81e85498")
(setf (get sensor_actuator::LightRequest :datatype-) "sensor_actuator/LightRequest")
(setf (get sensor_actuator::LightRequest :definition-)
      "bool on
---
bool status

")

(setf (get sensor_actuator::LightResponse :md5sum-) "a8e1711976dcda1b8b978eee81e85498")
(setf (get sensor_actuator::LightResponse :datatype-) "sensor_actuator/LightResponse")
(setf (get sensor_actuator::LightResponse :definition-)
      "bool on
---
bool status

")



(provide :sensor_actuator/Light "a8e1711976dcda1b8b978eee81e85498")


