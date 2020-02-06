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
cd package/community

# Add mentohust & luci-app-mentohust.
git clone https://github.com/BoringCat/luci-app-mentohust
git clone https://github.com/KyleRicardo/MentoHUST-OpenWrt-ipk

# Add ServerChan
git clone https://github.com/tty228/luci-app-serverchan

# Add OpenClash
git clone https://github.com/vernesong/OpenClash

# Add luci-app-koolproxyR
git clone https://github.com/Leo-Jo/luci-app-koolproxyR

# Add luci-app-onliner (need luci-app-nlbwmon)
git clone https://github.com/rufengsuixing/luci-app-onliner

# Add luci-app-dockerman
git clone https://github.com/lisaac/luci-lib-docker
git clone https://github.com/lisaac/luci-app-dockerman

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

# Change timezone
cd ../..
sed -i "s/'UTC'/'CST-8'\n        set system.@system[-1].zonename='Asia\/Shanghai'/g" package/base-files/files/bin/config_generate

# Change default theme
sed -i 's/config internal themes/config internal themes\n    option Argon  \"\/luci-static\/argon\"/g' feeds/luci/modules/luci-base/root/etc/config/luci

# Remove bootstrap theme
sed -i '/set luci.main.mediaurlbase=\/luci-static\/bootstrap/d' feeds/luci/themes/luci-theme-bootstrap/root/etc/uci-defaults/30_luci-theme-bootstrap
