cmake_minimum_required(VERSION 3.0)

project(app)

add_executable(app main.cpp)

install(TARGETS app RUNTIME DESTINATION bin)
