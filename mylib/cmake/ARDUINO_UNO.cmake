##########################################################################
# executables in use
##########################################################################
find_program(AVR_CC avr-gcc)
find_program(AVR_CXX avr-g++)
find_program(AVR_OBJCOPY avr-objcopy)
find_program(AVR_SIZE_TOOL avr-size)
find_program(AVR_OBJDUMP avr-objdump)
find_program(AVR_GCC_AR avr-gcc-ar)
find_program(AVR_GCC_RANLIB avr-gcc-ranlib)
find_program(AVR_GCC_NM avr-gcc-nm)

##########################################################################
# toolchain starts with defining mandatory variables
##########################################################################
set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR avr)
set(CMAKE_C_COMPILER ${AVR_CC}) # set this on cmake command
set(CMAKE_CXX_COMPILER ${AVR_CXX}) # set this on cmake command
set(CMAKE_AR ${AVR_GCC_AR})
set(CMAKE_RANLIB ${AVR_GCC_RANLIB})
set(CMAKE_NM ${AVR_GCC_NM})

##########################################################################
# identification
##########################################################################
set(IS_AVR 1)

##########################################################################
# set compiler options for build types
##########################################################################
if (CMAKE_BUILD_TYPE MATCHES Release)
    set(CMAKE_C_FLAGS_RELEASE "-Os")
    set(CMAKE_CXX_FLAGS_RELEASE "-Os")
endif (CMAKE_BUILD_TYPE MATCHES Release)

if (CMAKE_BUILD_TYPE MATCHES RelWithDebInfo)
    set(CMAKE_C_FLAGS_RELWITHDEBINFO "-Os -save-temps -g -gdwarf-3 -gstrict-dwarf")
    set(CMAKE_CXX_FLAGS_RELWITHDEBINFO "-Os -save-temps -g -gdwarf-3 -gstrict-dwarf")
endif (CMAKE_BUILD_TYPE MATCHES RelWithDebInfo)

if (CMAKE_BUILD_TYPE MATCHES Debug)
    set(CMAKE_C_FLAGS_DEBUG "-O0 -save-temps -g -gdwarf-3 -gstrict-dwarf")
    set(CMAKE_CXX_FLAGS_DEBUG "-O0 -save-temps -g -gdwarf-3 -gstrict-dwarf")
endif (CMAKE_BUILD_TYPE MATCHES Debug)

##########################################################################
# tools to beused for programming the AVR
##########################################################################
#set(AVR_PROGRAMMER "arduino")
#set(AVR_UPLOADTOOL_PORT "/dev/cu.usbmodem1411")

##########################################################################
# AVR and fuses needs to be set
##########################################################################
set(AVR_MCU "atmega328p")
set(MCU_SPEED "16000000L")