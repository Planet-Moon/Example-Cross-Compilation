#include <stdio.h>
#include <stdlib.h>
#include <chrono>
#include <thread>
#include <iostream>
#include <MqttClient.h>
#include <ModbusDevice.h>
#include <ModbusRegister.h>
#include <myLib.h>
#include <memory>

void thread_task(float sleep_duration){
    std::cout << "Task running "<< std::endl;
    std::this_thread::sleep_for(std::chrono::milliseconds(static_cast<int>(sleep_duration*1000)));
    std::cout << "Task finished " << std::endl;
}

int main(void)
{
    // static_assert(__GNUC__);
    #ifdef __GNUC__
    printf("__GNUC__ defined\n");
    #elif _MSC_VER
    printf("_MSC_VER defined, _MSC_VER \n");
    #endif
    printf("hello!\n");

    MyNamespace::MyClass myClass(2);
    std::cout << "value: " << myClass.getValue() << std::endl;
    for(int i = 0; i < 10; i++){
        myClass.increment();
        std::cout << "value: " << myClass.getValue() << std::endl;
    }

    std::unique_ptr<std::thread> t = std::make_unique<std::thread>(thread_task, 5.f);

    std::shared_ptr<myMqtt::Client> mqttClient = std::make_shared<myMqtt::Client>("tcp://192.168.20.209:1883", "cpp_test_client");
    mqttClient->subscribe("#", 1);
    mqttClient->publish("test/messages", "hello world", 0, false);
    // std::shared_ptr<Mb::ModbusDevice> heatingControl = std::make_shared<Mb::ModbusDevice>("192.168.178.107",502);
    // bool ret_val = false;
    // Mb::ModbusRegister<short> waterTankTop(heatingControl.get(), 2, 0.1, "°C");
    // std::cout << "waterTankTop: " + Mb::printVector(waterTankTop.readRawData(&ret_val)) + ", status: " << ret_val << std::endl;

    while(t->joinable()){
        t->join();
        std::this_thread::sleep_for(std::chrono::milliseconds(100));
    }

    return EXIT_SUCCESS;
}
