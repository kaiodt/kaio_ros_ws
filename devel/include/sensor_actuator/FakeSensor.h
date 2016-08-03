// Generated by gencpp from file sensor_actuator/FakeSensor.msg
// DO NOT EDIT!


#ifndef SENSOR_ACTUATOR_MESSAGE_FAKESENSOR_H
#define SENSOR_ACTUATOR_MESSAGE_FAKESENSOR_H

#include <ros/service_traits.h>


#include <sensor_actuator/FakeSensorRequest.h>
#include <sensor_actuator/FakeSensorResponse.h>


namespace sensor_actuator
{

struct FakeSensor
{

typedef FakeSensorRequest Request;
typedef FakeSensorResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct FakeSensor
} // namespace sensor_actuator


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::sensor_actuator::FakeSensor > {
  static const char* value()
  {
    return "c3d2506862045c1ddfbe5c9ef23688f4";
  }

  static const char* value(const ::sensor_actuator::FakeSensor&) { return value(); }
};

template<>
struct DataType< ::sensor_actuator::FakeSensor > {
  static const char* value()
  {
    return "sensor_actuator/FakeSensor";
  }

  static const char* value(const ::sensor_actuator::FakeSensor&) { return value(); }
};


// service_traits::MD5Sum< ::sensor_actuator::FakeSensorRequest> should match 
// service_traits::MD5Sum< ::sensor_actuator::FakeSensor > 
template<>
struct MD5Sum< ::sensor_actuator::FakeSensorRequest>
{
  static const char* value()
  {
    return MD5Sum< ::sensor_actuator::FakeSensor >::value();
  }
  static const char* value(const ::sensor_actuator::FakeSensorRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::sensor_actuator::FakeSensorRequest> should match 
// service_traits::DataType< ::sensor_actuator::FakeSensor > 
template<>
struct DataType< ::sensor_actuator::FakeSensorRequest>
{
  static const char* value()
  {
    return DataType< ::sensor_actuator::FakeSensor >::value();
  }
  static const char* value(const ::sensor_actuator::FakeSensorRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::sensor_actuator::FakeSensorResponse> should match 
// service_traits::MD5Sum< ::sensor_actuator::FakeSensor > 
template<>
struct MD5Sum< ::sensor_actuator::FakeSensorResponse>
{
  static const char* value()
  {
    return MD5Sum< ::sensor_actuator::FakeSensor >::value();
  }
  static const char* value(const ::sensor_actuator::FakeSensorResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::sensor_actuator::FakeSensorResponse> should match 
// service_traits::DataType< ::sensor_actuator::FakeSensor > 
template<>
struct DataType< ::sensor_actuator::FakeSensorResponse>
{
  static const char* value()
  {
    return DataType< ::sensor_actuator::FakeSensor >::value();
  }
  static const char* value(const ::sensor_actuator::FakeSensorResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // SENSOR_ACTUATOR_MESSAGE_FAKESENSOR_H
