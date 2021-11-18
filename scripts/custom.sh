#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=================================================
# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate

# Mod zzz-default-settings
pushd package/emortal/default-settings/files
sed -i '/http/d' zzz-default-settings
sed -i '/openwrt_luci/d' zzz-default-settings
export orig_version=$(cat "zzz-default-settings" | grep DISTRIB_REVISION= | awk -F "'" '{print $2}')
export date_version=$(date -d "$(rdate -n -4 -p pool.ntp.org)" +'%Y-%m-%d')
sed -i "s/${orig_version}/${orig_version} (${date_version})/g" zzz-default-settings
popd

# Clone community packages to package/community
mkdir package/community
pushd package/community

# Add luci-app-bypass
git clone --depth=1 https://github.com/garypang13/luci-app-bypass
git clone --depth=1 https://github.com/garypang13/smartdns-le

# Add luci-app-godproxy
git clone --depth=1 https://github.com/project-lede/luci-app-godproxy

# Add luci-app-modeminfo
git clone --depth=1 https://github.com/koshev-msk/luci-app-modeminfo

# Add luci-app-tcpdump
git clone --depth=1 https://github.com/KFERMercer/luci-app-tcpdump

# Add luci-app-oaf
git clone --depth=1 https://github.com/destan19/OpenAppFilter -b oaf-3.0.1

# Add luci-theme-argon_armygreen
git clone --depth=1 https://github.com/XXKDB/luci-theme-argon_armygreen
popd

# Fix mt76 wireless driver
pushd package/kernel/mt76
sed -i '/mt7662u_rom_patch.bin/a\\techo mt76-usb disable_usb_sg=1 > $\(1\)\/etc\/modules.d\/mt76-usb' Makefile
popd

# Rename hostname to OpenWrt
pushd package/base-files/files/bin
sed -i 's/ImmortalWrt/OpenWrt/g' config_generate
popd

# Fix SDK
sed -i '/$(SDK_BUILD_DIR)\/$(STAGING_SUBDIR_HOST)\/usr\/bin/d' target/sdk/Makefile

# Fix Toolchain
sed -i 's/LICENSE/LICENSES/g' target/toolchain/Makefile

# Change default shell to zsh
sed -i 's/\/bin\/ash/\/usr\/bin\/zsh/g' package/base-files/files/etc/passwd
