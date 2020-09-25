<h1><center><b><a href="https://github.com/SuLingGG/OpenWrt-Rpi">OpenWrt-Rpi</a></b></center></h1>

* 本项目提供适配于 树莓派全系设备 (1~4)、NanoPi R2S (Beta)、竞斗云 2.0 以及 x86 平台的 OpenWrt 固件
* 包含丰富的 OpenWrt 原版 LuCI 插件及社区 LuCI 插件
* 集成绝大多数有线、无线、3G/4G 网卡驱动，无需另外安装
* 预置最新版 Clash 核心、预置 oh-my-zsh 以最大程度减少预配置成本
* 预置所有 kmod ipk 软件包于固件内，预配置本地 opkg 软件源，远离 kmod 冲突
* 比较全面的 IPV6 支持，固件内置 IPV6 CLI 配
* 置工具，可快速 安装/卸载/变更 IPV6 模式
* 每日凌晨 2:00 拉取最新 OpenWrt 源码及社区插件源码编译并提供分流下载，确保始终获得最新体验
* 提供 packages-server (包含 WEB 服务器的软件包归档)，可在 Windows 下快速建立局域网软件源
* 对于高级用户，提供 OpenWrt Image Builder、OpenWrt SDK、OpenWrt Tool Chain、dl 归档文件
* 若在使用过程中遇到任何功能问题，请先查阅 [Wiki](https://github.com/SuLingGG/OpenWrt-Rpi/wiki)，如仍没有得到满意答案，可以提交 Issues 或通过以下联系方式咨询:
* 联系方式: [QQ 群](https://jq.qq.com/?_wv=1027&k=5RkQisS) / [Telegram 群组](https://t.me/joinchat/Fc-MpxcaH3mEPA4yOMtJPQ) / [Telegram 频道](https://t.me/beautifulapps)
<hr>

## 设备支持列表

| 支持设备/版本(内核) |                          Lean (5.4)                          |                        Offical (5.4)                         |                        Project (5.4)                         |
| :-----------------: | :----------------------------------------------------------: | :----------------------------------------------------------: | :----------------------------------------------------------: |
|       竞斗云        | [✅](https://github.com/SuLingGG/OpenWrt-Rpi/actions?query=workflow%3A%22Build+G-Dock+Lean%27s+OpenWrt%22) |                              -                               | [✅](https://github.com/SuLingGG/OpenWrt-Rpi/actions?query=workflow%3A%22Build+G-Dock+Project+OpenWrt%22) |
|      树莓派 1B      | [✅](https://github.com/SuLingGG/OpenWrt-Rpi/actions?query=workflow%3A%22Build+Raspberry+Pi+1+Lean%27s+OpenWrt%22) | [✅](https://github.com/SuLingGG/OpenWrt-Rpi/actions?query=workflow%3A%22Build+Raspberry+Pi+1+Offical+OpenWrt%22) |                              -                               |
|      树莓派 2B      | [✅](https://github.com/SuLingGG/OpenWrt-Rpi/actions?query=workflow%3A%22Build+Raspberry+Pi+2+Lean%27s+OpenWrt%22) | [✅](https://github.com/SuLingGG/OpenWrt-Rpi/actions?query=workflow%3A%22Build+Raspberry+Pi+2+Offical+OpenWrt%22) |                              -                               |
|    树莓派 3B/3B+    | [✅](https://github.com/SuLingGG/OpenWrt-Rpi/actions?query=workflow%3A%22Build+Raspberry+Pi+3+Lean%27s+OpenWrt%22) | [✅](https://github.com/SuLingGG/OpenWrt-Rpi/actions?query=workflow%3A%22Build+Raspberry+Pi+3+Offical+OpenWrt%22) |                              -                               |
|      树莓派 4B      | [✅](https://github.com/SuLingGG/OpenWrt-Rpi/actions?query=workflow%3A%22Build+Raspberry+Pi+4+Lean%27s+OpenWrt%22) | [✅](https://github.com/SuLingGG/OpenWrt-Rpi/actions?query=workflow%3A%22Build+Raspberry+Pi+4+Offical+OpenWrt%22) |                              -                               |
|  NanoPi R2S (Beta)  | [✅](https://github.com/SuLingGG/OpenWrt-Rpi/actions?query=workflow%3A%22Build%20NanoPi%20R2S%20Lean's%20OpenWrt%22) |                              -                               |                              -                               |
|    x86_64 (64位)    | [✅](https://github.com/SuLingGG/OpenWrt-Rpi/actions?query=workflow%3A%22Build+x86_64+Lean%27s+OpenWrt%22) |                              -                               |                              -                               |
| x86_generic (32位)  | [✅](https://github.com/SuLingGG/OpenWrt-Rpi/actions?query=workflow%3A%22Build+x86_generic+Lean%27s+OpenWrt%22) |                              -                               |                              -                               |

## 鸣谢：

P3TERX/Actions-OpenWrt (本项目基于此项目):

https://github.com/P3TERX/Actions-OpenWrt

OpenWrt Source Repository:

https://github.com/openwrt/openwrt/

Lean's OpenWrt source:

https://github.com/coolsnowwolf/lede

CTCGFW's Team:

https://github.com/project-openwrt
