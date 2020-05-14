cmake_minimum_required(VERSION 3.13.4)



project(test_cmake CXX)


add_library(greetings SHARED hello.cpp good-morning.cpp)


add_executable(a.out main.cpp)

target_link_libraries(a.out greetings)
