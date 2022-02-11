#include "myLib.h"

namespace MyNamespace {
    MyClass::MyClass(int start): value(start){
    }

    void MyClass::increment(){
        ++value;
    }

    int MyClass::getValue() const{
        return value;
    }
}
