#!/bin/sh
# @author 王明凡
# @version v1.0.0 创建时间2013年

IOS_BASE_SDK="6.0"
IOS_DEPLOY_TGT="4.3"

setenv_all()
{
	# Add internal libs
	export CFLAGS="$CFLAGS -I$GLOBAL_OUTDIR/include -L$GLOBAL_OUTDIR/lib"
	export CXX="$DEVROOT/usr/bin/llvm-g++"
	export CC="$DEVROOT/usr/bin/llvm-gcc"
	export LD=$DEVROOT/usr/bin/ld
	export AR=$DEVROOT/usr/bin/ar
	export AS=$DEVROOT/usr/bin/as
	export NM=$DEVROOT/usr/bin/nm
	export RANLIB=$DEVROOT/usr/bin/ranlib
	export LDFLAGS="-L$SDKROOT/usr/lib/"
	export CPPFLAGS=$CFLAGS
	export CXXFLAGS=$CFLAGS
}

setenv_arm7s()
{
	unset DEVROOT SDKROOT CFLAGS CC LD CPP CXX AR AS NM CXXCPP RANLIB LDFLAGS CPPFLAGS CXXFLAGS
	export DEVROOT=/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer
	export SDKROOT=$DEVROOT/SDKs/iPhoneOS$IOS_BASE_SDK.sdk
	export CFLAGS="-arch armv7s -pipe -no-cpp-precomp -isysroot $SDKROOT -miphoneos-version-min=$IOS_DEPLOY_TGT -I$SDKROOT/usr/include/"	
	setenv_all
}

make clean 2> /dev/null
make distclean 2> /dev/null
setenv_arm7s
./configure --host=arm-apple-darwin10 --enable-shared=no --disable-programs --without-zlib --without-libpng --without-jpeg --without-giflib --without-libtiff
make -j4
