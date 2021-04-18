## OpenWrt custom firmware for Raspberry Pi
Raspberry Pi 4 OpenWrt Compile Project. (Based on [SuLingGG OpenWrt-Rpi](https://github.com/SuLingGG/OpenWrt-Rpi) compiled using GitHub Actions). This project also available for Raspberry Pi 1/2/3

<details><summary>Main firmware features : (click to show)</summary>
<p>

- Contains rich OpenWrt original LuCI plug-ins and community LuCI plug-ins
- Integrate most wired, wireless, 3G/4G network card drivers, no need to install additional
- Pre-install the latest version of Clash core and oh-my-zsh to minimize configuration costs
- Pre-install all kmod ipk software packages in the firmware, pre-configure the local opkg software source, keep away from kmod conflicts
- More comprehensive IPV6 support, the firmware built-in IPV6 CLI configuration tool, you can quickly install/uninstall/configure IPV6
- Pull the latest OpenWrt source code and community plug-in source code at 2:00 am every day to compile and provide split downloads to ensure that you always get the latest experience
- Provide packages-server (including WEB server package archive), which can quickly establish LAN software source under Windows
- For advanced users, provide OpenWrt Image Builder, OpenWrt SDK, OpenWrt Tool Chain, and dl archive files
Contains scientific Internet tools:
- The firmware supports the following scientific Internet tools: ①ShadowSocksR Plus+ ②Passwall ③OpenClash
- Among them, ShadowSocksR Plus+ in Offical version firmware is transplanted from Lean version source code.
- Both now support SS/SSR/V2ray/Trojan/Socks5 protocol, support Kcptun, support Netflix streaming, support link/subscription import node, Socks5 server, access control, automatic switching of failed nodes. Among them, Passwall additionally supports Brook and V2ray diversion.
- For OpenClash, the latest version of Clash core (clash/clash_tun/clash_game) has been pre-installed in the firmware, and it can be used out of the box without additional download.
- Support ad blocking AdGuard Home
```sh
Note: The advertisement blocking effect at the router level is not good. If you are very sensitive to advertisements, it is recommended to use the browser plug-in-level advertisement blocking plugin. In addition, ad blocking tools may severely affect internet speed.
```
- Support to unlock NetEase Cloud gray songs:
- Contains three schemes of Golang/Nodejs/cloud unlocking.
- Support Jingdong sign-in service, you can get 20+ golden beans/day unattended.
- Support Docker container arm and aarch64 (arm64) architecture images. Before pulling the image, please confirm that the image has the above architecture version and use the corresponding architecture tag to pull it.
- Support AirPlay2 and PCHiFi digital turntable remote control function, you can push music to the Raspberry Pi to play and control through the AirPlay feature.
- Support Samba/CIFSD/FTP/SFTP file transfer, support mounting Samba/NFS file system to local, support Syncthing and VerySync synchronization, support Rclone to mount network disk files to local.
- Support disk management, you can create/remove partitions and create Raid arrays with one click.
- Support file assistant / file browser (Filemanager) / Kodexplorer (Kodexplorer), can manage the files in OpenWrt online.
- Support Aria2 and Transmission download tools, you can download http/https/BT seeds/magnet links to Raspberry Pi.
- Support SSR server (libv/python), V2ray server, Brook server, Trojan server, PPTP VPN server, IPSec VPN server, OpenVPN server, N2N v2 VPN, ZeroTier, support OpenVPN client, PPTP/L2TP client, OpenConnect client, WireGuard VPN.
- Support DDNS (support Dnspod and Alibaba Cloud DDNS), SmartDNS, ARP binding.
- Support Frpc/NPS intranet penetration and Frps server.
- Support WeChat push (Server sauce), USB print server, KMS server, Wake-on-LAN, Thunderbird, Tianyi Family Cloud/Cloud Disk to speed up.
- Support SQM Qos, Socat, support udpspeeder and udp2raw acceleration, support SFE acceleration, bridge acceleration, IPV6 acceleration, FULLCONE NAT acceleration, BBR acceleration.
- Support multi-line multi-dial, load balancing, MWAN3 shunt assistant.

</p>
</details>


<details><summary>My own configurations : (click to show)</summary>
<p>

- Added speedtest and neofetch command
- Removed all languages except English
- Set English as default language
- Set timezone to WIB-7 Asia/Jakarta
- Add shutdown, poweroff, reboot commands
- Loadbalance 4 USB Hilink

</p>
</details>


### Firmware Requirements and Installation

**Minimum Requirements :**
1. SDCard 4GB
2. Raspberry Pi 1/2/3/4
3. PC/Laptop with Windows OS
4. MicroSD Adapter/converter

**Installation Steps :**
1. Download latest firmware for Raspberry Pi [1/1B](https://github.com/helmiau/OpenWrt-Rpi/releases/tag/openwrt-rpi-1) | [2/2B](https://github.com/helmiau/OpenWrt-Rpi/releases/tag/openwrt-rpi-2) | [3/3B/3B+](https://github.com/helmiau/OpenWrt-Rpi/releases/tag/openwrt-rpi-3) | [4/4B](https://github.com/helmiau/OpenWrt-Rpi/releases/tag/openwrt-rpi-4) which contain **sysupgrade** or **factory** words 
2. Download [Rufus](https://github.com/pbatard/rufus/releases/download/v3.13/rufus-3.13p.exe) or [Balena Ecther](https://github.com/balena-io/etcher/releases/latest)
3. Insert SdCard
4. Open Rufus/Etcher
5. Select disk (sdcard)
6. Drag and drop downloaded firmware to Rufus window
7. Start

### Login Information
```
Router IP	: 192.168.1.1
Username	: root
Password	: password
```

### Credits
- [OpenWrt Official](https://github.com/openwrt/openwrt)
- [P3TERX/Actions-OpenWrt](https://github.com/P3TERX/Actions-OpenWrt)
- [coolsnowwolf/lede](https://github.com/coolsnowwolf/lede)
- [SuLingGG/OpenWrt-Rpi](https://github.com/SuLingGG/OpenWrt-Rpi)
- [ophub/amlogic-s9xxx-openwrt](https://github.com/ophub/amlogic-s9xxx-openwrt)
- [Kry9toN/openwrt-amlogic](https://github.com/Kry9toN/openwrt-amlogic)

[Read more original README](https://github.com/helmiau/OpenWrt-Rpi/blob/main/README_ORIGINAL.md#openwrt-rpi)
