#include <mylib/mylib.h>


int main(int argc, char *argv[]) {
    mylib::MyLibInstance.get_lib_state();
    mylib::MyLibInstance.switch_lib_state();

    return 0;
}
