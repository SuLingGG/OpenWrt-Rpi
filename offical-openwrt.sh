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
cd package
git clone --depth=1 https://github.com/coolsnowwolf/lede

# Copy Lean's packages to ./package/lean.
mkdir lean
cd lede/package/lean
cp -r {adbyby,automount,baidupcs-web,ddns-scripts_aliyun,ddns-scripts_dnspod,ipt2socks,luci-app-adbyby-plus,luci-app-baidupcs-web,luci-app-dnspod,luci-app-familycloud,luci-app-kodexplorer,luci-app-mwan3helper,luci-app-n2n_v2,luci-app-netdata,luci-app-nps,luci-app-syncdial,luci-app-unblockmusic,luci-app-verysync,luci-app-vsftpd,luci-app-xlnetacc,luci-app-zerotier,n2n_v2,npc,pdnsd-alt,shadowsocksr-libev,trojan,UnblockNeteaseMusic,v2ray,verysync,vsftpd-alt} "../../../lean"
cp -r {luci-app-smartdns,smartdns} "../../../"
cp -r ../kernel/antfs ../../../kernel
cd "../../../"
rm -rf lede

# Clone community packages to package/community
mkdir community && cd community

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

# Add luci-app-frpc.
git clone https://github.com/SuLingGG/luci-app-frpc

# Add luci-app-adguardhome.
git clone https://github.com/rufengsuixing/luci-app-adguardhome

# Add openwrt-iptvhelper.
git clone https://github.com/riverscn/openwrt-iptvhelper

# Add luci-app-diskman.
git clone https://github.com/lisaac/luci-app-diskman
mkdir parted
cp luci-app-diskman/Parted.Makefile parted/Makefile

# Add luci-app-vssr
git clone https://github.com/jerrykuku/luci-app-vssr

# Add luci-theme-argon
git clone https://github.com/jerrykuku/luci-theme-argon

# Add default settings.
git clone https://github.com/SuLingGG/default-settings

# Change timezone
cd ../..
sed -i "s/'UTC'/'CST-8'\n        set system.@system[-1].zonename='Asia\/Shanghai'/g" package/base-files/files/bin/config_generate

# Change default theme
sed -i 's/config internal themes/config internal themes\n    option Argon  \"\/luci-static\/argon\"/g' feeds/luci/modules/luci-base/root/etc/config/luci

# Remove bootstrap theme
sed -i '/set luci.main.mediaurlbase=\/luci-static\/bootstrap/d' feeds/luci/themes/luci-theme-bootstrap/root/etc/uci-defaults/30_luci-theme-bootstrap

# Convert Translation
cp ../convert_translation.sh .
chmod +x ./convert_translation.sh
./convert_translation.sh || true
