//
// Created by Carlos Mão de Ferro on 25/09/2018.
//

#ifndef BASIC_CMAKE_MYLIB_H
#define BASIC_CMAKE_MYLIB_H

namespace mylib {

#define STATE_ON 1
#define STATE_OFF 0

    class MyLib {
    private:
        int stuff;
        int lib_state;

        void do_private_stuff();

        void set_lib_state(int new_lib_state);

    public:
        MyLib();

        int get_lib_state() {
            return lib_state;
        }

        void switch_lib_state() {
            if (lib_state == STATE_ON) {
                lib_state = STATE_OFF;
            } else {
                lib_state = STATE_ON;
            }

        }

    };

    extern MyLib MyLibInstance;

}


#endif //BASIC_CMAKE_MYLIB_H
