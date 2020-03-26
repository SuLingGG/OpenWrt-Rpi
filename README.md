# [OpenWrt-Rpi](https://github.com/SuLingGG/OpenWrt-Rpi)

## 支持设备与编译状态：

点击下表 “支持设备” 中相应设备名称即可跳转到该设备固件下载页面。

|                           支持设备                           |  版本   |                           编译状态                           |
| :----------------------------------------------------------: | :-----: | :----------------------------------------------------------: |
| [x86_64](https://github.com/SuLingGG/OpenWrt-Rpi/actions?query=workflow%3A%22Build+x86_64+Lean%27s+OpenWrt%22) |  Lean   | ![Build x86_64 Lean's OpenWrt](https://github.com/SuLingGG/OpenWrt-Rpi/workflows/Build%20x86_64%20Lean's%20OpenWrt/badge.svg) |
| [竞斗云(128M)](https://github.com/SuLingGG/OpenWrt-Rpi/actions?query=workflow%3A%22Build+G-Dock+Lean%27s+OpenWrt%22) |  Lean   | ![Build G-Dock Lean's OpenWrt](https://github.com/SuLingGG/OpenWrt-Rpi/workflows/Build%20G-Dock%20Lean's%20OpenWrt/badge.svg) |
| [树莓派 1B](https://github.com/SuLingGG/OpenWrt-Rpi/actions?query=workflow%3A%22Build+Raspberry+Pi+1+Lean%27s+OpenWrt%22) |  Lean   | ![Build Raspberry Pi 1 Lean's OpenWrt](https://github.com/SuLingGG/OpenWrt-Rpi/workflows/Build%20Raspberry%20Pi%201%20Lean's%20OpenWrt/badge.svg) |
| [树莓派 1B](https://github.com/SuLingGG/OpenWrt-Rpi/actions?query=workflow%3A%22Build+Raspberry+Pi+1+Offical+OpenWrt%22) | Offical | ![Build Raspberry Pi 1 Offical OpenWrt](https://github.com/SuLingGG/OpenWrt-Rpi/workflows/Build%20Raspberry%20Pi%201%20Offical%20OpenWrt/badge.svg) |
| [树莓派 2B](https://github.com/SuLingGG/OpenWrt-Rpi/actions?query=workflow%3A%22Build+Raspberry+Pi+2+Lean%27s+OpenWrt%22) |  Lean   | ![Build Raspberry Pi 2 Lean's OpenWrt](https://github.com/SuLingGG/OpenWrt-Rpi/workflows/Build%20Raspberry%20Pi%202%20Lean's%20OpenWrt/badge.svg) |
| [树莓派 2B](https://github.com/SuLingGG/OpenWrt-Rpi/actions?query=workflow%3A%22Build+Raspberry+Pi+2+Offical+OpenWrt%22) | Offical | ![Build Raspberry Pi 2 Offical OpenWrt](https://github.com/SuLingGG/OpenWrt-Rpi/workflows/Build%20Raspberry%20Pi%202%20Offical%20OpenWrt/badge.svg) |
| [树莓派 3B/3B+](https://github.com/SuLingGG/OpenWrt-Rpi/actions?query=workflow%3A%22Build+Raspberry+Pi+3+Lean%27s+OpenWrt%22) |  Lean   | ![Build Raspberry Pi 3 Lean's OpenWrt](https://github.com/SuLingGG/OpenWrt-Rpi/workflows/Build%20Raspberry%20Pi%203%20Lean's%20OpenWrt/badge.svg) |
| [树莓派 3B/3B+](https://github.com/SuLingGG/OpenWrt-Rpi/actions?query=workflow%3A%22Build+Raspberry+Pi+3+Offical+OpenWrt%22) | Offical | ![Build Raspberry Pi 3 Offical OpenWrt](https://github.com/SuLingGG/OpenWrt-Rpi/workflows/Build%20Raspberry%20Pi%203%20Offical%20OpenWrt/badge.svg) |
| [树莓派 4B](https://github.com/SuLingGG/OpenWrt-Rpi/actions?query=workflow%3A%22Build+Raspberry+Pi+4+Lean%27s+OpenWrt%22) |  Lean   | ![Build Raspberry Pi 4 Lean's OpenWrt](https://github.com/SuLingGG/OpenWrt-Rpi/workflows/Build%20Raspberry%20Pi%204%20Lean's%20OpenWrt/badge.svg) |
| [树莓派 4B](https://github.com/SuLingGG/OpenWrt-Rpi/actions?query=workflow%3A%22Build+Raspberry+Pi+4+Offical+OpenWrt%22) | Offical | ![Build Raspberry Pi 4 Offical OpenWrt](https://github.com/SuLingGG/OpenWrt-Rpi/workflows/Build%20Raspberry%20Pi%204%20Offical%20OpenWrt/badge.svg) |

其中：

版本为 Lean 的为基于 [Lean 大源码](https://github.com/coolsnowwolf/lede) 编译的固件，

版本为 Offical 的为基于 [OpenWrt 官方源码](https://github.com/openwrt/openwrt/tree/master) Master 分支编译的固件。

树莓派 2B 的固件通用于树莓派 2B、3B、3B+、4B。

**请不要直接 Fork 此项目**，如果你想使用本项目编译 OpenWrt 固件，请前往：

<https://github.com/SuLingGG/Action-OpenWrt-Rpi>

在此项目的 [README.md](https://github.com/SuLingGG/Action-OpenWrt-Rpi/blob/master/README.md) 中有详细的使用教程~

## 注意事项：

1. 由于众所周知的原因，尽量使用 **科学上网** 方式下载固件，固件下载完成后，请下载 `sha256sums` 文件或使用压缩软件的 "测试压缩文件" 功能来验证固件的完整性；
2. 由于 Github Action 限制，需要 **登录 Github 账号** 才可下载固件 (未登录时固件链接不可被点击)；
3. 若因网络原因固件难以下载时，也可下载文件列表中 `Tmp-Link-Url.txt`，解压打开  `Tmp-Link-Url.txt` 后即可得到固件在 <https://tmp.link/> 中的下载链接，前往下载即可；
4. 文件下载时默认被 zip 压缩，若有需要，请解压 zip 得到固件后再刷入；
5. 固件下载页面标注固件大小为解压 zip 文件后大小，并非文件下载真实大小；
6. 固件在每天凌晨 02:00 拉取 Lean 大源码自动编译，默认情况下每日编译一次 (config 文件更新时除外)，未逐一经过实机测试，故 **不保证 100% 可靠性**。
7. 固件 (功能性) 更新内容可前往 Telegram 频道: [Beautiful Apps Channel](https://t.me/beautifulapps) 查看。

## 鸣谢：

Lean's OpenWrt source:

<https://github.com/coolsnowwolf/lede>

P3TERX/Actions-OpenWrt:

<https://github.com/P3TERX/Actions-OpenWrt>

CTCGFW's Team:

<https://github.com/project-openwrt>