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
sed -i "s/lang 'zh_cn'/lang 'auto'/g" /etc/config/luci
uci set luci.main.lang='en'
sed -i "s/lang 'zh_cn'/lang 'en'/g" /etc/config/luci

# Add shutdown, poweroff, reboot commands
cat >> /etc/config/luci <<EOF


config command
	option name 'Shutdown'
	option command 'halt'

config command
	option name 'Power Off'
	option command 'poweroff'

config command
	option name 'Reboot'
	option command 'reboot'

config command
	option name 'ShadowsocksR Restart'
	option command '/etc/init.d/shadowsocksr restart'

config command
	option name 'ShadowsocksR Stop'
	option command '/etc/init.d/shadowsocksr stop'

config command
	option name 'Restart Load Balance'
	option command 'mwan3 restart'


EOF

#uci commit
uci commit

# Disable autostart by default for some packages
cd /etc/rc.d
rm -f S98udptools || true

# Add shadowsocksr shortcut
cat >> /bin/ssr-restart <<EOF
/etc/init.d/shadowsocksr restart
EOF
cat >> /bin/ssr-stop <<EOF
/etc/init.d/shadowsocksr stop
EOF
cat >> /bin/ssr-start <<EOF
/etc/init.d/shadowsocksr start
EOF
chmod +x /bin/ssr-restart
chmod +x /bin/ssr-stop
chmod +x /bin/ssr-start

# Added neofetch on oh-my-zsh
if grep -q neofetch "/root/.oh-my-zsh/custom/example.zsh"; then
    echo "neofetch available, then skip"
else
	echo "neofetch" > /root/.oh-my-zsh/custom/example.zsh
fi

exit 0
