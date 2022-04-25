#!/bin/bash

. /Developer/Makefiles/GNUstep.sh

cd ../../gnustep-back || exit 1

make clean
./configure --enable-graphics=art --with-name=art
make fonts=no || exit 1

sudo -E make install

make clean
./configure --enable-graphics=cairo --with-name=cairo
make fonts=no || exit 1

sudo -E make install
