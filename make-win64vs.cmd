@echo off
setlocal
path=%ProgramFiles%\CMake\bin;%ProgramFiles%\NASM;%path%
if not exist build\win64vs mkdir build\win64vs
pushd build\win64vs
cmake -G"Visual Studio 15 2017 Win64" -DCMAKE_INSTALL_PREFIX=install %~dp0
popd
endlocal

