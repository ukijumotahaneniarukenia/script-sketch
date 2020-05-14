cmake_minimum_required(VERSION 3.13.4)



project(test_cmake CXX)

# GREETINGS_BUILD_SHARED_LIBSというオプションを作成。デフォルトをOFFに設定。
option(GREETINGS_BUILD_SHARED_LIBS "build greetings as a shared library" OFF)

if (GREETINGS_BUILD_SHARED_LIBS)
  add_library(greetings SHARED hello.cpp good-morning.cpp)
else()
  add_library(greetings STATIC hello.cpp good-morning.cpp)
endif()


add_executable(a.out main.cpp)

target_link_libraries(a.out greetings)
