#!/bin/bash

DATE_START=$(date +"%s")

export CROSS_COMPILE=${HOME}/toolchains/arm-eabi-4.8/bin/arm-eabi-
export ARCH=arm && export SUBARCH=arm
make clean && make mrproper
make flo_defconfig

make -j2

DATE_END=$(date +"%s")
DIFF=$(($DATE_END - $DATE_START))

echo
echo "  Build complete $(date +"%r")"
echo "  Elapsed time: $(($DIFF / 60))m $(($DIFF % 60))s"
echo
