#!/bin/bash
#=================================================
# File name: hook-feeds.sh
# Usage: "hook-feeds.sh $branch" | example: "hook-feeds.sh master" or "hook-feeds.sh openwrt-18.06"
# Author: SuLingGG
# Blog: https://mlapp.cn
#=================================================

# Clone packages feeds
mkdir customfeeds
git clone --depth=1 https://github.com/coolsnowwolf/packages customfeeds/packages
git clone --depth=1 https://github.com/coolsnowwolf/luci customfeeds/luci

# Svn checkout packages from immortalwrt's repository
pushd customfeeds

# Add luci-app-adguardhome
svn co https://github.com/immortalwrt/luci/branches/$1/applications/luci-app-adguardhome luci/applications/luci-app-adguardhome
svn co https://github.com/immortalwrt/packages/branches/$1/net/adguardhome packages/net/adguardhome

# Add luci-app-gowebdav
svn co https://github.com/immortalwrt/luci/branches/$1/applications/luci-app-gowebdav luci/applications/luci-app-gowebdav
svn co https://github.com/immortalwrt/packages/branches/$1/net/gowebdav packages/net/gowebdav

# Add netdata
rm -rf packages/admin/netdata
svn co https://github.com/immortalwrt/packages/trunk/admin/netdata packages/admin/netdata

# Add smartdns
svn co https://github.com/immortalwrt/packages/branches/$1/net/smartdns packages/net/smartdns

# Add tmate
svn co https://github.com/immortalwrt/packages/branches/$1/net/tmate packages/net/tmate
svn co https://github.com/immortalwrt/packages/branches$1/libs/msgpack-c packages/libs/msgpack-c

# Add gotop
svn co https://github.com/immortalwrt/packages/branches/$1/admin/gotop packages/admin/gotop
popd

# Set to local feeds
pushd customfeeds/packages
export packages_feed="$(pwd)"
popd
pushd customfeeds/luci
export luci_feed="$(pwd)"
popd
sed -i '/src-git packages/d' feeds.conf.default
echo "src-link packages $packages_feed" >> feeds.conf.default
sed -i '/src-git luci/d' feeds.conf.default
echo "src-link luci $luci_feed" >> feeds.conf.default

# Update feeds
./scripts/feeds update -a
