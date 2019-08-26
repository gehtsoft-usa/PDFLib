@echo off
if "%1" == "" goto :help
if "%1" == "-h" goto :help
if "%1" == "--help" goto :help
call rbuild-haru.cmd %1 %2 %3 linux64 linux64 linux.sh libharu23.so libharu23Static.a
copy ..\linux64\libharu23Static.a ..\linux64\libharu23.a
del ..\linux64\libharu23Static.a
goto :exit
:help
echo usage: rbuild_centos server user password
:exit