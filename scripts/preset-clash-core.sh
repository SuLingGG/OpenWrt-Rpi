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

OPENCLASH_MAIN_URL=$( curl -sL https://api.github.com/repos/vernesong/OpenClash/releases/tags/Clash | grep /clash-linux-armv8 | awk -F '"' '{print $4}')
# OFFICAL_OPENCLASH_MAIN_URL=$(curl -sL https://api.github.com/repos/Dreamacro/clash/releases/tags/v1.3.5 | grep /clash-linux-$1 | awk -F '"' '{print $4}')
CLASH_TUN_URL=$(curl -sL https://api.github.com/repos/vernesong/OpenClash/releases/tags/TUN-Premium | grep /clash-linux-$1 | awk -F '"' '{print $4}')
CLASH_GAME_URL=$(curl -sL https://api.github.com/repos/vernesong/OpenClash/releases/tags/TUN | grep /clash-linux-$1 | awk -F '"' '{print $4}')

wget -qO- $OPENCLASH_MAIN_URL | tar xOvz > files/etc/openclash/core/clash
# wget -qO- $OFFICAL_OPENCLASH_MAIN_URL | gunzip -c > files/etc/openclash/core/clash
wget -qO- $CLASH_TUN_URL | gunzip -c > files/etc/openclash/core/clash_tun
wget -qO- $CLASH_GAME_URL | tar xOvz > files/etc/openclash/core/clash_game

chmod +x files/etc/openclash/core/clash*
