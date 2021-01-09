#!/bin/bash
#=================================================
# File name: init-settings.sh
# Description: This script will be execute during the first boot
# Author: SuLingGG
# Blog: https://mlapp.cn
#=================================================

# Set default theme to luci-theme-argon
uci set luci.main.mediaurlbase='/luci-static/argon'

# Disable luci-udptools autostart
rm -f /etc/rc.d/S98udptools || true

# Try to execute init.sh (if exists)

if [ ! -f "/boot/init.sh" ]; then
bash /boot/init.sh
fi

exit 0
