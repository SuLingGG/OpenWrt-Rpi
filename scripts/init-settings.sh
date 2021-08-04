#!/bin/bash
#=================================================
# File name: init-settings.sh
# Description: This script will be executed during the first boot
# Author: SuLingGG
# Blog: https://mlapp.cn
#=================================================

#-----------------------------------------------------------------------------
#   Start of @helmiau additionals menu
#-----------------------------------------------------------------------------

# Set default theme to luci-theme-argon
uci set luci.main.mediaurlbase='/luci-static/argon'

# Set Argon theme to light on first boot
uci set argon.@global[0].mode='light'

# Set hostname to HelmiWrt
uci set system.@system[0].hostname='HelmiWrt'

# Set Timezone to Asia/Jakarta
uci set system.@system[0].timezone='WIB-7'
uci set system.@system[0].zonename='Asia/Jakarta'

# Add shadowsocksr shortcut
chmod +x /bin/ssr-rst
chmod +x /bin/ssr-start
chmod +x /bin/ssr-stop

# Added neofetch on oh-my-zsh
if grep -q neofetch "/root/.oh-my-zsh/custom/example.zsh"; then
    echo "neofetch available, then skip"
else
	echo "neofetch" > /root/.oh-my-zsh/custom/example.zsh
	echo 'echo "======================================================"' >> /root/.oh-my-zsh/custom/example.zsh
	echo 'echo "       This firmware is modded by helmiau.com"' >> /root/.oh-my-zsh/custom/example.zsh
	echo 'echo "======================================================"' >> /root/.oh-my-zsh/custom/example.zsh
	echo 'echo "       Additional command lists by helmiau.com"' >> /root/.oh-my-zsh/custom/example.zsh
	echo 'echo "======================================================"' >> /root/.oh-my-zsh/custom/example.zsh
	echo 'echo "  ram       : Check ram usage and running applications."' >> /root/.oh-my-zsh/custom/example.zsh
	echo 'echo "  sambaset  : Add samba Allowed Guest."' >> /root/.oh-my-zsh/custom/example.zsh
	echo 'echo "  fixphp    : Fix download index.php for xderm and libernet."' >> /root/.oh-my-zsh/custom/example.zsh
	echo 'echo "  myip      : Check your public IP Address Informations."' >> /root/.oh-my-zsh/custom/example.zsh
	echo 'echo "  ipqmi     : refresh IP Address for QMI Modems, such as LT4220."' >> /root/.oh-my-zsh/custom/example.zsh
	echo 'echo "  vmess     : Free vmess account for 3 days by racevpn.com."' >> /root/.oh-my-zsh/custom/example.zsh
	echo 'echo "======================================================"' >> /root/.oh-my-zsh/custom/example.zsh
	echo "echo '  LuCI IP   : $(uci show network | grep network.lan.ipaddr | {awk -F"'" '$0=$2'})'" >> /root/.oh-my-zsh/custom/example.zsh
	echo 'echo "  Public IP : $(curl -s ip-api.com/line/\?fields=query)"' >> /root/.oh-my-zsh/custom/example.zsh
	echo 'echo "  ISP       : $(curl -s ip-api.com/line/\?fields=isp)"' >> /root/.oh-my-zsh/custom/example.zsh
	echo 'echo "======================================================"' >> /root/.oh-my-zsh/custom/example.zsh
fi

# Vmess creator shortcut
chmod +x /bin/vmess

# Add ram checker from wegare123
# run "ram" using terminal to check ram usage
chmod +x /bin/ram

# Add fix download file.php for xderm and libernet
# run "fixphp" using terminal for use
chmod +x /bin/fixphp

# Add IP Address Info Checker
# run "myip" using terminal for use
chmod +x /bin/myip

# Add Samba Allowed Guest Setup
# run "sambaset" using terminal to set it up
chmod +x /bin/sambaset

# Add refresh IP Address for QMI Modems, such as LT4220
# Script by Rudi Hartono https://www.facebook.com/rud18
chmod +x /bin/ipqmi

# Fix luci-app-atinout-mod by 4IceG
chmod +x /usr/bin/luci-app-atinout

# Fix for xderm mini gui if trojan is not installed
ln -sf /usr/sbin/trojan /usr/bin/trojan

# Add language changer to auto ! This line below must be placed in end of file before exit command
chmod +x /bin/changelang

#-----------------------------------------------------------------------------
#   Start of @helmiau additionals menu
#-----------------------------------------------------------------------------

# Disable autostart by default for some packages
cd /etc/rc.d
rm -f S98udptools || true

reboot
exit 0
