## OpenWrt custom firmware for Raspberry Pi
Raspberry Pi 4 OpenWrt Compile Project. (Based on [SuLingGG OpenWrt-Rpi](https://github.com/SuLingGG/OpenWrt-Rpi) compiled using GitHub Actions). This project also available for Raspberry Pi 1/2/3

<details><summary>Main firmware features : (click to show)</summary>
<p>
<ul>
<li>Contains rich OpenWrt original LuCI plug-ins and community LuCI plug-ins</li>
<li>Integrate most wired, wireless, 3G/4G network card drivers, no need to install additional</li>
<li>Pre-install the latest version of Clash core and oh-my-zsh to minimize configuration costs</li>
<li>Pre-install all kmod ipk software packages in the firmware, pre-configure the local opkg software source, keep away from kmod conflicts</li>
<li>More comprehensive IPV6 support, the firmware built-in IPV6 CLI configuration tool, you can quickly install/uninstall/configure IPV6</li>
<li>Pull the latest OpenWrt source code and community plug-in source code at 2:00 am every day to compile and provide split downloads to ensure that you always get the latest experience</li>
<li>Provide packages-server (including WEB server package archive), which can quickly establish LAN software source under Windows</li>
<li>For advanced users, provide OpenWrt Image Builder, OpenWrt SDK, OpenWrt Tool Chain, and dl archive files
Contains scientific Internet tools:</li>
<li>The firmware supports the following scientific Internet tools: ①ShadowSocksR Plus+ ②Passwall ③OpenClash</li>
<li>Among them, ShadowSocksR Plus+ in Offical version firmware is transplanted from Lean version source code.</li>
<li>Both now support SS/SSR/V2ray/Trojan/Socks5 protocol, support Kcptun, support Netflix streaming, support link/subscription import node, Socks5 server, access control, automatic switching of failed nodes. Among them, Passwall additionally supports Brook and V2ray diversion.</li>
<li>For OpenClash, the latest version of Clash core (clash/clash_tun/clash_game) has been pre-installed in the firmware, and it can be used out of the box without additional download.</li>
<li>Support ad blocking AdGuard Home<blockquote>
<p>Note: The advertisement blocking effect at the router level is not good. If you are very sensitive to advertisements, it is recommended to use the browser plug-in-level advertisement blocking plugin. In addition, ad blocking tools may severely affect internet speed.</p>
</blockquote>
</li>
<li>Support to unlock NetEase Cloud gray songs:</li>
<li>Contains three schemes of Golang/Nodejs/cloud unlocking.</li>
<li>Support Jingdong sign-in service, you can get 20+ golden beans/day unattended.</li>
<li>Support Docker container arm and aarch64 (arm64) architecture images. Before pulling the image, please confirm that the image has the above architecture version and use the corresponding architecture tag to pull it.</li>
<li>Support AirPlay2 and PCHiFi digital turntable remote control function, you can push music to the Raspberry Pi to play and control through the AirPlay feature.</li>
<li>Support Samba/CIFSD/FTP/SFTP file transfer, support mounting Samba/NFS file system to local, support Syncthing and VerySync synchronization, support Rclone to mount network disk files to local.</li>
<li>Support disk management, you can create/remove partitions and create Raid arrays with one click.</li>
<li>Support file assistant / file browser (Filemanager) / Kodexplorer (Kodexplorer), can manage the files in OpenWrt online.</li>
<li>Support Aria2 and Transmission download tools, you can download http/https/BT seeds/magnet links to Raspberry Pi.</li>
<li>Support SSR server (libv/python), V2ray server, Brook server, Trojan server, PPTP VPN server, IPSec VPN server, OpenVPN server, N2N v2 VPN, ZeroTier, support OpenVPN client, PPTP/L2TP client, OpenConnect client, WireGuard VPN.</li>
<li>Support DDNS (support Dnspod and Alibaba Cloud DDNS), SmartDNS, ARP binding.</li>
<li>Support Frpc/NPS intranet penetration and Frps server.</li>
<li>Support WeChat push (Server sauce), USB print server, KMS server, Wake-on-LAN, Thunderbird, Tianyi Family Cloud/Cloud Disk to speed up.</li>
<li>Support SQM Qos, Socat, support udpspeeder and udp2raw acceleration, support SFE acceleration, bridge acceleration, IPV6 acceleration, FULLCONE NAT acceleration, BBR acceleration.</li>
<li>Support multi-line multi-dial, load balancing, MWAN3 shunt assistant.</li>
</ul>
</p>
</details>

<details><summary>My own configurations : (click to show)</summary>
<p>
<ul>
<li>Added speedtest and neofetch command.</li>
<li>Removed all languages except English.</li>
<li>Set English as default language.</li>
<li>Set timezone to WIB-7 Asia/Jakarta.</li>
<li>Add shutdown, poweroff, reboot commands.</li>
<li>Loadbalance 4 USB Hilink.</li>
<li>Add ShadowsocksR Plus+ shortcut (ssr-rst, ssr-start, ssr-stop).</li>
<li>QMI modems supported ex. LT4220.<ul>
<li>Add IP Refresh for QMI Modems by running <strong><code>ipqmi</code></strong> using terminal.</li>
<li>Auto reconnect QMI Modems without reboot.</li>
</ul>
</li>
<li>VPN support : PPTP / L2TP / ShadowSocks / ShadowSocksR / V2ray(VMESS/VLESS) / Trojan / Trojan-Go.</li>
<li>Extended root partition to 3GB.</li>
<li>RAM Checker via Terminal by command <strong><code>ram</code></strong>.</li>
<li>VMESS Account Creation (3 days) from racevpn.com via  Terminal by command <strong><code>vmess</code></strong>.</li>
<li>Fix browser always download file index.php (like xderm and libernet) via  Terminal by command <strong><code>fixphp</code></strong>.</li>
<li>Add IP Address Info Checker. run <strong><code>myip</code></strong> using terminal for use.</li>
<li>Add Samba Allowed user setup. This tool will help you to add Allowed User for Samba Directory.<ul>
<li>Run <strong><code>sambaset</code></strong> using terminal for use, then follow instruction.</li>
<li>Open Network Share <a href="https://192.168.1.1/cgi-bin/luci/admin/nas/samba">https://192.168.1.1/cgi-bin/luci/admin/nas/samba</a>.</li>
<li>Add shared directory, fill name, path with your shared directory.</li>
<li>Fill <strong>Allowed users</strong> with <strong>USER</strong>, check <strong>Browseable</strong>, uncheck <strong>Allowed Guests</strong> and <strong>Read-Only</strong>.</li>
<li>Save and Apply.</li>
</ul>
</li>
</ul>
</p>
</details>

### Previews Display & Features

See [video preview here](https://www.youtube.com/embed/HsDEWwgy-xg)

<details><summary>Click to show screenshots preview</summary>
<p>

<img src="https://github.com/helmiau/OpenWrt-Rpi/raw/main/preview/openwrt-rpi-1.png">
<br>
<img src="https://github.com/helmiau/OpenWrt-Rpi/raw/main/preview/openwrt-rpi-2.png">
<br>
<img src="https://github.com/helmiau/OpenWrt-Rpi/raw/main/preview/openwrt-rpi-3.png">
<br>
<img src="https://github.com/helmiau/OpenWrt-Rpi/raw/main/preview/openwrt-rpi-4.png">
<br>
<img src="https://github.com/helmiau/OpenWrt-Rpi/raw/main/preview/openwrt-rpi-5.png">
<br>
<img src="https://github.com/helmiau/OpenWrt-Rpi/raw/main/preview/openwrt-rpi-6.png">
<br>
<img src="https://github.com/helmiau/OpenWrt-Rpi/raw/main/preview/openwrt-rpi-7.png">
<br>
<img src="https://github.com/helmiau/OpenWrt-Rpi/raw/main/preview/openwrt-rpi-8.png">
<br>
<img src="https://github.com/helmiau/OpenWrt-Rpi/raw/main/preview/openwrt-rpi-9.png">
<br>
<img src="https://github.com/helmiau/OpenWrt-Rpi/raw/main/preview/openwrt-rpi-10.png">
<br>
<img src="https://github.com/helmiau/OpenWrt-Rpi/raw/main/preview/openwrt-rpi-11.png">
<br>
<img src="https://github.com/helmiau/OpenWrt-Rpi/raw/main/preview/openwrt-rpi-13.png">
<br>
<img src="https://github.com/helmiau/OpenWrt-Rpi/raw/main/preview/openwrt-rpi-14.png">
<br>
<img src="https://github.com/helmiau/OpenWrt-Rpi/raw/main/preview/openwrt-rpi-15.png">
<br>
<img src="https://github.com/helmiau/OpenWrt-Rpi/raw/main/preview/openwrt-rpi-16.png">
<br>
<img src="https://github.com/helmiau/OpenWrt-Rpi/raw/main/preview/openwrt-rpi-17.png">
<br>
	
</p>
</details>


### Firmware Requirements and Installation

**Minimum Requirements :**
1. SDCard 4GB
2. Raspberry Pi 1/2/3/4
3. PC/Laptop with Windows OS
4. MicroSD Adapter/converter

**Installation Steps :**
1. Download latest firmware from below link which contain **sysupgrade** or **factory** words

| Raspberry Pi<br />Version | Github<br />Release | squashfs<br />factory | squashfs<br />sysupgrade | ext4<br />factory | ext4<br />sysupgrade | rootfs |
| :-----------------------: | :----------------:  | :-------------------: | :----------------------: | :---------------: | :------------------: | :----: |
| 1/1B | [📂](https://github.com/helmiau/OpenWrt-Rpi/releases/tag/openwrt-rpi-1) | [🔽](https://github.com/helmiau/OpenWrt-Rpi/releases/download/openwrt-rpi-1/openwrt-bcm27xx-bcm2708-rpi-squashfs-factory.img.gz) | [🔽](https://github.com/helmiau/OpenWrt-Rpi/releases/download/openwrt-rpi-1/openwrt-bcm27xx-bcm2708-rpi-squashfs-sysupgrade.img.gz) | [🔽](https://github.com/helmiau/OpenWrt-Rpi/releases/download/openwrt-rpi-1/openwrt-bcm27xx-bcm2708-rpi-ext4-factory.img.gz) | [🔽](https://github.com/helmiau/OpenWrt-Rpi/releases/download/openwrt-rpi-1/openwrt-bcm27xx-bcm2708-rpi-ext4-sysupgrade.img.gz) | [🔽](https://github.com/helmiau/OpenWrt-Rpi/releases/download/openwrt-rpi-1/openwrt-bcm27xx-bcm2708-rpi-rootfs.tar.gz) |
| 2/2B | [📂](https://github.com/helmiau/OpenWrt-Rpi/releases/tag/openwrt-rpi-2) | [🔽](https://github.com/helmiau/OpenWrt-Rpi/releases/download/openwrt-rpi-2/openwrt-bcm27xx-bcm2709-rpi-2-squashfs-factory.img.gz) | [🔽](https://github.com/helmiau/OpenWrt-Rpi/releases/download/openwrt-rpi-2/openwrt-bcm27xx-bcm2709-rpi-2-squashfs-sysupgrade.img.gz) | [🔽](https://github.com/helmiau/OpenWrt-Rpi/releases/download/openwrt-rpi-2/openwrt-bcm27xx-bcm2709-rpi-2-ext4-factory.img.gz) | [🔽](https://github.com/helmiau/OpenWrt-Rpi/releases/download/openwrt-rpi-2/openwrt-bcm27xx-bcm2709-rpi-2-ext4-sysupgrade.img.gz) | [🔽](https://github.com/helmiau/OpenWrt-Rpi/releases/download/openwrt-rpi-2/openwrt-bcm27xx-bcm2709-rpi-2-rootfs.tar.gz) |
| 3/3B/3B+ | [📂](https://github.com/helmiau/OpenWrt-Rpi/releases/tag/openwrt-rpi-3) | [🔽](https://github.com/helmiau/OpenWrt-Rpi/releases/download/openwrt-rpi-3/openwrt-bcm27xx-bcm2710-rpi-3-squashfs-factory.img.gz) | [🔽](https://github.com/helmiau/OpenWrt-Rpi/releases/download/openwrt-rpi-3/openwrt-bcm27xx-bcm2710-rpi-3-squashfs-sysupgrade.img.gz) | [🔽](https://github.com/helmiau/OpenWrt-Rpi/releases/download/openwrt-rpi-3/openwrt-bcm27xx-bcm2710-rpi-3-ext4-factory.img.gz) | [🔽](https://github.com/helmiau/OpenWrt-Rpi/releases/download/openwrt-rpi-3/openwrt-bcm27xx-bcm2710-rpi-3-ext4-sysupgrade.img.gz) | [🔽](https://github.com/helmiau/OpenWrt-Rpi/releases/download/openwrt-rpi-3/openwrt-bcm27xx-bcm2710-rpi-3-rootfs.tar.gz) |
| 4/4B | [📂](https://github.com/helmiau/OpenWrt-Rpi/releases/tag/openwrt-rpi-4) | [🔽](https://github.com/helmiau/OpenWrt-Rpi/releases/download/openwrt-rpi-4/openwrt-bcm27xx-bcm2711-rpi-4-squashfs-factory.img.gz) | [🔽](https://github.com/helmiau/OpenWrt-Rpi/releases/download/openwrt-rpi-4/openwrt-bcm27xx-bcm2711-rpi-4-squashfs-sysupgrade.img.gz) | [🔽](https://github.com/helmiau/OpenWrt-Rpi/releases/download/openwrt-rpi-4/openwrt-bcm27xx-bcm2711-rpi-4-ext4-factory.img.gz) | [🔽](https://github.com/helmiau/OpenWrt-Rpi/releases/download/openwrt-rpi-4/openwrt-bcm27xx-bcm2711-rpi-4-ext4-sysupgrade.img.gz) | [🔽](https://github.com/helmiau/OpenWrt-Rpi/releases/download/openwrt-rpi-4/openwrt-bcm27xx-bcm2711-rpi-4-rootfs.tar.gz) |

2. Download [Rufus Portable](https://github.com/pbatard/rufus/releases/download/v3.15/rufus-3.15p.exe) or [Balena Etcher Portable](https://github.com/balena-io/etcher/releases/download/v1.5.121/balenaEtcher-Portable-1.5.121.exe)
3. Insert SdCard.
4. Open Rufus/Etcher.
5. Select disk (sdcard).
6. Drag and drop downloaded firmware to Rufus/Etcher window.
7. Start and wait until it finished.
8. Eject your sdcard.
9. Put it in to your Raspberry Pi sdcard slot.
10. Turn your Pi on, then open [LuCI TTYD Terminal](http://192.168.1.1/cgi-bin/luci/admin/system/terminal) or Putty
11. Run available commands such as helmilb, sambaset, etc. (Optional)


### Login Information
```
Router IP	: 192.168.1.1
Username	: root
Password	: password
```

### Note :
- Raspberry Pi will reboot automatically when first boot up after firmware installation.
- If you get blank when open TTYD (Terminal LuCi App), change [https://192.168.1.1/.../terminal](https://192.168.1.1/cgi-bin/luci/admin/system/terminal) to [http://192.168.1.1/.../terminal](http://192.168.1.1/cgi-bin/luci/admin/system/terminal)
- **ONLY ACCEPT DONATIONS BY CONTACTING ME FOR CONFIRMATION www.helmiau.com/about**
- **I REFUSE FEATURE REQUEST OR BUG FIX WITHOUT SUGGESTION, CODES OR ANYTHING.**


### Credits
- [OpenWrt Official](https://github.com/openwrt/openwrt) for main OpenWrt source.
- [P3TERX/Actions-OpenWrt](https://github.com/P3TERX/Actions-OpenWrt) for OpenWrt LEDE GitHub actions script builder.
- [coolsnowwolf/lede](https://github.com/coolsnowwolf/lede) for main build source and extended packages.
- [SuLingGG/OpenWrt-Rpi](https://github.com/SuLingGG/OpenWrt-Rpi) for base fork github actions.
- [ophub/amlogic-s9xxx-openwrt](https://github.com/ophub/amlogic-s9xxx-openwrt) for comparison actions build script.
- [Kry9toN/openwrt-amlogic](https://github.com/Kry9toN/openwrt-amlogic) for comparison actions, config.
- [Wega Regianto](https://github.com/wegare123/ram) for ram checker.
- [Ryan Fauzi](https://github.com/ryanfauzi1/vmesscreator) for vmess account creator provided by racevpn.com.
- [Rudi Hartono](https://www.facebook.com/rud18) for IP Address refresher script for QMI Modems & reconnect w/o reboot script.
- [LT4220 Facebook Forum](https://www.facebook.com/groups/2727709384212810) and it's [documentations](https://docs.google.com/document/d/10ldzikC9EdvXT43LEtct0qSwi5qWJk-LHFZFsl8_69E/edit#heading=h.ft8rlp9e08c4), **especially big thanks to [Nugroho](https://www.facebook.com/profile.php?id=100010890091391) as LT4220 documentation writer**
- [config example 1](https://github.com/eallion/openwrt/blob/main/.config)

[Read more original README](https://github.com/SuLingGG/OpenWrt-Rpi/blob/main/README.md#openwrt-rpi)

<h6 align="center">Copyright by <a href="http://www.helmiau.com">Helmi Amirudin</a> ® 2021 <br> Thank You ! 🤝</h6>
