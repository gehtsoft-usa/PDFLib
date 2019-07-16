if not exist build64 md build64
cd build64
cmake -G "Visual Studio 15 Win64" -DCMAKE_BUILD_TYPE=Release ..
msbuild libharu23.sln /p:Configuration=Release /p:Platform=x64