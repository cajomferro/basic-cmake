#!/bin/bash

mkdir -p build/cmake-build-avr-release
cd build/cmake-build-avr-release
cmake -DCMAKE_TOOLCHAIN_FILE=cmake/ARDUINO_UNO.cmake -DCMAKE_VERBOSE_MAKEFILE:BOOL=ON -DCMAKE_BUILD_TYPE=Release ../../
make exec_avr-elf
