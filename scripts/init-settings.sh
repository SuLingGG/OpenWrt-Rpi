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

# Add support for USB_LAN78XX Pi Compute Module 4 carrier boards
cd /lib/firmware/brcm
if [ `ls -l|grep '4-compute-module.txt'|wc -l` -eq 0 ]; then
    cp brcmfmac43455-sdio.raspberrypi,4-model-b.txt brcmfmac43455-sdio.raspberrypi,4-compute-module.txt
fi

exit 0
