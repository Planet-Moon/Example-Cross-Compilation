cmake_minimum_required(VERSION 3.20)

set(CMAKE_INCLUDE_CURRENT_DIR ON)

project(mqtt)

add_library(
    mqtt
    MqttClient.h
    MqttClient.cpp
)
target_include_directories(mqtt PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})

target_compile_definitions(mqtt PUBLIC MQTT_LIB)
target_compile_definitions(mqtt PUBLIC DEBUG=1)

find_package(OpenSSL REQUIRED)
target_link_libraries(mqtt PUBLIC OpenSSL::SSL OpenSSL::Crypto)


find_package(PahoMqttCpp CONFIG REQUIRED)
find_package(eclipse-paho-mqtt-c CONFIG REQUIRED)
if(VCPKG_TARGET_TRIPLET STREQUAL "arm-linux")
    target_link_libraries(mqtt PUBLIC eclipse-paho-mqtt-c::paho-mqtt3a-static eclipse-paho-mqtt-c::paho-mqtt3c-static eclipse-paho-mqtt-c::paho-mqtt3as-static eclipse-paho-mqtt-c::paho-mqtt3cs-static)
    target_link_libraries(mqtt PUBLIC PahoMqttCpp::paho-mqttpp3-static)
elseif(VCPKG_TARGET_TRIPLET STREQUAL "x64-windows")
    target_link_libraries(mqtt PUBLIC eclipse-paho-mqtt-c::paho-mqtt3a eclipse-paho-mqtt-c::paho-mqtt3c eclipse-paho-mqtt-c::paho-mqtt3as eclipse-paho-mqtt-c::paho-mqtt3cs)
    target_link_libraries(mqtt PUBLIC PahoMqttCpp::paho-mqttpp3)
endif()

add_executable(testmqtt Mqttexamplesubscribe.cpp)
target_link_libraries(testmqtt PRIVATE OpenSSL::SSL OpenSSL::Crypto)
if(VCPKG_TARGET_TRIPLET STREQUAL "arm-linux")
    target_link_libraries(testmqtt PRIVATE eclipse-paho-mqtt-c::paho-mqtt3a-static eclipse-paho-mqtt-c::paho-mqtt3c-static eclipse-paho-mqtt-c::paho-mqtt3as-static eclipse-paho-mqtt-c::paho-mqtt3cs-static)
    target_link_libraries(testmqtt PRIVATE PahoMqttCpp::paho-mqttpp3-static)
elseif(VCPKG_TARGET_TRIPLET STREQUAL "x64-windows")
    target_link_libraries(testmqtt PUBLIC eclipse-paho-mqtt-c::paho-mqtt3a eclipse-paho-mqtt-c::paho-mqtt3c eclipse-paho-mqtt-c::paho-mqtt3as eclipse-paho-mqtt-c::paho-mqtt3cs)
    target_link_libraries(testmqtt PUBLIC PahoMqttCpp::paho-mqttpp3)
endif()
set_target_properties(testmqtt PROPERTIES EXCLUDE_FROM_ALL TRUE)
