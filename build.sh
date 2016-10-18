#!/bin/bash

# Choose random color
FONT_COLORS=(31 32 33 34 35 36 91 92 93 94 95 96 97)
COLOR=$(($RANDOM % ${#FONT_COLORS[@]}))

echo -e "\e[${FONT_COLORS[$COLOR]}m "
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
echo "                                                      "
echo -e "\033[0m                                            "

DATE_START=$(date +"%s")
export LOCALVERSION=""

export ARCH=arm
export SUBARCH=arm
export PATH=$PATH:~/gcc-linaro-4.9-2016.02-x86_64_arm-eabi/bin/
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
