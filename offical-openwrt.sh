#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=================================================
# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate

# Clone Lean's latest sources. (use --depth=1) 
pushd package
git clone --depth=1 https://github.com/coolsnowwolf/lede
popd

# Copy Lean's packages to ./package/lean.
mkdir package/lean
pushd package/lede/package/lean
cp -r {adbyby,automount,baidupcs-web,ddns-scripts_aliyun,ddns-scripts_dnspod,ipt2socks,kcptun,luci-app-adbyby-plus,luci-app-autoreboot,luci-app-baidupcs-web,luci-app-familycloud,luci-app-flowoffload,luci-app-kodexplorer,luci-app-mwan3helper,luci-app-n2n_v2,luci-app-netdata,luci-app-nps,luci-app-syncdial,luci-app-usb-printer,luci-app-unblockmusic,luci-app-unblockneteasemusic-go,luci-app-unblockneteasemusic-mini,luci-app-verysync,luci-app-vsftpd,luci-app-xlnetacc,luci-app-zerotier,n2n_v2,npc,pdnsd-alt,shadowsocksr-libev,simple-obfs,srelay,trojan,UnblockNeteaseMusic,UnblockNeteaseMusicGo,v2ray,v2ray-plugin,verysync,vsftpd-alt} "../../../lean"
popd

# Add upx & ucl
pushd package/lede/tools
cp -r {upx,ucl} "../../../tools"
popd
sed -i 's/tools-\$(CONFIG_TARGET_x86) += qemu/tools-y += ucl upx\ntools-\$(CONFIG_TARGET_x86) += qemu/g' tools/Makefile

# Clean Lean's code
pushd package
rm -rf lede
popd

# Clone community packages to package/community
mkdir package/community
pushd package/community

# Add mentohust & luci-app-mentohust.
git clone https://github.com/BoringCat/luci-app-mentohust
git clone https://github.com/KyleRicardo/MentoHUST-OpenWrt-ipk

# Add ServerChan.
git clone https://github.com/tty228/luci-app-serverchan

# Add OpenClash.
git clone https://github.com/vernesong/OpenClash

# Add luci-app-koolproxyR.
git clone https://github.com/Leo-Jo/luci-app-koolproxyR

# Add luci-app-onliner. (need luci-app-nlbwmon)
git clone https://github.com/rufengsuixing/luci-app-onliner

# Add luci-app-dockerman.
git clone https://github.com/lisaac/luci-lib-docker
git clone https://github.com/lisaac/luci-app-dockerman

# Add luci-app-adguardhome.
git clone https://github.com/rufengsuixing/luci-app-adguardhome

# Add openwrt-iptvhelper.
git clone https://github.com/riverscn/openwrt-iptvhelper

# Add luci-app-diskman.
git clone https://github.com/lisaac/luci-app-diskman
mkdir parted
cp luci-app-diskman/Parted.Makefile parted/Makefile

# Add luci-theme-argon
git clone https://github.com/jerrykuku/luci-theme-argon

# Add smartdns
svn co https://github.com/pymumu/smartdns/trunk/package/openwrt ../smartdns
git clone https://github.com/SuLingGG/luci-app-smartdns ../luci-app-smartdns

# Add OpenAppFilter
git clone https://github.com/destan19/OpenAppFilter

# Add default settings.
git clone https://github.com/SuLingGG/default-settings

# Add luci-app-vssr
git clone https://github.com/Leo-Jo-My/luci-app-vssr

# Dependces & Optimizations for luci-app-vssr
svn co https://github.com/Leo-Jo-My/my/trunk/dnscrypt-proxy-full
svn co https://github.com/Leo-Jo-My/my/trunk/openwrt-dnsforwarder
svn co https://github.com/Leo-Jo-My/my/trunk/openwrt-udp2raw-speeder
svn co https://github.com/Leo-Jo-My/my/trunk/GoQuiet
svn co https://github.com/Leo-Jo-My/my/trunk/chinadns
sed -i 's/mux = 1/mux = 0/g' luci-app-vssr/root/usr/share/vssr/subscribe.lua
rm -rf ../../feeds/packages/net/kcptun

# Subscribe converters
svn co https://github.com/project-openwrt/openwrt/trunk/package/ctcgfw/subconverter
svn co https://github.com/project-openwrt/openwrt/trunk/package/ctcgfw/jpcre2
svn co https://github.com/project-openwrt/openwrt/trunk/package/ctcgfw/rapidjson

# Patch time
# Add fullconenat patch
git clone https://github.com/QiuSimons/openwrt-fullconenat
popd

# Firewall patch
mkdir package/network/config/firewall/patches
pushd package/network/config/firewall/patches
wget -P ../network/config/firewall/patches/ https://github.com/LGA1150/fullconenat-fw3-patch/raw/master/fullconenat.patch
popd

# LuCI Patch
pushd feeds/luci
wget -O- https://github.com/LGA1150/fullconenat-fw3-patch/raw/master/luci.patch | git apply
popd

# Kernel patch
pushd target/linux/generic/hack-4.19
wget https://github.com/coolsnowwolf/lede/raw/master/target/linux/generic/hack-4.19/952-net-conntrack-events-support-multiple-registrant.patch
popd

# Enable irqbalance
sed -i 's/0/1/g' feeds/packages/utils/irqbalance/files/irqbalance.config

# Max connections
sed -i 's/16384/65536/g' package/kernel/linux/files/sysctl-nf-conntrack.conf

# Change timezone
sed -i "s/'UTC'/'CST-8'\n        set system.@system[-1].zonename='Asia\/Shanghai'/g" package/base-files/files/bin/config_generate

# Change default theme
sed -i 's/config internal themes/config internal themes\n    option Argon  \"\/luci-static\/argon\"/g' feeds/luci/modules/luci-base/root/etc/config/luci

# Remove bootstrap theme
sed -i '/set luci.main.mediaurlbase=\/luci-static\/bootstrap/d' feeds/luci/themes/luci-theme-bootstrap/root/etc/uci-defaults/30_luci-theme-bootstrap

# Convert Translation
cp ../convert_translation.sh .
chmod +x ./convert_translation.sh
./convert_translation.sh || true
