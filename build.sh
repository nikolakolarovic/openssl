#!/usr/bin/env bash

source setenv-android.sh


# Perl is optional, and may fail in OpenSSL 1.1.0
perl -pi -e 's/install: all install_docs install_sw/install: install_docs install_sw/g' Makefile.org

# Tune to suit your taste, visit http://wiki.openssl.org/index.php/Compilation_and_Installation
./config shared no-ssl2 no-ssl3 no-comp no-hw no-engine --openssldir=$ANDROID_PRODUCT_OUT/system/lib/


make depend
make all

cp -vf libcrypto.so $ANDROID_PRODUCT_OUT/system/lib
$ANDROID_TOOLCHAIN/${CROSS_COMPILE}strip -v $ANDROID_PRODUCT_OUT/system/lib/libcrypto.so
cp -vf libcrypto.so $ANDROID_PRODUCT_OUT/symbols/system/lib

cp -vf libssl.so $ANDROID_PRODUCT_OUT/system/lib
$ANDROID_TOOLCHAIN/${CROSS_COMPILE}strip -v $ANDROID_PRODUCT_OUT/system/lib/libssl.so
cp -vf libssl.so $ANDROID_PRODUCT_OUT/symbols/system/lib

