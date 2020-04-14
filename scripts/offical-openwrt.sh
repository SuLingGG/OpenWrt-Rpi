#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=================================================
# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate

# Clone Lean's latest sources.
pushd package
git clone --depth=1 https://github.com/coolsnowwolf/lede
popd

# Copy Lean's packages to ./package/lean.
mkdir package/lean
pushd package/lede/package/lean
cp -r {adbyby,automount,autocore,baidupcs-web,ddns-scripts_aliyun,ddns-scripts_dnspod,dns2socks,frp,ipt2socks,ipv6-helper,kcptun,luci-app-adbyby-plus,luci-app-airplay2,luci-app-arpbind,luci-app-autoreboot,luci-app-baidupcs-web,luci-app-cifs-mount,luci-app-cpufreq,luci-app-familycloud,luci-app-filetransfer,luci-app-frpc,luci-app-frps,luci-app-n2n_v2,luci-app-netdata,luci-app-nfs,luci-app-nps,luci-app-softethervpn,luci-app-ssr-plus,luci-app-usb-printer,luci-app-unblockmusic,luci-app-vsftpd,luci-app-webadmin,luci-app-xlnetacc,luci-app-zerotier,luci-lib-fs,microsocks,n2n_v2,npc,pdnsd-alt,proxychains-ng,redsocks2,shadowsocksr-libev,simple-obfs,softethervpn5,srelay,tcpping,trojan,UnblockNeteaseMusic,UnblockNeteaseMusicGo,v2ray,v2ray-plugin,vsftpd-alt} "../../../lean"
popd

# Default settings
pushd package/lean
git clone --depth=1 https://github.com/SuLingGG/default-settings
popd

# Clean Lean's code
pushd package
rm -rf lede
popd

# Clone community packages to package/community
mkdir package/community
pushd package/community

# Add Lienol's Packages (From CTCGFW's repositories)
svn co https://github.com/project-openwrt/openwrt/branches/openwrt-19.07/package/lienol

# Add luci-app-pptp-vpnserver-manyusers
svn co https://github.com/Lienol/openwrt-package/trunk/lienol/luci-app-pptp-vpnserver-manyusers lienol/luci-app-pptp-vpnserver-manyusers

# Add chinadns-ng
svn co https://github.com/Lienol/openwrt-package/trunk/package/chinadns-ng lienol/chinadns-ng

# Add mentohust & luci-app-mentohust.
git clone --depth=1 https://github.com/BoringCat/luci-app-mentohust
git clone --depth=1 https://github.com/KyleRicardo/MentoHUST-OpenWrt-ipk

# Add ServerChan.
git clone --depth=1 https://github.com/tty228/luci-app-serverchan

# Add OpenClash.
git clone --depth=1 https://github.com/vernesong/OpenClash

# Add luci-app-koolproxyR.
git clone --depth=1 https://github.com/project-openwrt/luci-app-koolproxyR

# Add luci-app-onliner. (need luci-app-nlbwmon)
git clone --depth=1 https://github.com/rufengsuixing/luci-app-onliner

# Add luci-app-adguardhome.
git clone --depth=1 https://github.com/rufengsuixing/luci-app-adguardhome

# Add openwrt-iptvhelper.
git clone --depth=1 https://github.com/riverscn/openwrt-iptvhelper

# Add luci-app-diskman.
git clone --depth=1 https://github.com/lisaac/luci-app-diskman
mkdir parted
cp luci-app-diskman/Parted.Makefile parted/Makefile

# Add luci-theme-argon
git clone --depth=1 https://github.com/jerrykuku/luci-theme-argon

# Add smartdns
svn co https://github.com/pymumu/smartdns/trunk/package/openwrt ../smartdns
svn co https://github.com/project-openwrt/openwrt/trunk/package/ntlf9t/luci-app-smartdns ../luci-app-smartdns

# Add udptools
git clone --depth=1 https://github.com/bao3/openwrt-udp2raw
git clone --depth=1 https://github.com/bao3/openwrt-udpspeeder
git clone --depth=1 https://github.com/bao3/luci-udptools

# luci-app-dockerman
mkdir luci-lib-docker
wget https://raw.githubusercontent.com/lisaac/luci-lib-docker/master/Makefile -O luci-lib-docker/Makefile
mkdir luci-app-dockerman
wget https://raw.githubusercontent.com/lisaac/luci-app-dockerman/master/Makefile -O luci-app-dockerman/Makefile

# Add tmate
svn co https://github.com/project-openwrt/openwrt/trunk/package/ctcgfw/tmate
svn co https://github.com/project-openwrt/openwrt/trunk/package/ctcgfw/msgpack-c

# Add gotop
svn co https://github.com/project-openwrt/openwrt/trunk/package/ctcgfw/gotop

# Subscribe converters
svn co https://github.com/project-openwrt/openwrt/trunk/package/ctcgfw/subconverter
svn co https://github.com/project-openwrt/openwrt/trunk/package/ctcgfw/jpcre2
svn co https://github.com/project-openwrt/openwrt/trunk/package/ctcgfw/rapidjson
popd

# Remove orig kcptun
rm -rf ./feeds/packages/net/kcptun

# Enable irqbalance
sed -i 's/0/1/g' feeds/packages/utils/irqbalance/files/irqbalance.config

# Max connections
sed -i 's/16384/65536/g' package/kernel/linux/files/sysctl-nf-conntrack.conf

# Remove IPV6
sed -i 's/ip6tables //g' include/target.mk
sed -i 's/odhcpd-ipv6only odhcp6c //g' include/target.mk

# Change dnsmasq to dnsmasq-full
sed -i 's/dnsmasq i/dnsmasq-full i/g' include/target.mk

# Convert Translation
cp ../scripts/convert_translation.sh .
chmod +x ./convert_translation.sh
./convert_translation.sh || true

# Remove upx
cp ../scripts/remove_upx.sh .
chmod +x ./remove_upx.sh
./remove_upx.sh || true
