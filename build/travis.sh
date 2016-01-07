#!/bin/sh -e
# Part of measurement-kit <https://measurement-kit.github.io/>.
# Measurement-kit is free software. See AUTHORS and LICENSE for more
# information on the copying conditions.

export CC=$MKPM_CC
export CXX=$MKPM_CXX

if [ ! -z "$MKPM_CROSS" ]; then
    PLUMBING=./script/mkpm-cross-ios-plumbing
fi
# It is complex to build OpenSSL because it has a custom build system, hence
# disable its compilation for now (also, we're using LibReSSL...).
PACKAGES=`ls mkpm_modules/pkg | grep -v openssl`
$PLUMBING $MKPM_CROSS ./script/mkpm-install $PACKAGES
