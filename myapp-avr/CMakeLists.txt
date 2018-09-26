cmake_minimum_required(VERSION 3.12)
project(exec_avr VERSION 0.0.1 LANGUAGES CXX)

find_package(MyLib 1.0 REQUIRED)

# elf file
add_executable(exec_avr-elf
        EXCLUDE_FROM_ALL
        src/main.cpp)

target_compile_features(exec_avr-elf
        PRIVATE
        cxx_auto_type
        )

target_compile_options(exec_avr-elf
        PRIVATE
        -ffunction-sections -fdata-sections -mmcu=${AVR_MCU}
        )

target_compile_definitions(exec_avr-elf
        PRIVATE
        F_CPU=${MCU_SPEED}
        )

set_target_properties(exec_avr-elf
        PROPERTIES
        NO_SYSTEM_FROM_IMPORTED ON
        CXX_EXTENSIONS ON
        LINK_FLAGS "-mmcu=${AVR_MCU} -Wl,--gc-sections -Wl,-Map,exec_avr.map"
        )

target_link_libraries(exec_avr-elf
        MyLib::MyLib
        )
