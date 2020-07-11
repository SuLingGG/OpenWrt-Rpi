#!/bin/bash

# This script is only for Raspberry Pi 4, Thanks @xmapst

sed -i 's/36/44/g;s/VHT80/VHT20/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh
sed -i 's/disabled=1/disabled=0/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh
