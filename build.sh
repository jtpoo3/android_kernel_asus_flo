#!/bin/bash

echo -e "\e[36m"
echo "        _   __                                        "
echo "       | | / /                                        "
echo "       | |/ /  __ _ _ __   __ _  __ _ _ __ ___   ___  "
echo "       |    \ / _' | '_ \ / _' |/ _' | '__/ _ \ / _ \ "
echo "       | |\  \ (_| | | | | (_| | (_| | | | (_) | (_) |"
echo "       \_| \_/\__,_|_| |_|\__, |\__,_|_|  \___/ \___/ "
echo "                           __/ |                      "
echo "                          |___/                  _,'  ___         "
echo "            _   __                     _       <__\__/   \        "
echo "           | | / /                    | |         \_  /  _\       "
echo "           | |/ /  ___ _ __ _ __   ___| |            \,\ / \\     "
echo "           |    \ / _ \ '__| '_ \ / _ \ |              //   \\    "
echo "           | |\  \  __/ |  | | | |  __/ |            ,/'     '\_, "
echo "           \_| \_/\___|_|  |_| |_|\___|_|             "
echo
echo -e "\e[0m"

DATE_START=$(date +"%s")

export ARCH=arm
export SUBARCH=arm
export PATH=$PATH:~/Documents/gcc-linaro-4.9.4-2017.01-x86_64_arm-eabi/bin/
export CROSS_COMPILE=arm-eabi-

make "flo_defconfig"
make -j2

# Display build stats
DATE_END=$(date +"%s")
DIFF=$(($DATE_END - $DATE_START))
echo
echo "  Build finished in $(($DIFF / 60))m $(($DIFF % 60))s"
echo "  Finish time: $(date +"%r")"
echo

