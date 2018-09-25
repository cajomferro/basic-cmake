# How to compile and run this app

Run the following commands inside the root project folder:

    $: mkdir -p build/cmake-build-avr-release
    $: cd build/cmake-build-avr-release
    $: cmake -DCMAKE_TOOLCHAIN_FILE=cmake/ARDUINO_UNO.cmake -DCMAKE_VERBOSE_MAKEFILE:BOOL=ON -DCMAKE_BUILD_TYPE=Release ../../
    $: make


