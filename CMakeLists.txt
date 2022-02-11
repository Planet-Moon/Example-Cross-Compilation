cmake_minimum_required(VERSION 3.20)

set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_CXX_STANDARD 17)

project(arm_test)


if(VCPKG_TARGET_TRIPLET STREQUAL "arm-linux")
    # install vcpkg packages from manifest
    execute_process(
        WORKING_DIRECTORY "${CMAKE_SOURCE_DIR}"
        COMMAND powershell.exe -NoLogo -ExecutionPolicy Bypass -Command "${CMAKE_CURRENT_SOURCE_DIR}/installPackages.ps1"
        COMMAND_ECHO STDOUT
    )
    set(CMAKE_PREFIX_PATH "${VCPKG_INSTALLED_DIR}")
    set(VCPKG_INSTALLED_DIR "${CMAKE_SOURCE_DIR}/vcpkg_installed/${VCPKG_TARGET_TRIPLET}")
endif()

add_subdirectory(myLib)
add_subdirectory(modbus)
add_subdirectory(ObserverModel)
add_subdirectory(Mqtt)

add_executable(test Test.cpp)
target_link_libraries(test PUBLIC myLib)
target_link_libraries(test PUBLIC ModbusDevice)
target_link_libraries(test PUBLIC mqtt)

if(VCPKG_TARGET_TRIPLET STREQUAL "arm-linux")
    add_custom_target(send_to_rpi
        COMMAND powershell.exe -NoLogo -ExecutionPolicy Bypass -Command "${CMAKE_CURRENT_SOURCE_DIR}/send_to_target.ps1 $<TARGET_FILE:test> rpigoe:/home/pi"
        COMMAND echo "$<TARGET_FILE:test>"
        COMMENT "Sending executable to rpigoe"
    )
    add_dependencies(send_to_rpi test)
endif()
