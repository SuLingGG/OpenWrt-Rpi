#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=================================================
# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate

# Remove r8168 driver
rm -rf package/ctcgfw/r8168

# Clone community packages to package/community
mkdir package/community
pushd package/community

# Use latest luci-theme-argon
rm -rf package/ctcgfw/luci-theme*
rm -rf package/lean/luci-theme*
rm -rf package/lienol/luci-theme*
pushd package/community
git clone -b 18.06 --depth=1 https://github.com/jerrykuku/luci-theme-argon
git clone --depth=1 https://github.com/jerrykuku/luci-app-argon-config
popd

# Mod zzz-default-settings
sed -i "/commit luci/i\uci set luci.main.mediaurlbase='/luci-static/argon'" package/lean/default-settings/files/zzz-default-settings

# Add po2lmo
git clone https://github.com/openwrt-dev/po2lmo.git
pushd po2lmo
make && sudo make install
popd
