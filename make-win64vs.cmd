@echo off
setlocal
path=%ProgramFiles%\CMake\bin;%ProgramFiles%\NASM;%path%
if not exist build\win64vs mkdir build\win64vs
pushd build\win64vs
cmake -G"Visual Studio 15 2017 Win64" ^
    -DCMAKE_INSTALL_PREFIX=install ^
    -DCMAKE_DISABLE_FIND_PACKAGE_GIF=TRUE ^
    -DCMAKE_DISABLE_FIND_PACKAGE_JPEG=TRUE ^
    -DCMAKE_DISABLE_FIND_PACKAGE_PNG=TRUE ^
    -DCMAKE_DISABLE_FIND_PACKAGE_TIFF=TRUE ^
    -DCMAKE_DISABLE_FIND_PACKAGE_ZLIB=TRUE ^
    -DCMAKE_DISABLE_FIND_PACKAGE_PkgConfig=TRUE ^
    %~dp0
popd
endlocal

