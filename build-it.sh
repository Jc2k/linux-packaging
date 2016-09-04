#! /bin/sh

wget https://github.com/torvalds/linux/archive/v4.7.tar.gz
tar -zxvf v4.7.tar.gz
cd linux-4.7/
patch -p0 < /usr/lib/build-it.sh/Makefile.patch
make multi_v7_defconfig
make-kpkg --stem linux-rpi2 --rootcmd fakeroot --initrd --revision 1.0 kernel_image kernel_source kernel_headers
mv ../*.deb /output/
