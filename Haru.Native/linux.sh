#!/bin/sh
mkdir -p linux64
cd linux64
cmake -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release ..
make
