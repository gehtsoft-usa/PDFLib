APP_PROJECT_PATH := $(call my-dir)
APP_BUILD_SCRIPT := $(APP_PROJECT_PATH)/Android.mk
APP_ABI          := x86_64 x86 arm64-v8a armeabi armeabi-v7a
APP_CPPFLAGS     += -fpermissive -fexceptions -frtti -std=c++11
APP_MODULES      := haru23
APP_STL          := gnustl_static
APP_CFLAGS	 += -Wno-error=format-security -std=c++11
