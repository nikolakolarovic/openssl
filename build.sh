#!/usr/bin/env bash

source setenv-android.sh


# Perl is optional, and may fail in OpenSSL 1.1.0
perl -pi -e 's/install: all install_docs install_sw/install: install_docs install_sw/g' Makefile.org

# Tune to suit your taste, visit http://wiki.openssl.org/index.php/Compilation_and_Installation
./config shared no-ssl2 no-ssl3 no-comp no-hw no-engine --openssldir=$ANDROID_PRODUCT_OUT/system/lib/


make depend
make CALC_VERSIONS="SHLIB_COMPAT=; SHLIB_SOVER=" all -j8

cp -vf libcryptoscsa.so $ANDROID_PRODUCT_OUT/symbols/system/lib/
$ANDROID_TOOLCHAIN/${CROSS_COMPILE}strip -v libcryptoscsa.so
cp -vf libcryptoscsa.so $ANDROID_PRODUCT_OUT/system/lib/
cp -vf libcrypto.so $ANDROID_PRODUCT_OUT/obj/lib/

cp -vf libsslscsa.so $ANDROID_PRODUCT_OUT/symbols/system/lib/
$ANDROID_TOOLCHAIN/${CROSS_COMPILE}strip -v libsslscsa.so
cp -vf libsslscsa.so $ANDROID_PRODUCT_OUT/system/lib/
cp -vf libsslscsa.so $ANDROID_PRODUCT_OUT/obj/lib/

