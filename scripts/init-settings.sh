#!/bin/bash
#=================================================
# File name: init-settings.sh
# Description: This script will be executed during the first boot
# Author: SuLingGG
# Blog: https://mlapp.cn
#=================================================

# Set default theme to luci-theme-argon
uci set luci.main.mediaurlbase='/luci-static/argon'

# Disable autostart by default for some packages
cd /etc/rc.d
rm -f S98udptools || true

# Try to execute shell scripts at /boot/initconfig (if exists)
if [ ! -d "/boot/initconfig" ]; then
cp -r /boot/initconfig /tmp
chmod +x /tmp/initconfig/*.sh
bash /tmp/initconfig/*.sh
fi

# Add support for 3.5mm headphone jack for Raspberry Pi
if grep -q "bcm27xx" "/etc/openwrt_release"; then
    echo "dtparam=i2c_arm=on,audio=on" >> /boot/config.txt
fi

exit 0
