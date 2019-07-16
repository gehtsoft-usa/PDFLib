@echo off

echo "Remote build script"

if "%1" == "" goto :help
if "%1" == "-h" goto :help
if "%1" == "--help" goto :help


SET PROJECT_PATH=%1
SET PROJECT_NAME=%2
SET TARGET_DIR=%3
SET TARGET_NAME=%4
SET BUILD_FILE=%5
SET SERVER=%6
SET HOME_DIR=%7
SET USERNAME=%8
SET PASSWORD=%9


SET REMOTE_DIR=%HOME_DIR%/%PROJECT_NAME%

rem create remore directories
plink.exe %SERVER% -batch -4 -ssh -l %USERNAME% -pw %PASSWORD% "mkdir -p %REMOTE_DIR%"
plink.exe %SERVER% -batch -4 -ssh -l %USERNAME% -pw %PASSWORD% "mkdir -p %REMOTE_DIR%/src"
plink.exe %SERVER% -batch -4 -ssh -l %USERNAME% -pw %PASSWORD% "mkdir -p %REMOTE_DIR%/cmake"

rem copy project files
pscp.exe -4 -l %USERNAME% -pw %PASSWORD% -sftp -r %PROJECT_PATH%/src/*.* %SERVER%:%REMOTE_DIR%/src
pscp.exe -4 -l %USERNAME% -pw %PASSWORD% -sftp %PROJECT_PATH%/%BUILD_FILE% %SERVER%:%REMOTE_DIR%
pscp.exe -4 -l %USERNAME% -pw %PASSWORD% -sftp %PROJECT_PATH%/CMakeLists.txt %SERVER%:%REMOTE_DIR%
pscp.exe -4 -l %USERNAME% -pw %PASSWORD% -sftp %PROJECT_PATH%/cmake/*.* %SERVER%:%REMOTE_DIR%/cmake

rem run build
del /q commands.txt > nul
echo cd %REMOTE_DIR% > commands.txt
echo chmod +x %BUILD_FILE% >>commands.txt
echo ./%BUILD_FILE% >>commands.txt
plink.exe %SERVER% -batch -4 -ssh -l %USERNAME% -pw %PASSWORD% -m commands.txt
del /q commands.txt > nul

rem pick up results
if not exist %PROJECT_PATH%\%TARGET_DIR% mkdir %PROJECT_PATH%\%TARGET_DIR%
del /q %PROJECT_PATH%\%TARGET_DIR%\%TARGET_NAME% > nul
pscp.exe -4 -l %USERNAME% -pw %PASSWORD% -sftp %SERVER%:%REMOTE_DIR%/%TARGET_DIR%/%TARGET_NAME% %PROJECT_PATH%/%TARGET_DIR%

rem delete remote
plink.exe %SERVER% -batch -4 -ssh -l %USERNAME% -pw %PASSWORD% "rm -rf %REMOTE_DIR%"

goto :exit

:help

echo Usage:
echo rbuild.cmd project_path project_name build_file target_dir target_name server home_dir user password
echo where:
echo    project_path - the local directory where the project is located
echo    project_name - the name of the project
echo    target_dir   - the target directory name both locally and remotely
echo    target_name  - the name of the binary
echo    build_file   - the name of the build script
echo    server       - the server name or IP address
echo    home_dir     - the home directory on the server
echo    user         - the user name
echo    pwd          - the user password

echo
echo example:
echo     rbuild.cmd .. libharu linux libharu23.so linux.sh 192.168.1.10 /home/myuser myuser mypassword

:exit
