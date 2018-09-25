# How to compile this library

## Installing on MacOS

### Compile for Unix

Run the following commands inside the root project folder:

    $: mkdir -p build/cmake-build-unix-debug
    $: cd build/cmake-build-unix-debug
    $: cmake -DCMAKE_VERBOSE_MAKEFILE:BOOL=ON -DCMAKE_BUILD_TYPE=Debug ../../
    $: make


### Compile for AVR

Run the following commands inside the root project folder:

    $: mkdir -p build/cmake-build-avr-release
    $: cd build/cmake-build-avr-release
    $: cmake -DCMAKE_TOOLCHAIN_FILE=cmake/ARDUINO_UNO.cmake -DCMAKE_VERBOSE_MAKEFILE:BOOL=ON -DCMAKE_BUILD_TYPE=Release ../../
    $: make
