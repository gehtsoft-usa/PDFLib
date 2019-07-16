@echo off
if "%1" == "" goto :help
if "%1" == "-h" goto :help
if "%1" == "--help" goto :help
call rbuild.cmd .. libharu macos libharu23.dylib macos.sh %1 /Users/%2/projects %2 %3
goto :exit
:help
echo usage: rbuild_macos server user password
:exit