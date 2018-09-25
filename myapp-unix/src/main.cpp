#include <iostream>
#include <mylib/mylib.h>


int main(int argc, char *argv[]) {
    std::cout << "Machine state: " << mylib::MyLibInstance.get_lib_state();
    mylib::MyLibInstance.switch_lib_state();
    std::cout << "\nMachine state: " << mylib::MyLibInstance.get_lib_state();

    return 0;
}
