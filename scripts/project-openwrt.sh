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

# Add luci-app-jd-dailybonus
git clone --depth=1 https://github.com/jerrykuku/node-request
git clone --depth=1 https://github.com/jerrykuku/luci-app-jd-dailybonus
popd

# Use latest luci-theme-argon
pushd package/ctcgfw
rm -rf luci-theme*
git clone -b 18.06 --depth=1 https://github.com/jerrykuku/luci-theme-argon
popd

# Add po2lmo
git clone https://github.com/openwrt-dev/po2lmo.git
pushd po2lmo
make && sudo make install
popd
