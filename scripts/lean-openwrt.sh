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

# Add mentohust & luci-app-mentohust.
git clone --depth=1 https://github.com/BoringCat/luci-app-mentohust
git clone --depth=1 https://github.com/KyleRicardo/MentoHUST-OpenWrt-ipk

# Add ServerChan
git clone --depth=1 https://github.com/tty228/luci-app-serverchan

# Add OpenClash
git clone --depth=1 https://github.com/vernesong/OpenClash

# Add luci-app-onliner (need luci-app-nlbwmon)
git clone --depth=1 https://github.com/rufengsuixing/luci-app-onliner

# Add luci-app-adguardhome
git clone --depth=1 https://github.com/rufengsuixing/luci-app-adguardhome

# Add Rclone-OpenWrt
git clone --depth=1 https://github.com/ElonH/Rclone-OpenWrt

# Add luci-app-diskman
git clone --depth=1 https://github.com/lisaac/luci-app-diskman
mkdir parted
cp luci-app-diskman/Parted.Makefile parted/Makefile

# Add luci-app-dockerman
git clone --depth=1 https://github.com/KFERMercer/luci-app-dockerman
mkdir luci-lib-docker
curl -s -o ./luci-lib-docker/Makefile https://raw.githubusercontent.com/lisaac/luci-lib-docker/master/Makefile
rm -rf ../lean/luci-app-dockerman

# Add luci-theme-argon
git clone --depth=1 -b 18.06 https://github.com/jerrykuku/luci-theme-argon
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
svn co https://github.com/project-openwrt/openwrt/trunk/package/ntlf9t/luci-app-smartdns ../luci-app-smartdns

# Add udptools
git clone --depth=1 https://github.com/bao3/openwrt-udp2raw
git clone --depth=1 https://github.com/bao3/openwrt-udpspeeder
git clone --depth=1 https://github.com/bao3/luci-udptools

# Add OpenAppFilter
git clone --depth=1 https://github.com/destan19/OpenAppFilter
popd

# Fix libssh
pushd feeds/packages/libs
rm -rf libssh
svn co https://github.com/openwrt/packages/trunk/libs/libssh
popd

# Mod default-settings
pushd package/lean/default-settings/files
sed -i 's/exit 0//g' zzz-default-settings
cat <<EOT >> zzz-default-settings
sed -i 's/https:\/\/openwrt.proxy.ustclug.org\/snapshots\/targets/http:\/\/127.0.0.1\/snapshots\/targets/g' /etc/opkg/distfeeds.conf
sed -i 's/openwrt.proxy.ustclug.org/mirrors.zju.edu.cn\/openwrt/g' /etc/opkg/distfeeds.conf
mv /www/snapshots/ipkg-make-index.sh /www/snapshots/targets/*/*/packages
cd /www/snapshots/targets/*/*/packages
chmod +x ipkg-make-index.sh
./ipkg-make-index.sh . > Packages
gzip -c Packages > Packages.gz
rm ipkg-make-index.sh
sed -i 's/option check_signature//g' /etc/opkg.conf
exit 0
EOT
popd
