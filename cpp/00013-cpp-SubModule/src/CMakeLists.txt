add_library(greetings
  SHARED
    hello.cpp
    good-morning.cpp
  )

target_include_directories(greetings
  PUBLIC ${PROJECT_SOURCE_DIR}/include
)
