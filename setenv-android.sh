#!/usr/bin/env bash

export ANDROID_ARCH=arch-arm
export ANDROID_EABI=arm-linux-androideabi-4.9
export FIPS_SIG=$PWD/fips/openssl-fips-2.0.13/util/incore
export ANDROID_API=android-21

export ANDROID_NDK_ROOT=$ANDROID_BUILD_TOP/prebuilts/ndk/current/
export ANDROID_SYSROOT=$ANDROID_NDK_ROOT/platforms/$ANDROID_API/$ANDROID_ARCH
export CROSS_COMPILE=arm-linux-androideabi-
export ANDROID_DEV=$ANDROID_NDK_ROOT/platforms/$ANDROID_API/$ANDROID_ARCH/usr
export PATH="$ANDROID_TOOLCHAIN":"$PATH"
export HOSTCC=gcc
export NDK_SYSROOT="$ANDROID_SYSROOT"
export CROSS_SYSROOT="$ANDROID_SYSROOT"
export ANDROID_NDK_SYSROOT="$ANDROID_SYSROOT"
export MACHINE=armv7
export RELEASE=2.6.37
export SYSTEM=android
export ARCH=arm
