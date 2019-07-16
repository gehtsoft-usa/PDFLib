#!/bin/sh
mkdir -p macos
cd macos
/Applications/CMake.app/Contents/bin/cmake -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release ..
make
