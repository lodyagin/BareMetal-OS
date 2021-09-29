#!/bin/sh -x

mkdir -p src
cd src
git clone -q -b stable https://github.com/lodyagin/BMFS.git
git clone -q -b stable https://github.com/lodyagin/Pure64.git
git clone -q -b stable https://github.com/lodyagin/BareMetal-OS-legacy.git BareMetal-OS
# dev mode
#git clone -q -b stable git@github.com:lodyagin/BMFS.git
#git clone -q -b stable git@github.com:lodyagin/Pure64.git
#git clone -q -b stable git@github.com:lodyagin/BareMetal-OS-legacy.git BareMetal-OS
cd ..

mkdir -p bin
platform=`uname`
case "${platform}" in
  Darwin)
    dd if=/dev/zero of=bin/bmfs.image bs=1m count=128
    ;;
  *)
    dd if=/dev/zero of=bin/bmfs.image bs=1M count=128
    ;;
esac

./build.sh
./format.sh
./install.sh
