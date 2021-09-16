#!/bin/bash
#=================================================
# File name: init-settings.sh
# Description: This script will be executed during the first boot
# Author: SuLingGG
# Blog: https://mlapp.cn
#=================================================

# Set default theme to luci-theme-argon
uci set luci.main.mediaurlbase='/luci-static/argon'

# Check file system during boot
uci set fstab.@global[0].check_fs=1
uci commit

# Disable opkg signature check
sed -i 's/option check_signature/# option check_signature/g' /etc/opkg.conf

# Disable autostart by default for some packages
cd /etc/rc.d
rm -f S98udptools || true

exit 0
