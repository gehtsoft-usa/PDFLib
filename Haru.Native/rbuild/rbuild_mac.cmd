@echo off
if "%1" == "" goto :help
if "%1" == "-h" goto :help
if "%1" == "--help" goto :help
call rbuild-haru.cmd %1 %2 %3 macos macos macos.sh libharu23.dylib libharu23Static.a
copy ..\macos\libharu23Static.a ..\macos\libharu23.a
del ..\macos\libharu23Static.a
goto :exit
:help
echo usage: rbuild_macos server user password
:exit