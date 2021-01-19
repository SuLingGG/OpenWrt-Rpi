#!/bin/bash
#=================================================
# File name: init-settings.sh
# Description: This script will be execute during the first boot
# Author: SuLingGG
# Blog: https://mlapp.cn
#=================================================

# Set default theme to luci-theme-argon
uci set luci.main.mediaurlbase='/luci-static/argon'

# Disable autostart by default for some packages
cd /etc/rc.d
rm -f S98udptools || true
rm -f S99nft-qos || true

# Try to execute init.sh (if exists)

if [ ! -f "/boot/init.sh" ]; then
bash /boot/init.sh
fi

exit 0
