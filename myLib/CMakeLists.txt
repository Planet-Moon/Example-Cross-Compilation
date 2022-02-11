add_library(myLib STATIC myLib.h myLib.cpp)
target_include_directories(myLib PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
