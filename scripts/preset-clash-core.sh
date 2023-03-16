#!/bin/bash
#=================================================
# File name: preset-clash-core.sh
# Usage: <preset-clash-core.sh $platform> | example: <preset-clash-core.sh armv8>
# System Required: Linux
# Version: 1.0
# Lisence: MIT
# Author: SuLingGG
# Blog: https://mlapp.cn
#=================================================

mkdir -p files/etc/openclash/core




# openclash 的 dev内核
CLASH_DEV_URL="https://github.com/vernesong/OpenClash/raw/core/master/dev/clash-linux-${1}.tar.gz"
# openclash 的 TUN内核
CLASH_TUN_VERSION=$(curl -sL https://github.com/vernesong/OpenClash/raw/core/master/core_version | head -n 2 | tail -n 1)
CLASH_TUN_URL="https://github.com/vernesong/OpenClash/raw/core/master/premium/clash-linux-${1}-$CLASH_TUN_VERSION.gz"
# openclash 的 Meta内核版本
CLASH_META_URL="https://github.com/vernesong/OpenClash/raw/core/master/meta/clash-linux-${1}.tar.gz"

# CLASH_DEV_URL="https://raw.githubusercontent.com/vernesong/OpenClash/master/core-lateset/dev/clash-linux-${1}.tar.gz"
# CLASH_TUN_URL=$(curl -fsSL https://api.github.com/repos/vernesong/OpenClash/contents/core-lateset/premium | grep download_url | grep $1 | awk -F '"' '{print $4}')
# CLASH_META_URL="https://raw.githubusercontent.com/vernesong/OpenClash/master/core-lateset/meta/clash-linux-${1}.tar.gz"
GEOIP_URL="https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geoip.dat"
GEOSITE_URL="https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geosite.dat"

wget -qO- $CLASH_DEV_URL | tar xOvz > files/etc/openclash/core/clash
wget -qO- $CLASH_TUN_URL | gunzip -c > files/etc/openclash/core/clash_tun
wget -qO- $CLASH_META_URL | tar xOvz > files/etc/openclash/core/clash_meta
wget -qO- $GEOIP_URL > files/etc/openclash/GeoIP.dat
wget -qO- $GEOSITE_URL > files/etc/openclash/GeoSite.dat

chmod +x files/etc/openclash/core/clash*
