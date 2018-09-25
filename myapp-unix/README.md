# How to compile and run this app

Run the following commands inside the root project folder:

    $: mkdir -p build/cmake-build-unix-debug
    $: cd build/cmake-build-unix-debug
    $: cmake -DCMAKE_VERBOSE_MAKEFILE:BOOL=ON -DCMAKE_BUILD_TYPE=Debug ../../
    $: make
    $: ./exec_unix

