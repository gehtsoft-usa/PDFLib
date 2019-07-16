@echo off
if "%1" == "" goto :help
if "%1" == "-h" goto :help
if "%1" == "--help" goto :help
call rbuild.cmd .. libharu linux64 libharu23.so linux.sh %1 /home/%2/projects %2 %3
goto :exit
:help
echo usage: rbuild_centos server user password
:exit