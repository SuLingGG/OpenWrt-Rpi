#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=================================================

# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate

# Add luci-app-ssr-plus
pushd package/lean
git clone --depth=1 https://github.com/fw876/helloworld
popd

# Clone community packages to package/community
mkdir package/community
pushd package/community

# Add Lienol's Packages
git clone --depth=1 https://github.com/Lienol/openwrt-package
rm -rf ../lean/luci-app-kodexplorer

# Add luci-app-passwall
git clone --depth=1 https://github.com/xiaorouji/openwrt-passwall

# Add luci-app-vssr <M>
git clone --depth=1 https://github.com/jerrykuku/lua-maxminddb.git
git clone --depth=1 https://github.com/jerrykuku/luci-app-vssr

# Add mentohust & luci-app-mentohust
git clone --depth=1 https://github.com/BoringCat/luci-app-mentohust
git clone --depth=1 https://github.com/KyleRicardo/MentoHUST-OpenWrt-ipk

# Add luci-proto-minieap
git clone --depth=1 https://github.com/ysc3839/luci-proto-minieap

# Add ServerChan
git clone --depth=1 https://github.com/tty228/luci-app-serverchan

# Add OpenClash
git clone --depth=1 -b master https://github.com/vernesong/OpenClash

# Add luci-app-onliner
git clone --depth=1 https://github.com/rufengsuixing/luci-app-onliner

# Add luci-app-diskman
git clone --depth=1 https://github.com/SuLingGG/luci-app-diskman
mkdir parted
cp luci-app-diskman/Parted.Makefile parted/Makefile

# Add luci-app-dockerman
rm -rf ../lean/luci-app-docker
git clone --depth=1 https://github.com/lisaac/luci-app-dockerman
git clone --depth=1 https://github.com/lisaac/luci-lib-docker

# Add luci-theme-argon
git clone --depth=1 -b 18.06 https://github.com/jerrykuku/luci-theme-argon
git clone --depth=1 https://github.com/jerrykuku/luci-app-argon-config
rm -rf ../lean/luci-theme-argon

#-----------------------------------------------------------------------------
#   Start of @helmiau additionals packages for cloning repo 
#-----------------------------------------------------------------------------

# Add luci-theme-opentopd
git clone --depth=1 https://github.com/sirpdboy/luci-theme-opentopd.git

# Add luci-proto-modemmanager
# git clone --depth=1 https://github.com/nickberry17/luci-proto-modemmanager.git #For OpenWrt 18.xx and below only. 
git clone --depth=1 https://github.com/rickydee/luci-proto-modemmanager.git #For OpenWrt 19.xx and above only. 

# Add openwrt badvpn-tun2socks
git clone --depth=1 https://github.com/friyadhibiermann/openwrt_badvpn-tun2socks

# Add modeminfo
git clone --depth=1 https://github.com/koshev-msk/luci-app-modeminfo

# Add luci-app-smstools3
git clone --depth=1 https://github.com/koshev-msk/luci-app-smstools3

# Add luci-app-mmconfig : configure modem cellular bands via mmcli utility
git clone --depth=1 https://github.com/koshev-msk/luci-app-mmconfig

# Add 3ginfo, luci-app-3ginfo
git clone --depth=1 https://github.com/4IceG/luci-app-3ginfo

# Add luci-app-sms-tool
git clone --depth=1 https://github.com/4IceG/luci-app-sms-tool

# Add luci-app-atinout-mod
git clone --depth=1 https://github.com/4IceG/luci-app-atinout-mod

#-----------------------------------------------------------------------------
#   End of @helmiau additionals packages for cloning repo 
#-----------------------------------------------------------------------------

# Add subconverter
git clone --depth=1 https://github.com/tindy2013/openwrt-subconverter

# Add luci-udptools
svn co https://github.com/zcy85611/Openwrt-Package/trunk/luci-udptools
svn co https://github.com/zcy85611/Openwrt-Package/trunk/udp2raw
svn co https://github.com/zcy85611/Openwrt-Package/trunk/udpspeeder-tunnel

# Add OpenAppFilter
git clone --depth=1 https://github.com/destan19/OpenAppFilter

# Add luci-app-oled (R2S Only)
git clone --depth=1 https://github.com/NateLol/luci-app-oled

# Add extra wireless drivers
svn co https://github.com/immortalwrt/immortalwrt/branches/openwrt-18.06-k5.4/package/kernel/rtl8812au-ac
svn co https://github.com/immortalwrt/immortalwrt/branches/openwrt-18.06-k5.4/package/kernel/rtl8821cu
svn co https://github.com/immortalwrt/immortalwrt/branches/openwrt-18.06-k5.4/package/kernel/rtl8188eu
svn co https://github.com/immortalwrt/immortalwrt/branches/openwrt-18.06-k5.4/package/kernel/rtl8192du
svn co https://github.com/immortalwrt/immortalwrt/branches/openwrt-18.06-k5.4/package/kernel/rtl88x2bu

# Add apk (Apk Packages Manager)
svn co https://github.com/openwrt/packages/trunk/utils/apk
popd

# Mod zzz-default-settings
pushd package/lean/default-settings/files
sed -i '/http/d' zzz-default-settings
export orig_version="$(cat "zzz-default-settings" | grep DISTRIB_REVISION= | awk -F "'" '{print $2}')"
sed -i "s/${orig_version}/${orig_version} ($(date +"%Y-%m-%d"))/g" zzz-default-settings
popd

# Use Lienol's https-dns-proxy package
pushd feeds/packages/net
rm -rf https-dns-proxy
svn co https://github.com/Lienol/openwrt-packages/trunk/net/https-dns-proxy
popd

# Use snapshots' syncthing package
pushd feeds/packages/utils
rm -rf syncthing
svn co https://github.com/openwrt/packages/trunk/utils/syncthing
popd

# Fix mt76 wireless driver
pushd package/kernel/mt76
sed -i '/mt7662u_rom_patch.bin/a\\techo mt76-usb disable_usb_sg=1 > $\(1\)\/etc\/modules.d\/mt76-usb' Makefile
popd

# Change default shell to zsh
sed -i 's/\/bin\/ash/\/usr\/bin\/zsh/g' package/base-files/files/etc/passwd

#-----------------------------------------------------------------------------
#   Start of @helmiau terminal scripts additionals menu
#-----------------------------------------------------------------------------

# Add neofetch
wget -O package/base-files/files/bin/neofetch "https://raw.githubusercontent.com/helmiau/OpenWrt-Rpi/main/files/bin/neofetch" && chmod +x package/base-files/files/bin/neofetch

# Add speedtest
wget -O package/base-files/files/bin/speedtest "https://raw.githubusercontent.com/vitoharhari/speedtest/main/speedtest" && chmod +x package/base-files/files/bin/speedtest

# Add vmess creator account from racevpn.com
# run "vmess" using terminal to create free vmess account
wget -O package/base-files/files/bin/vmess "https://raw.githubusercontent.com/ryanfauzi1/vmesscreator/main/vmess" && chmod +x package/base-files/files/bin/vmess

# Add ram checker from wegare123
# run "ram" using terminal to check ram usage
wget -O package/base-files/files/bin/ram "https://raw.githubusercontent.com/wegare123/ram/main/ram.sh" && chmod +x package/base-files/files/bin/ram

# Add fix download file.php for xderm and libernet
# run "fixphp" using terminal for use
wget -O package/base-files/files/bin/fixphp "https://raw.githubusercontent.com/helmiau/openwrt-config/main/fix-xderm-libernet-gui" && chmod +x package/base-files/files/bin/fixphp

# Add shadowsocksr shortcut ssr
wget -O package/base-files/files/bin/ssr-rst "https://raw.githubusercontent.com/helmiau/OpenWrt-Rpi/main/files/bin/ssr-rst" && chmod +x package/base-files/files/bin/ssr-rst
wget -O package/base-files/files/bin/ssr-start "https://raw.githubusercontent.com/helmiau/OpenWrt-Rpi/main/files/bin/ssr-start" && chmod +x package/base-files/files/bin/ssr-start
wget -O package/base-files/files/bin/ssr-stop "https://raw.githubusercontent.com/helmiau/OpenWrt-Rpi/main/files/bin/ssr-stop" && chmod +x package/base-files/files/bin/ssr-stop

# Add IP Address Info Checker
# run "myip" using terminal for use
wget -O package/base-files/files/bin/myip "https://raw.githubusercontent.com/helmiau/OpenWrt-Rpi/main/files/bin/myip" && chmod +x package/base-files/files/bin/myip

# Add Samba Allowed Guest Setup
# run "sambaset" using terminal to set it up
wget -O package/base-files/files/bin/sambaset "https://raw.githubusercontent.com/helmiau/OpenWrt-Rpi/main/files/bin/sambaset" && chmod +x package/base-files/files/bin/sambaset

# Add language changer to auto
wget -O package/base-files/files/bin/changelang "https://raw.githubusercontent.com/helmiau/OpenWrt-Rpi/main/files/bin/changelang" && chmod +x package/base-files/files/bin/changelang

# Add refresh IP Address for QMI Modems, such as LT4220
# Script by Rudi Hartono https://www.facebook.com/rud18
wget -O package/base-files/files/bin/ipqmi "https://raw.githubusercontent.com/helmiau/OpenWrt-Rpi/main/files/bin/ipqmi" && chmod +x package/base-files/files/bin/ipqmi

#-----------------------------------------------------------------------------
#   End of @helmiau terminal scripts additionals menu
#-----------------------------------------------------------------------------
