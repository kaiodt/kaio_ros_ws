# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "sensor_actuator: 7 messages, 2 services")

set(MSG_I_FLAGS "-Isensor_actuator:/home/kaiodt/kaio_ros_ws/devel/share/sensor_actuator/msg;-Istd_msgs:/opt/ros/indigo/share/std_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/indigo/share/geometry_msgs/cmake/../msg;-Iactionlib_msgs:/opt/ros/indigo/share/actionlib_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(sensor_actuator_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/kaiodt/kaio_ros_ws/devel/share/sensor_actuator/msg/RotationGoal.msg" NAME_WE)
add_custom_target(_sensor_actuator_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "sensor_actuator" "/home/kaiodt/kaio_ros_ws/devel/share/sensor_actuator/msg/RotationGoal.msg" ""
)

get_filename_component(_filename "/home/kaiodt/kaio_ros_ws/devel/share/sensor_actuator/msg/RotationFeedback.msg" NAME_WE)
add_custom_target(_sensor_actuator_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "sensor_actuator" "/home/kaiodt/kaio_ros_ws/devel/share/sensor_actuator/msg/RotationFeedback.msg" ""
)

get_filename_component(_filename "/home/kaiodt/kaio_ros_ws/devel/share/sensor_actuator/msg/RotationActionFeedback.msg" NAME_WE)
add_custom_target(_sensor_actuator_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "sensor_actuator" "/home/kaiodt/kaio_ros_ws/devel/share/sensor_actuator/msg/RotationActionFeedback.msg" "actionlib_msgs/GoalStatus:actionlib_msgs/GoalID:std_msgs/Header:sensor_actuator/RotationFeedback"
)

get_filename_component(_filename "/home/kaiodt/kaio_ros_ws/src/sensor_actuator/srv/FakeSensor.srv" NAME_WE)
add_custom_target(_sensor_actuator_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "sensor_actuator" "/home/kaiodt/kaio_ros_ws/src/sensor_actuator/srv/FakeSensor.srv" "geometry_msgs/Quaternion"
)

get_filename_component(_filename "/home/kaiodt/kaio_ros_ws/src/sensor_actuator/srv/Light.srv" NAME_WE)
add_custom_target(_sensor_actuator_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "sensor_actuator" "/home/kaiodt/kaio_ros_ws/src/sensor_actuator/srv/Light.srv" ""
)

get_filename_component(_filename "/home/kaiodt/kaio_ros_ws/devel/share/sensor_actuator/msg/RotationActionGoal.msg" NAME_WE)
add_custom_target(_sensor_actuator_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "sensor_actuator" "/home/kaiodt/kaio_ros_ws/devel/share/sensor_actuator/msg/RotationActionGoal.msg" "sensor_actuator/RotationGoal:actionlib_msgs/GoalID:std_msgs/Header"
)

get_filename_component(_filename "/home/kaiodt/kaio_ros_ws/devel/share/sensor_actuator/msg/RotationActionResult.msg" NAME_WE)
add_custom_target(_sensor_actuator_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "sensor_actuator" "/home/kaiodt/kaio_ros_ws/devel/share/sensor_actuator/msg/RotationActionResult.msg" "actionlib_msgs/GoalStatus:actionlib_msgs/GoalID:std_msgs/Header:sensor_actuator/RotationResult"
)

get_filename_component(_filename "/home/kaiodt/kaio_ros_ws/devel/share/sensor_actuator/msg/RotationResult.msg" NAME_WE)
add_custom_target(_sensor_actuator_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "sensor_actuator" "/home/kaiodt/kaio_ros_ws/devel/share/sensor_actuator/msg/RotationResult.msg" ""
)

get_filename_component(_filename "/home/kaiodt/kaio_ros_ws/devel/share/sensor_actuator/msg/RotationAction.msg" NAME_WE)
add_custom_target(_sensor_actuator_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "sensor_actuator" "/home/kaiodt/kaio_ros_ws/devel/share/sensor_actuator/msg/RotationAction.msg" "sensor_actuator/RotationActionGoal:sensor_actuator/RotationFeedback:actionlib_msgs/GoalStatus:actionlib_msgs/GoalID:sensor_actuator/RotationResult:sensor_actuator/RotationActionFeedback:sensor_actuator/RotationActionResult:sensor_actuator/RotationGoal:std_msgs/Header"
)

#
#  langs = gencpp;geneus;genlisp;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(sensor_actuator
  "/home/kaiodt/kaio_ros_ws/devel/share/sensor_actuator/msg/RotationActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/home/kaiodt/kaio_ros_ws/devel/share/sensor_actuator/msg/RotationFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sensor_actuator
)
_generate_msg_cpp(sensor_actuator
  "/home/kaiodt/kaio_ros_ws/devel/share/sensor_actuator/msg/RotationFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sensor_actuator
)
_generate_msg_cpp(sensor_actuator
  "/home/kaiodt/kaio_ros_ws/devel/share/sensor_actuator/msg/RotationGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sensor_actuator
)
_generate_msg_cpp(sensor_actuator
  "/home/kaiodt/kaio_ros_ws/devel/share/sensor_actuator/msg/RotationActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/home/kaiodt/kaio_ros_ws/devel/share/sensor_actuator/msg/RotationGoal.msg;/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sensor_actuator
)
_generate_msg_cpp(sensor_actuator
  "/home/kaiodt/kaio_ros_ws/devel/share/sensor_actuator/msg/RotationResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sensor_actuator
)
_generate_msg_cpp(sensor_actuator
  "/home/kaiodt/kaio_ros_ws/devel/share/sensor_actuator/msg/RotationActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/home/kaiodt/kaio_ros_ws/devel/share/sensor_actuator/msg/RotationResult.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sensor_actuator
)
_generate_msg_cpp(sensor_actuator
  "/home/kaiodt/kaio_ros_ws/devel/share/sensor_actuator/msg/RotationAction.msg"
  "${MSG_I_FLAGS}"
  "/home/kaiodt/kaio_ros_ws/devel/share/sensor_actuator/msg/RotationActionGoal.msg;/home/kaiodt/kaio_ros_ws/devel/share/sensor_actuator/msg/RotationFeedback.msg;/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/kaiodt/kaio_ros_ws/devel/share/sensor_actuator/msg/RotationResult.msg;/home/kaiodt/kaio_ros_ws/devel/share/sensor_actuator/msg/RotationActionFeedback.msg;/home/kaiodt/kaio_ros_ws/devel/share/sensor_actuator/msg/RotationActionResult.msg;/home/kaiodt/kaio_ros_ws/devel/share/sensor_actuator/msg/RotationGoal.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sensor_actuator
)

### Generating Services
_generate_srv_cpp(sensor_actuator
  "/home/kaiodt/kaio_ros_ws/src/sensor_actuator/srv/Light.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sensor_actuator
)
_generate_srv_cpp(sensor_actuator
  "/home/kaiodt/kaio_ros_ws/src/sensor_actuator/srv/FakeSensor.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sensor_actuator
)

### Generating Module File
_generate_module_cpp(sensor_actuator
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sensor_actuator
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(sensor_actuator_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(sensor_actuator_generate_messages sensor_actuator_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/kaiodt/kaio_ros_ws/devel/share/sensor_actuator/msg/RotationGoal.msg" NAME_WE)
add_dependencies(sensor_actuator_generate_messages_cpp _sensor_actuator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/kaiodt/kaio_ros_ws/devel/share/sensor_actuator/msg/RotationFeedback.msg" NAME_WE)
add_dependencies(sensor_actuator_generate_messages_cpp _sensor_actuator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/kaiodt/kaio_ros_ws/devel/share/sensor_actuator/msg/RotationActionFeedback.msg" NAME_WE)
add_dependencies(sensor_actuator_generate_messages_cpp _sensor_actuator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/kaiodt/kaio_ros_ws/src/sensor_actuator/srv/FakeSensor.srv" NAME_WE)
add_dependencies(sensor_actuator_generate_messages_cpp _sensor_actuator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/kaiodt/kaio_ros_ws/src/sensor_actuator/srv/Light.srv" NAME_WE)
add_dependencies(sensor_actuator_generate_messages_cpp _sensor_actuator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/kaiodt/kaio_ros_ws/devel/share/sensor_actuator/msg/RotationActionGoal.msg" NAME_WE)
add_dependencies(sensor_actuator_generate_messages_cpp _sensor_actuator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/kaiodt/kaio_ros_ws/devel/share/sensor_actuator/msg/RotationActionResult.msg" NAME_WE)
add_dependencies(sensor_actuator_generate_messages_cpp _sensor_actuator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/kaiodt/kaio_ros_ws/devel/share/sensor_actuator/msg/RotationResult.msg" NAME_WE)
add_dependencies(sensor_actuator_generate_messages_cpp _sensor_actuator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/kaiodt/kaio_ros_ws/devel/share/sensor_actuator/msg/RotationAction.msg" NAME_WE)
add_dependencies(sensor_actuator_generate_messages_cpp _sensor_actuator_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(sensor_actuator_gencpp)
add_dependencies(sensor_actuator_gencpp sensor_actuator_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS sensor_actuator_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(sensor_actuator
  "/home/kaiodt/kaio_ros_ws/devel/share/sensor_actuator/msg/RotationActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/home/kaiodt/kaio_ros_ws/devel/share/sensor_actuator/msg/RotationFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sensor_actuator
)
_generate_msg_eus(sensor_actuator
  "/home/kaiodt/kaio_ros_ws/devel/share/sensor_actuator/msg/RotationFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sensor_actuator
)
_generate_msg_eus(sensor_actuator
  "/home/kaiodt/kaio_ros_ws/devel/share/sensor_actuator/msg/RotationGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sensor_actuator
)
_generate_msg_eus(sensor_actuator
  "/home/kaiodt/kaio_ros_ws/devel/share/sensor_actuator/msg/RotationActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/home/kaiodt/kaio_ros_ws/devel/share/sensor_actuator/msg/RotationGoal.msg;/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sensor_actuator
)
_generate_msg_eus(sensor_actuator
  "/home/kaiodt/kaio_ros_ws/devel/share/sensor_actuator/msg/RotationResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sensor_actuator
)
_generate_msg_eus(sensor_actuator
  "/home/kaiodt/kaio_ros_ws/devel/share/sensor_actuator/msg/RotationActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/home/kaiodt/kaio_ros_ws/devel/share/sensor_actuator/msg/RotationResult.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sensor_actuator
)
_generate_msg_eus(sensor_actuator
  "/home/kaiodt/kaio_ros_ws/devel/share/sensor_actuator/msg/RotationAction.msg"
  "${MSG_I_FLAGS}"
  "/home/kaiodt/kaio_ros_ws/devel/share/sensor_actuator/msg/RotationActionGoal.msg;/home/kaiodt/kaio_ros_ws/devel/share/sensor_actuator/msg/RotationFeedback.msg;/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/kaiodt/kaio_ros_ws/devel/share/sensor_actuator/msg/RotationResult.msg;/home/kaiodt/kaio_ros_ws/devel/share/sensor_actuator/msg/RotationActionFeedback.msg;/home/kaiodt/kaio_ros_ws/devel/share/sensor_actuator/msg/RotationActionResult.msg;/home/kaiodt/kaio_ros_ws/devel/share/sensor_actuator/msg/RotationGoal.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sensor_actuator
)

### Generating Services
_generate_srv_eus(sensor_actuator
  "/home/kaiodt/kaio_ros_ws/src/sensor_actuator/srv/Light.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sensor_actuator
)
_generate_srv_eus(sensor_actuator
  "/home/kaiodt/kaio_ros_ws/src/sensor_actuator/srv/FakeSensor.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sensor_actuator
)

### Generating Module File
_generate_module_eus(sensor_actuator
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sensor_actuator
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(sensor_actuator_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(sensor_actuator_generate_messages sensor_actuator_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/kaiodt/kaio_ros_ws/devel/share/sensor_actuator/msg/RotationGoal.msg" NAME_WE)
add_dependencies(sensor_actuator_generate_messages_eus _sensor_actuator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/kaiodt/kaio_ros_ws/devel/share/sensor_actuator/msg/RotationFeedback.msg" NAME_WE)
add_dependencies(sensor_actuator_generate_messages_eus _sensor_actuator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/kaiodt/kaio_ros_ws/devel/share/sensor_actuator/msg/RotationActionFeedback.msg" NAME_WE)
add_dependencies(sensor_actuator_generate_messages_eus _sensor_actuator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/kaiodt/kaio_ros_ws/src/sensor_actuator/srv/FakeSensor.srv" NAME_WE)
add_dependencies(sensor_actuator_generate_messages_eus _sensor_actuator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/kaiodt/kaio_ros_ws/src/sensor_actuator/srv/Light.srv" NAME_WE)
add_dependencies(sensor_actuator_generate_messages_eus _sensor_actuator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/kaiodt/kaio_ros_ws/devel/share/sensor_actuator/msg/RotationActionGoal.msg" NAME_WE)
add_dependencies(sensor_actuator_generate_messages_eus _sensor_actuator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/kaiodt/kaio_ros_ws/devel/share/sensor_actuator/msg/RotationActionResult.msg" NAME_WE)
add_dependencies(sensor_actuator_generate_messages_eus _sensor_actuator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/kaiodt/kaio_ros_ws/devel/share/sensor_actuator/msg/RotationResult.msg" NAME_WE)
add_dependencies(sensor_actuator_generate_messages_eus _sensor_actuator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/kaiodt/kaio_ros_ws/devel/share/sensor_actuator/msg/RotationAction.msg" NAME_WE)
add_dependencies(sensor_actuator_generate_messages_eus _sensor_actuator_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(sensor_actuator_geneus)
add_dependencies(sensor_actuator_geneus sensor_actuator_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS sensor_actuator_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(sensor_actuator
  "/home/kaiodt/kaio_ros_ws/devel/share/sensor_actuator/msg/RotationActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/home/kaiodt/kaio_ros_ws/devel/share/sensor_actuator/msg/RotationFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sensor_actuator
)
_generate_msg_lisp(sensor_actuator
  "/home/kaiodt/kaio_ros_ws/devel/share/sensor_actuator/msg/RotationFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sensor_actuator
)
_generate_msg_lisp(sensor_actuator
  "/home/kaiodt/kaio_ros_ws/devel/share/sensor_actuator/msg/RotationGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sensor_actuator
)
_generate_msg_lisp(sensor_actuator
  "/home/kaiodt/kaio_ros_ws/devel/share/sensor_actuator/msg/RotationActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/home/kaiodt/kaio_ros_ws/devel/share/sensor_actuator/msg/RotationGoal.msg;/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sensor_actuator
)
_generate_msg_lisp(sensor_actuator
  "/home/kaiodt/kaio_ros_ws/devel/share/sensor_actuator/msg/RotationResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sensor_actuator
)
_generate_msg_lisp(sensor_actuator
  "/home/kaiodt/kaio_ros_ws/devel/share/sensor_actuator/msg/RotationActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/home/kaiodt/kaio_ros_ws/devel/share/sensor_actuator/msg/RotationResult.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sensor_actuator
)
_generate_msg_lisp(sensor_actuator
  "/home/kaiodt/kaio_ros_ws/devel/share/sensor_actuator/msg/RotationAction.msg"
  "${MSG_I_FLAGS}"
  "/home/kaiodt/kaio_ros_ws/devel/share/sensor_actuator/msg/RotationActionGoal.msg;/home/kaiodt/kaio_ros_ws/devel/share/sensor_actuator/msg/RotationFeedback.msg;/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/kaiodt/kaio_ros_ws/devel/share/sensor_actuator/msg/RotationResult.msg;/home/kaiodt/kaio_ros_ws/devel/share/sensor_actuator/msg/RotationActionFeedback.msg;/home/kaiodt/kaio_ros_ws/devel/share/sensor_actuator/msg/RotationActionResult.msg;/home/kaiodt/kaio_ros_ws/devel/share/sensor_actuator/msg/RotationGoal.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sensor_actuator
)

### Generating Services
_generate_srv_lisp(sensor_actuator
  "/home/kaiodt/kaio_ros_ws/src/sensor_actuator/srv/Light.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sensor_actuator
)
_generate_srv_lisp(sensor_actuator
  "/home/kaiodt/kaio_ros_ws/src/sensor_actuator/srv/FakeSensor.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sensor_actuator
)

### Generating Module File
_generate_module_lisp(sensor_actuator
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sensor_actuator
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(sensor_actuator_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(sensor_actuator_generate_messages sensor_actuator_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/kaiodt/kaio_ros_ws/devel/share/sensor_actuator/msg/RotationGoal.msg" NAME_WE)
add_dependencies(sensor_actuator_generate_messages_lisp _sensor_actuator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/kaiodt/kaio_ros_ws/devel/share/sensor_actuator/msg/RotationFeedback.msg" NAME_WE)
add_dependencies(sensor_actuator_generate_messages_lisp _sensor_actuator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/kaiodt/kaio_ros_ws/devel/share/sensor_actuator/msg/RotationActionFeedback.msg" NAME_WE)
add_dependencies(sensor_actuator_generate_messages_lisp _sensor_actuator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/kaiodt/kaio_ros_ws/src/sensor_actuator/srv/FakeSensor.srv" NAME_WE)
add_dependencies(sensor_actuator_generate_messages_lisp _sensor_actuator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/kaiodt/kaio_ros_ws/src/sensor_actuator/srv/Light.srv" NAME_WE)
add_dependencies(sensor_actuator_generate_messages_lisp _sensor_actuator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/kaiodt/kaio_ros_ws/devel/share/sensor_actuator/msg/RotationActionGoal.msg" NAME_WE)
add_dependencies(sensor_actuator_generate_messages_lisp _sensor_actuator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/kaiodt/kaio_ros_ws/devel/share/sensor_actuator/msg/RotationActionResult.msg" NAME_WE)
add_dependencies(sensor_actuator_generate_messages_lisp _sensor_actuator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/kaiodt/kaio_ros_ws/devel/share/sensor_actuator/msg/RotationResult.msg" NAME_WE)
add_dependencies(sensor_actuator_generate_messages_lisp _sensor_actuator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/kaiodt/kaio_ros_ws/devel/share/sensor_actuator/msg/RotationAction.msg" NAME_WE)
add_dependencies(sensor_actuator_generate_messages_lisp _sensor_actuator_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(sensor_actuator_genlisp)
add_dependencies(sensor_actuator_genlisp sensor_actuator_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS sensor_actuator_generate_messages_lisp)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(sensor_actuator
  "/home/kaiodt/kaio_ros_ws/devel/share/sensor_actuator/msg/RotationActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/home/kaiodt/kaio_ros_ws/devel/share/sensor_actuator/msg/RotationFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sensor_actuator
)
_generate_msg_py(sensor_actuator
  "/home/kaiodt/kaio_ros_ws/devel/share/sensor_actuator/msg/RotationFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sensor_actuator
)
_generate_msg_py(sensor_actuator
  "/home/kaiodt/kaio_ros_ws/devel/share/sensor_actuator/msg/RotationGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sensor_actuator
)
_generate_msg_py(sensor_actuator
  "/home/kaiodt/kaio_ros_ws/devel/share/sensor_actuator/msg/RotationActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/home/kaiodt/kaio_ros_ws/devel/share/sensor_actuator/msg/RotationGoal.msg;/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sensor_actuator
)
_generate_msg_py(sensor_actuator
  "/home/kaiodt/kaio_ros_ws/devel/share/sensor_actuator/msg/RotationResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sensor_actuator
)
_generate_msg_py(sensor_actuator
  "/home/kaiodt/kaio_ros_ws/devel/share/sensor_actuator/msg/RotationActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/home/kaiodt/kaio_ros_ws/devel/share/sensor_actuator/msg/RotationResult.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sensor_actuator
)
_generate_msg_py(sensor_actuator
  "/home/kaiodt/kaio_ros_ws/devel/share/sensor_actuator/msg/RotationAction.msg"
  "${MSG_I_FLAGS}"
  "/home/kaiodt/kaio_ros_ws/devel/share/sensor_actuator/msg/RotationActionGoal.msg;/home/kaiodt/kaio_ros_ws/devel/share/sensor_actuator/msg/RotationFeedback.msg;/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/kaiodt/kaio_ros_ws/devel/share/sensor_actuator/msg/RotationResult.msg;/home/kaiodt/kaio_ros_ws/devel/share/sensor_actuator/msg/RotationActionFeedback.msg;/home/kaiodt/kaio_ros_ws/devel/share/sensor_actuator/msg/RotationActionResult.msg;/home/kaiodt/kaio_ros_ws/devel/share/sensor_actuator/msg/RotationGoal.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sensor_actuator
)

### Generating Services
_generate_srv_py(sensor_actuator
  "/home/kaiodt/kaio_ros_ws/src/sensor_actuator/srv/Light.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sensor_actuator
)
_generate_srv_py(sensor_actuator
  "/home/kaiodt/kaio_ros_ws/src/sensor_actuator/srv/FakeSensor.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sensor_actuator
)

### Generating Module File
_generate_module_py(sensor_actuator
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sensor_actuator
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(sensor_actuator_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(sensor_actuator_generate_messages sensor_actuator_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/kaiodt/kaio_ros_ws/devel/share/sensor_actuator/msg/RotationGoal.msg" NAME_WE)
add_dependencies(sensor_actuator_generate_messages_py _sensor_actuator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/kaiodt/kaio_ros_ws/devel/share/sensor_actuator/msg/RotationFeedback.msg" NAME_WE)
add_dependencies(sensor_actuator_generate_messages_py _sensor_actuator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/kaiodt/kaio_ros_ws/devel/share/sensor_actuator/msg/RotationActionFeedback.msg" NAME_WE)
add_dependencies(sensor_actuator_generate_messages_py _sensor_actuator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/kaiodt/kaio_ros_ws/src/sensor_actuator/srv/FakeSensor.srv" NAME_WE)
add_dependencies(sensor_actuator_generate_messages_py _sensor_actuator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/kaiodt/kaio_ros_ws/src/sensor_actuator/srv/Light.srv" NAME_WE)
add_dependencies(sensor_actuator_generate_messages_py _sensor_actuator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/kaiodt/kaio_ros_ws/devel/share/sensor_actuator/msg/RotationActionGoal.msg" NAME_WE)
add_dependencies(sensor_actuator_generate_messages_py _sensor_actuator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/kaiodt/kaio_ros_ws/devel/share/sensor_actuator/msg/RotationActionResult.msg" NAME_WE)
add_dependencies(sensor_actuator_generate_messages_py _sensor_actuator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/kaiodt/kaio_ros_ws/devel/share/sensor_actuator/msg/RotationResult.msg" NAME_WE)
add_dependencies(sensor_actuator_generate_messages_py _sensor_actuator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/kaiodt/kaio_ros_ws/devel/share/sensor_actuator/msg/RotationAction.msg" NAME_WE)
add_dependencies(sensor_actuator_generate_messages_py _sensor_actuator_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(sensor_actuator_genpy)
add_dependencies(sensor_actuator_genpy sensor_actuator_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS sensor_actuator_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sensor_actuator)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sensor_actuator
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
add_dependencies(sensor_actuator_generate_messages_cpp std_msgs_generate_messages_cpp)
add_dependencies(sensor_actuator_generate_messages_cpp geometry_msgs_generate_messages_cpp)
add_dependencies(sensor_actuator_generate_messages_cpp actionlib_msgs_generate_messages_cpp)

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sensor_actuator)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sensor_actuator
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
add_dependencies(sensor_actuator_generate_messages_eus std_msgs_generate_messages_eus)
add_dependencies(sensor_actuator_generate_messages_eus geometry_msgs_generate_messages_eus)
add_dependencies(sensor_actuator_generate_messages_eus actionlib_msgs_generate_messages_eus)

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sensor_actuator)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sensor_actuator
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
add_dependencies(sensor_actuator_generate_messages_lisp std_msgs_generate_messages_lisp)
add_dependencies(sensor_actuator_generate_messages_lisp geometry_msgs_generate_messages_lisp)
add_dependencies(sensor_actuator_generate_messages_lisp actionlib_msgs_generate_messages_lisp)

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sensor_actuator)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sensor_actuator\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sensor_actuator
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
add_dependencies(sensor_actuator_generate_messages_py std_msgs_generate_messages_py)
add_dependencies(sensor_actuator_generate_messages_py geometry_msgs_generate_messages_py)
add_dependencies(sensor_actuator_generate_messages_py actionlib_msgs_generate_messages_py)
