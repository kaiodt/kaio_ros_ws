// Generated by gencpp from file sensor_actuator/RotationResult.msg
// DO NOT EDIT!


#ifndef SENSOR_ACTUATOR_MESSAGE_ROTATIONRESULT_H
#define SENSOR_ACTUATOR_MESSAGE_ROTATIONRESULT_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace sensor_actuator
{
template <class ContainerAllocator>
struct RotationResult_
{
  typedef RotationResult_<ContainerAllocator> Type;

  RotationResult_()
    : final_orientation(0.0)  {
    }
  RotationResult_(const ContainerAllocator& _alloc)
    : final_orientation(0.0)  {
  (void)_alloc;
    }



   typedef float _final_orientation_type;
  _final_orientation_type final_orientation;




  typedef boost::shared_ptr< ::sensor_actuator::RotationResult_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::sensor_actuator::RotationResult_<ContainerAllocator> const> ConstPtr;

}; // struct RotationResult_

typedef ::sensor_actuator::RotationResult_<std::allocator<void> > RotationResult;

typedef boost::shared_ptr< ::sensor_actuator::RotationResult > RotationResultPtr;
typedef boost::shared_ptr< ::sensor_actuator::RotationResult const> RotationResultConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::sensor_actuator::RotationResult_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::sensor_actuator::RotationResult_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace sensor_actuator

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'geometry_msgs': ['/opt/ros/indigo/share/geometry_msgs/cmake/../msg'], 'actionlib_msgs': ['/opt/ros/indigo/share/actionlib_msgs/cmake/../msg'], 'std_msgs': ['/opt/ros/indigo/share/std_msgs/cmake/../msg'], 'sensor_actuator': ['/home/kaiodt/kaio_ros_ws/devel/share/sensor_actuator/msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::sensor_actuator::RotationResult_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::sensor_actuator::RotationResult_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::sensor_actuator::RotationResult_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::sensor_actuator::RotationResult_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::sensor_actuator::RotationResult_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::sensor_actuator::RotationResult_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::sensor_actuator::RotationResult_<ContainerAllocator> >
{
  static const char* value()
  {
    return "b6fb98d1aa1e9e73903e30571f18e361";
  }

  static const char* value(const ::sensor_actuator::RotationResult_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xb6fb98d1aa1e9e73ULL;
  static const uint64_t static_value2 = 0x903e30571f18e361ULL;
};

template<class ContainerAllocator>
struct DataType< ::sensor_actuator::RotationResult_<ContainerAllocator> >
{
  static const char* value()
  {
    return "sensor_actuator/RotationResult";
  }

  static const char* value(const ::sensor_actuator::RotationResult_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::sensor_actuator::RotationResult_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======\n\
float32 final_orientation\n\
";
  }

  static const char* value(const ::sensor_actuator::RotationResult_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::sensor_actuator::RotationResult_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.final_orientation);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct RotationResult_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::sensor_actuator::RotationResult_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::sensor_actuator::RotationResult_<ContainerAllocator>& v)
  {
    s << indent << "final_orientation: ";
    Printer<float>::stream(s, indent + "  ", v.final_orientation);
  }
};

} // namespace message_operations
} // namespace ros

#endif // SENSOR_ACTUATOR_MESSAGE_ROTATIONRESULT_H
