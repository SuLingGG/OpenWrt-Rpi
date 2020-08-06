#!/usr/bin/env ash
#=================================================
# File name: ipv6-helper
# Description: Install IPV6 Modules On OpenWrt
# System Required: OpenWrt
# Version: 1.0
# Lisence: MIT
# Author: SuLingGG
# Blog: https://mlapp.cn
#=================================================

Green_font_prefix="\033[32m"
Red_font_prefix="\033[31m"
Green_background_prefix="\033[42;37m"
Red_background_prefix="\033[41;37m"
Font_color_suffix="\033[0m"
INFO="[${Green_font_prefix}INFO${Font_color_suffix}]"
ERROR="[${Red_font_prefix}ERROR${Font_color_suffix}]"

Welcome(){
    echo -e "${Green_font_prefix}\nThis tool can help you install IPV6 modules on OpenWrt.\n${Font_color_suffix}"
    echo -e "Usage:"
    echo -e "ipv6-helper sub-command"
    echo -e "Example:"
    echo -e "\tipv6-helper install: Install ipv6-helper & IPV6 modules"
    echo -e "\tipv6-helper remove: Remove ipv6-helper & IPV6 modules"
    echo -e "\tipv6-helper clean: Remove mwan3 modules (Optional)\n"
}

RebootConfirm(){
    echo -n -e "${Green_font_prefix}Need reboot, reboot now [Y/N] (default N)? ${Font_color_suffix}" 
    read answer
        case $answer in
            Y | y)
            echo -e "Rebooting...\n" && reboot;;
            *)
            echo -e "You can reboot later manually.\n";;
        esac
}

if [ $# == 0 ];then
    Welcome

elif [[ $1 = "install" ]]; then
    echo -e "${Green_font_prefix}\nInstall IPV6 modules...\n${Font_color_suffix}"
    cd /www/ipv6-modules
    opkg install *.ipk
    echo -e "${Green_font_prefix}\nIPV6 modules install successfull.\n${Font_color_suffix}"
    echo -e "${Green_font_prefix}Set IPV6 Configurations...\n${Font_color_suffix}"
    
    uci set dhcp.lan.dhcpv6=hybrid
    uci set dhcp.lan.ndp=hybrid
    uci set dhcp.lan.ra=hybrid
    uci set dhcp.lan.ra_management=1
    uci commit dhcp.lan
    
    uci delete dhcp.@dnsmasq[0].filter_aaaa
    uci commit dhcp
    
    uci set mwan3.balanced.last_resort=default
    uci commit mwan3.balanced

    cp /lib/mwan3/mwan3.sh /lib/mwan3/mwan3.sh.orig
    sed -i 's/ip6tables -t manle -w/\/bin\/true/g' /lib/mwan3/mwan3.sh
    
    echo -e "${Green_font_prefix}IPV6 Configuration is successful.\n${Font_color_suffix}"
    
    RebootConfirm
    
elif [[ $1 = "remove" ]]; then
    echo -e "${Green_font_prefix}\nRemove IPV6 modules...\n${Font_color_suffix}"
    opkg remove --force-removal-of-dependent-packages ipv6helper kmod-sit odhcp6c luci-proto-ipv6 ip6tables kmod-ipt-nat6 odhcpd-ipv6only kmod-ip6tables-extra
    echo -e "${Green_font_prefix}\nIPV6 modules remove successfull.\n${Font_color_suffix}"
    echo -e "${Green_font_prefix}Unset IPV6 Configurations...\n${Font_color_suffix}"
    
    uci delete dhcp.lan.dhcpv6
    uci delete dhcp.lan.ndp
    uci delete dhcp.lan.ra
    uci delete dhcp.lan.ra_management
    uci commit dhcp.lan

    uci set dhcp.@dnsmasq[0].filter_aaaa=1
    uci commit dhcp
    
    uci set mwan3.balanced.last_resort=unreachable
    uci commit mwan3.balanced
    
    rm /lib/mwan3/mwan3.sh
    cp /lib/mwan3/mwan3.sh.orig /lib/mwan3/mwan3.sh
    echo -e "${Green_font_prefix}Remove IPV6 successfully.\n${Font_color_suffix}"
    
    RebootConfirm
    
elif [[ $1 = "clean" ]]; then
    echo -e "${Green_font_prefix}\nRemove mwan3 modules...\n${Font_color_suffix}"
    opkg remove mwan3 luci-app-mwan3 luci-app-mwan3helper luci-app-syncdial
    echo -e "${Green_font_prefix}Remove mwan3 modules successfully.\n${Font_color_suffix}"
    
    RebootConfirm
    
fi

exit 0
