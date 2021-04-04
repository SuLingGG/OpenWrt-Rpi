#!/bin/bash
#=================================================
# File name: init-settings.sh
# Description: This script will be executed during the first boot
# Author: SuLingGG
# Blog: https://mlapp.cn
#=================================================

# Set default theme to luci-theme-argon
uci set luci.main.mediaurlbase='/luci-static/argon'

# Set Argon theme to light on first boot
uci set argon.@global[0].mode='light'

# Set hostname to HelmiWrt
uci set system.@system[0].hostname='HelmiWrt'

# Set Timezone to Asia/Jakarta
uci set system.@system[0].timezone='WIB-7'
uci set system.@system[0].zonename='Asia/Jakarta'

# Set default language to Auto
uci set luci.main.lang='auto'
sed -i "s/lang 'zh_cn'/lang 'auto'/g" package/base-files/files/etc/config/luci

# Add shutdown, poweroff, reboot commands
uci set luci.@command[0]=command
uci set luci.@command[0].name='Shutdown'
uci set luci.@command[0].command='halt'
uci set luci.@command[1]=command
uci set luci.@command[1].name='Power Off'
uci set luci.@command[1].command='poweroff'
uci set luci.@command[2]=command
uci set luci.@command[2].name='Reboot'
uci set luci.@command[2].command='reboot'
uci set luci.@command[3]=command
uci set luci.@command[3].name='ShadowsocksR Restart'
uci set luci.@command[3].command='/etc/init.d/shadowsocksr restart'
uci set luci.@command[4]=command
uci set luci.@command[4].name='ShadowsocksR Stop'
uci set luci.@command[4].command='/etc/init.d/shadowsocksr stop'
uci set luci.@command[5]=command
uci set luci.@command[5].name='Restart Load Balance'
uci set luci.@command[5].command='mwan3 restart'

#uci commit
uci commit

# Disable autostart by default for some packages
cd /etc/rc.d
rm -f S98udptools || true

exit 0
