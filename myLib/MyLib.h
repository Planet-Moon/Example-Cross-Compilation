#pragma once

namespace MyNamespace {
    class MyClass{
    public:
        MyClass(int start);
        void increment();
        int getValue() const;
    private:
        int value;
    };
}
