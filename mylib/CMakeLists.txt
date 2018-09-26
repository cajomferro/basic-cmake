cmake_minimum_required(VERSION 3.12)
project(libmylib VERSION 1.0.0 LANGUAGES CXX)

#Make sure that custom modules like FindRapidJSON are found
list(INSERT CMAKE_MODULE_PATH 0 ${CMAKE_SOURCE_DIR}/cmake)

##############################################
# Create target and set properties

add_library(mylib
        include/mylib/mylib.h
        src/mylib.cpp
        )

#Add an alias so that library can be used inside the build tree, e.g. when testing
add_library(MyLib::mylib ALIAS mylib)

#Set target properties
target_include_directories(mylib
        PUBLIC
        $<INSTALL_INTERFACE:include>
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
        PRIVATE
        ${CMAKE_CURRENT_SOURCE_DIR}/src
        )

target_compile_features(mylib
        PRIVATE
        cxx_auto_type)


if ("${IS_AVR}")
    target_compile_options(mylib
            PRIVATE
            -ffunction-sections -fdata-sections -mmcu=${AVR_MCU}
            )

    target_compile_definitions(mylib
            PRIVATE
            F_CPU=${MCU_SPEED}
            )

    set_target_properties(mylib
            PROPERTIES
            CXX_EXTENSIONS ON
            #            LINK_FLAGS "-flto -fuse-linker-plugin -mmcu=${AVR_MCU} -Wl,--gc-sections -Wl,-Map,exec_avr.map"
            )

else ()
    target_compile_options(mylib
            PRIVATE
            $<$<CXX_COMPILER_ID:GNU>:-Wall>
            $<$<CXX_COMPILER_ID:AppleClang>:-Wall>
            )
endif ()


##############################################
# Installation instructions

include(GNUInstallDirs)
set(INSTALL_CONFIGDIR ${CMAKE_INSTALL_LIBDIR}/cmake/MyLib)

install(TARGETS mylib
        EXPORT mylib-targets
        LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
        ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
        )

#This is required so that the exported target has the name MyLib and not mylib
set_target_properties(mylib PROPERTIES EXPORT_NAME MyLib)

install(DIRECTORY include/ DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})

#Export the targets to a script
install(EXPORT mylib-targets
        FILE
        MyLibTargets.cmake
        NAMESPACE
        MyLib::
        DESTINATION
        ${INSTALL_CONFIGDIR}
        )

#Create a ConfigVersion.cmake file
include(CMakePackageConfigHelpers)
write_basic_package_version_file(
        ${CMAKE_CURRENT_BINARY_DIR}/MyLibConfigVersion.cmake
        VERSION ${PROJECT_VERSION}
        COMPATIBILITY AnyNewerVersion
)

configure_package_config_file(${CMAKE_CURRENT_LIST_DIR}/cmake/MyLibConfig.cmake.in
        ${CMAKE_CURRENT_BINARY_DIR}/MyLibConfig.cmake
        INSTALL_DESTINATION ${INSTALL_CONFIGDIR}
        )

#Install the config, configversion and custom find modules
install(FILES
        #        ${CMAKE_CURRENT_LIST_DIR}/cmake/FindRapidJSON.cmake
        ${CMAKE_CURRENT_BINARY_DIR}/MyLibConfig.cmake
        ${CMAKE_CURRENT_BINARY_DIR}/MyLibConfigVersion.cmake
        DESTINATION ${INSTALL_CONFIGDIR}
        )

export(EXPORT mylib-targets FILE ${CMAKE_CURRENT_BINARY_DIR}/MyLibTargets.cmake NAMESPACE MyLib::)

#Register package in user's package registry
export(PACKAGE MyLib)


#if ("${IS_AVR}")
#
#    # elf file
#    add_executable(exec_avr-elf
#            EXCLUDE_FROM_ALL
#            src/main.cpp)
#
#    target_compile_features(exec_avr-elf
#            PRIVATE
#            cxx_auto_type
#            )
#
#    target_compile_options(exec_avr-elf
#            PRIVATE
#            -ffunction-sections -fdata-sections -mmcu=${AVR_MCU}
#            )
#
#    target_compile_definitions(exec_avr-elf
#            PRIVATE
#            F_CPU=${MCU_SPEED}
#            )
#
#    set_target_properties(exec_avr-elf
#            PROPERTIES
#            CXX_EXTENSIONS ON
#            LINK_FLAGS "-mmcu=${AVR_MCU} -Wl,--gc-sections -Wl,-Map,exec_avr.map"
#            )
#
#    target_link_libraries(exec_avr-elf
#            mylib
#            )
#
#endif ()