#!/bin/bash

if [[ "$1" == "arm32" ]]; then
    echo Build for arm32
    cmake --no-warn-unused-cli -DCMAKE_TOOLCHAIN_FILE=arm32-toolchain.cmake
    make -j3
elif [[ "$1" == "arm64" ]]; then
    echo Build for arm64
    cmake --no-warn-unused-cli -DCMAKE_TOOLCHAIN_FILE=arm64-toolchain.cmake
    make -j3
else
    echo Build for linux
    mkdir -p linux64
    cd linux64
    cmake -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release ..
    make
fi
