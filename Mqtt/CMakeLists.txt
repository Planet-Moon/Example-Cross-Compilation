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

find_package(OpenSSL REQUIRED)
target_link_libraries(mqtt PUBLIC OpenSSL::SSL OpenSSL::Crypto)

find_package(eclipse-paho-mqtt-c CONFIG REQUIRED)
target_link_libraries(mqtt PUBLIC eclipse-paho-mqtt-c::paho-mqtt3a-static eclipse-paho-mqtt-c::paho-mqtt3c-static eclipse-paho-mqtt-c::paho-mqtt3as-static eclipse-paho-mqtt-c::paho-mqtt3cs-static)

find_package(PahoMqttCpp CONFIG REQUIRED)
target_link_libraries(mqtt PUBLIC PahoMqttCpp::paho-mqttpp3-static)

add_executable(testmqtt Mqttexamplesubscribe.cpp)
target_link_libraries(testmqtt PRIVATE OpenSSL::SSL OpenSSL::Crypto)
target_link_libraries(testmqtt PRIVATE eclipse-paho-mqtt-c::paho-mqtt3a-static eclipse-paho-mqtt-c::paho-mqtt3c-static eclipse-paho-mqtt-c::paho-mqtt3as-static eclipse-paho-mqtt-c::paho-mqtt3cs-static)
target_link_libraries(testmqtt PRIVATE PahoMqttCpp::paho-mqttpp3-static)
set_target_properties(testmqtt PROPERTIES EXCLUDE_FROM_ALL TRUE)
