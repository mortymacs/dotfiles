#!/bin/sh
version="0.9"
wget -c "https://dl.suckless.org/st/st-${version}.tar.gz"
tar xzf "st-${version}.tar.gz"
cd "st-${version}"
patch --input=../charoffsets.patch
patch --input=../profile.patch
make
sudo make install
