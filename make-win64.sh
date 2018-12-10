#!/bin/sh

SOURCE_DIRECTORY="$(dirname $0)"
cd ${SOURCE_DIRECTORY}
PWD=`pwd`
SOURCE_DIRECTORY="${PWD}"

BUILD_DIRECTORY_SUFFIX="build/win64"
BUILD_DIRECTORY="${SOURCE_DIRECTORY}/${BUILD_DIRECTORY_SUFFIX}"

CONFIGURE_FLAGS="--without-jpeg --without-zlib --without-libpng --without-giflib --without-libtiff --without-libwebp --without-libopenjpeg --disable-programs"

TARGET_HOST="x86_64-pc-mingw32"

export CC="x86_64-w64-mingw32-gcc"
export CXX="x86_64-w64-mingw32-g++"
export AR="x86_64-w64-mingw32-ar"
export RANLIB="x86_64-w64-mingw32-ranlib"
export NM="x86_64-w64-mingw32-nm"
export LDFLAGS="${LDFLAGS}"
export CPPFLAGS="-DBUILDING_DLL ${CPPFLAGS}"
export CFLAGS="-DBUILDING_DLL ${CFLAGS}"
#export LIBS=-lm

echo "$F: calling ./configure with env vars:"
echo " CC = ${CC}"
echo " CFLAGS = ${CFLAGS}"
echo " LDFLAGS = ${LDFLAGS}"
echo " CPPFLAGS = ${CPPFLAGS}"
echo " LIBS = ${LIBS}"
echo " AR = ${AR}"
echo " RANLIB = ${RANLIB}"
echo " TARGET_HOST = ${TARGET_HOST}"

cd ${SOURCE_DIRECTORY}
mkdir --parents ${BUILD_DIRECTORY}
${SOURCE_DIRECTORY}/autogen.sh
cd ${BUILD_DIRECTORY}

CONFIGURE_CMD="${SOURCE_DIRECTORY}/configure --host=${TARGET_HOST} --prefix=${BUILD_DIRECTORY}/install ${CONFIGURE_FLAGS} $*"
echo "${CONFIGURE_CMD}"
${CONFIGURE_CMD}

# only make the library, not the programs
cd ${BUILD_DIRECTORY}/src

echo "make"
make

echo "make install-strip"
make install-strip
