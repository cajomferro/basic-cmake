cmake_minimum_required(VERSION 3.12)
project(exec_unix VERSION 0.0.1 LANGUAGES CXX)

add_executable(exec_unix src/main)
target_compile_features(exec_unix PRIVATE cxx_auto_type)

find_package(MyLib 1.0 REQUIRED)
target_link_libraries(exec_unix MyLib::MyLib)