#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=================================================
# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate

# Clone community packages to package/community
mkdir package/community
pushd package/community

# Add mentohust & luci-app-mentohust.
git clone https://github.com/BoringCat/luci-app-mentohust
git clone https://github.com/KyleRicardo/MentoHUST-OpenWrt-ipk

# Add ServerChan
git clone https://github.com/tty228/luci-app-serverchan

# Add OpenClash
git clone https://github.com/vernesong/OpenClash

# Add luci-app-koolproxyR
git clone https://github.com/jefferymvp/luci-app-koolproxyR

# Add luci-app-onliner (need luci-app-nlbwmon)
git clone https://github.com/rufengsuixing/luci-app-onliner

# Add luci-app-adguardhome
git clone https://github.com/rufengsuixing/luci-app-adguardhome

# Add Rclone-OpenWrt
git clone https://github.com/ElonH/Rclone-OpenWrt

# Add luci-app-diskman
git clone https://github.com/lisaac/luci-app-diskman
mkdir parted
cp luci-app-diskman/Parted.Makefile parted/Makefile

# Add luci-theme-argon
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon
rm -rf ../lean/luci-theme-argon

# Add tmate
svn co https://github.com/project-openwrt/openwrt/trunk/package/ctcgfw/tmate
svn co https://github.com/project-openwrt/openwrt/trunk/package/ctcgfw/msgpack-c

# Add gotop
svn co https://github.com/project-openwrt/openwrt/trunk/package/ctcgfw/gotop

# Subscribe converters
svn co https://github.com/project-openwrt/openwrt/trunk/package/ctcgfw/subconverter
svn co https://github.com/project-openwrt/openwrt/trunk/package/ctcgfw/jpcre2
svn co https://github.com/project-openwrt/openwrt/trunk/package/ctcgfw/rapidjson

# Add smartdns
svn co https://github.com/pymumu/smartdns/trunk/package/openwrt ../smartdns
git clone https://github.com/SuLingGG/luci-app-smartdns ../luci-app-smartdns

# Add OpenAppFilter
git clone https://github.com/destan19/OpenAppFilter
popd

# Fix libssh
pushd feeds/packages/libs
rm -rf libssh
svn co https://github.com/openwrt/packages/trunk/libs/libssh
popd

# Add local opkg sources
sed -i "/https/a\sed -i 's/https:\\\/\\\/openwrt.proxy.ustclug.org\\\/snapshots\\\/targets/http:\\\/\\\/127.0.0.1\\\/snapshots\\\/targets/g' \/etc\/opkg\/distfeeds.conf" package/lean/default-settings/files/zzz-default-settings
