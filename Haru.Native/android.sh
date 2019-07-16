#!/bin/bash
# Build Haru  for Android OS

COL_RED="\x1b[31;40m"
COL_GREEN="\x1b[32;40m"
COL_BLUE="\x1b[34;01m"
COL_YELLOW="\x1b[33;01m"
COL_RESET="\x1b[39;49;00m"

THIS_DIR=`pwd`

ANDROID_DIR=$PWD/android

function catch_error(){
  echo -e $COL_RED"An error has occured! Script execution stopped."$COL_RESET
  echo -e $COL_BLUE"Error desription:"$COL_RESET" "$1
  exit 1
}


export PATH=${ANDROID_NDK_ROOT}:${JAVA_HOME}:${PATH}

echo -e $COL_BLUE"Building Haru.Native for Android..."$COL_RESET

ndk-build NDK_PROJECT_PATH=$ANDROID_DIR
if [ $? -gt 1 ] ; then
  echo -e $COL_RED"An error has occured during build!"$COL_RESET
  exit 1
else
  let minutes=$SECONDS/60
  let seconds=$SECONDS%60
  echo -e $COL_GREEN"=========================================================="
  echo -e "Build completed successfully. Build duration: `printf '%02d:%02d' $minutes $seconds`\n"$COL_RESET
fi
