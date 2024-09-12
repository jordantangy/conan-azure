cmake_minimum_required(VERSION 3.15)
project(test CXX)

add_library(test src/test.cpp)
target_include_directories(test PUBLIC include)

set_target_properties(test PROPERTIES PUBLIC_HEADER "include/test.h")
install(TARGETS test)
