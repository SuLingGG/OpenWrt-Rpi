#!/bin/bash

# Change packages & luci feeds to immortalwrt's feeds
sed -i 's/coolsnowwolf\/packages/immortalwrt\/packages.git\;openwrt-18.06/g' feeds.conf.default
sed -i 's/coolsnowwolf\/luci/immortalwrt\/luci.git\;openwrt-18.06/g' feeds.conf.default

# Complete missing dependences
pushd package/libs
svn co https://github.com/immortalwrt/immortalwrt/trunk/package/libs/libaudit
svn co https://github.com/immortalwrt/immortalwrt/trunk/package/libs/musl-fts
svn co https://github.com/immortalwrt/immortalwrt/trunk/package/libs/musl-fts
svn co https://github.com/immortalwrt/immortalwrt/trunk/package/libs/libsemanage
popd
pushd package/lean
svn co https://github.com/immortalwrt/immortalwrt/trunk/package/lean/wsdd2
svn co https://github.com/immortalwrt/immortalwrt/trunk/package/lean/bonding
popd
