#!/bin/bash

make clean || echo clean

rm -f config.status
./autogen.sh || echo done

CFLAGS="-O3 -mtune=native -march=native -s" CXXFLAGS="$CFLAGS -std=gnu++11" ./configure --with-curl
make
strip -s cpuminer
