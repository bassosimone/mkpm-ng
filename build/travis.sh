#!/bin/sh -e
# Part of measurement-kit <https://measurement-kit.github.io/>.
# Measurement-kit is free software. See AUTHORS and LICENSE for more
# information on the copying conditions.

export CC=$MKPM_CC
export CXX=$MKPM_CXX

PACKAGES="http-parser Catch mkok-base zlib libressl libevent mkok-libevent-ng tor mkok-onion-ctrl"
if [ ! -z "$MKPM_CROSS" ]; then
    PLUMBING=./script/mkpm-cross-ios-plumbing
fi
$PLUMBING $MKPM_CROSS ./script/mkpm-install $PACKAGES
