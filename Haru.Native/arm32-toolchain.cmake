cmake_minimum_required(VERSION 2.8)

SET (CMAKE_C_COMPILER_WORKS 1)
SET (CMAKE_CXX_COMPILER_WORKS 1)

set(CMAKE_SYSTEM_NAME Linux)
set(CMAKE_SYSTEM_PROCESSOR arm)

set (MOBILE_CROSS YES)

set(TOOLCHAIN_ROOT /opt/gcc-linaro-5.5.0-2017.10-i686_arm-linux-gnueabihf)
set(CMAKE_CXX_COMPILER ${TOOLCHAIN_ROOT}/bin/arm-linux-gnueabihf-gcc )
set(CMAKE_C_COMPILER ${TOOLCHAIN_ROOT}/bin/arm-linux-gnueabihf-gcc)
set(CMAKE_AR ${TOOLCHAIN_ROOT}/bin/arm-linux-gnueabihf-gcc-ar CACHE FILEPATH "Archiver")
set(CMAKE_LINKER ${TOOLCHAIN_ROOT}/bin/arm-linux-gnueabihf-ld)
set(CMAKE_RANLIB ${TOOLCHAIN_ROOT}/bin/arm-linux-gnueabihf-ranlib)
set(CMAKE_LINKER ${TOOLCHAIN_ROOT}/bin/arm-eabi-ld)
set(CMAKE_RANLIB ${TOOLCHAIN_ROOT}/bin/arm-eabi-ranlib)


include_directories(${TOOLCHAIN_ROOT}/include)
link_directories(${TOOLCHAIN_ROOT}/lib)

set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)

