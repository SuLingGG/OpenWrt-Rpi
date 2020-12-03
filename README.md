<h1><center><b><a href="https://github.com/SuLingGG/OpenWrt-Rpi">OpenWrt-Rpi</a></b></center></h1>

### 固件临时下载地址

https://drive.google.com/drive/u/1/folders/1SkNpJkhmG8veheL3ADVFoVTkvfhWjW0P

## 快速通道

我不想读文档，请将我快速传送到:

[**固件下载说明**](https://mlapp.cn/1007.html) | [**旁路由设置指南**](https://mlapp.cn/1008.html) | [**网卡支持与推荐**](https://mlapp.cn/1009.html) | [**IPV6指南**](https://mlapp.cn/1005.html)

**如果以上四篇内容未能解决你的问题，请认真阅读文档。**

## 固件特色

- 本项目提供适配于 树莓派全系设备 (1~4)、NanoPi R2S (Beta)、竞斗云 2.0 以及 x86 平台的 OpenWrt 固件
- 包含丰富的 OpenWrt 原版 LuCI 插件及社区 LuCI 插件
- 集成绝大多数有线、无线、3G/4G 网卡驱动，无需另外安装
- 预置最新版 Clash 核心、预置 oh-my-zsh 以最大程度减少配置成本
- 预置所有 kmod ipk 软件包于固件内，预配置本地 opkg 软件源，远离 kmod 冲突
- 比较全面的 IPV6 支持，固件内置 IPV6 CLI 配置工具，可快速安装/卸载/配置 IPV6
- 每日凌晨 2:00 拉取最新 OpenWrt 源码及社区插件源码编译并提供分流下载，确保始终获得最新体验
- 提供 packages-server (包含 WEB 服务器的软件包归档)，可在 Windows 下快速建立局域网软件源
- 对于高级用户，提供 OpenWrt Image Builder、OpenWrt SDK、OpenWrt Tool Chain、dl 归档文件
- 若在固件使用前与使用过程中遇到任何功能问题，请先查阅本文所述内容，若仍没有得到满意答案，可以在此项目中提交 Issues 或通过以下方式咨询:
- 联系方式: [QQ 群](https://jq.qq.com/?_wv=1027&k=5RkQisS) / [Telegram 群组](https://t.me/joinchat/Fc-MpxcaH3mEPA4yOMtJPQ) / [Telegram 频道](https://t.me/beautifulapps) (加群前请务必仔细阅读文档)
- (其中 QQ 群为主力联系方式，Telegram 群组为备用联系方式，Telegram 频道将推送一些固件及文章更新内容的通知)

## 设备支持情况

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

## 相关文档

由于内容过多，为增加可读性，现将各板块内容分拆为文档分篇加以介绍:

[**固件特性**](https://mlapp.cn/1001.html): 分类别简要介绍固件内包含的插件和功能

[**版本区别**](https://mlapp.cn/1003.html): 包含 Lean、Offical、Project 三个版本之间的区别

[**设备概览**](https://mlapp.cn/1004.html): 介绍各设备固件的基本情况，同时包含各固件与相关文件的描述与介绍

[**IPV6指南**](https://mlapp.cn/1005.html): 包含借助 `ipv6-helper` CLI 工具快速配置 IPV6 的使用示例

[**命令行工具**](https://mlapp.cn/1006.html): 列举介绍了内置于固件内的命令行工具

[**分区扩容指南**](https://mlapp.cn/1011.html): 介绍了 ext4 和 squashfs 两种格式固件的根分区扩容方法

[**固件下载说明**](https://mlapp.cn/1007.html): 介绍了固件下载的三种方式与固件下载注意事项

[**旁路由设置指南**](https://mlapp.cn/1008.html): 以树莓派为例，介绍了旁路由配置的详细过程

[**网卡支持与推荐**](https://mlapp.cn/1009.html): 介绍了固件对于网卡的支持情况，并对网卡选购给出了一些建议

[**安装及初始设置**](https://mlapp.cn/1010.html): 包含固件在全新安装/升级/以及安装完成后一些初始设置的说明

## 固件预览

**主界面**:

![主界面](https://shop.io.mi-img.com/app/shop/img?id=shop_fe451b954836ce394de9c9c8ea8e2fca.png)

**内置功能**:

(建议保存至本地放大查看)

![内置功能](https://shop.io.mi-img.com/app/shop/img?id=shop_916dbe6c979ca94b52b6be2fc12eb120.png)

## 鸣谢

特别感谢以下项目：

Openwrt 官方项目：

<https://github.com/openwrt/openwrt>

Lean 大的 Openwrt 项目：

<https://github.com/coolsnowwolf/lede>

CTCGFW's Team 的 OpenWrt 项目：

<https://github.com/project-openwrt>

P3TERX 大佬的 Actions-OpenWrt 项目：

<https://github.com/P3TERX/Actions-OpenWrt>

详细贡献列表参见:

[CONTRIBUTED.md](https://github.com/SuLingGG/OpenWrt-Rpi/blob/main/CONTRIBUTED.md)

除这些项目之外，也特别感谢所有为 OpenWrt 项目及社区作出贡献的朋友们~
