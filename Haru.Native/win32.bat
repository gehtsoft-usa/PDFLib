if not exist build32 md build32
cd build32
cmake -G "Visual Studio 15" -DCMAKE_BUILD_TYPE=Release ..
msbuild libharu23.sln /p:Configuration=Release /p:Platform=Win32