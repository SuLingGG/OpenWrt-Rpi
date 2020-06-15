# [OpenWrt-Rpi](https://github.com/SuLingGG/OpenWrt-Rpi)

请 **认真阅读完毕** 本说明，本说明包含如何提升固件下载体验的内容。

如果您未阅读完本说明，在遇到固件下载速度慢/下载失败等问题时，请返回此页面，认真完整阅读一次本说明~

由于篇幅限制，本 README.md 仅列出部分固件使用说明，如果你想了解本固件的更多内容，请前往博客文章:

「自编译 OpenWrt 固件，支持全系树莓派 / 竞斗云 / x86_64 设备」

<https://mlapp.cn/369.html>

查看固件详细信息和说明~

**另外:**

**如果你不认同「一个中国」原则，那么我不欢迎你使用我编译的固件，**

**并且因此我也不会对你在任何平台发送的回复或 Issues 提供支持。**

## 支持设备与编译状态：

点击下表中蓝色 “√” 即可跳转到该设备固件下载页面。

| 支持设备/版本(内核) |                          Lean (4.x)                          |                        Offical (5.4)                         |                        Project (5.4)                         |
| :-----------------: | :----------------------------------------------------------: | :----------------------------------------------------------: | :----------------------------------------------------------: |
|      树莓派 1B      | [√](https://github.com/SuLingGG/OpenWrt-Rpi/actions?query=workflow%3A%22Build+Raspberry+Pi+1+Lean%27s+OpenWrt%22) | [√](https://github.com/SuLingGG/OpenWrt-Rpi/actions?query=workflow%3A%22Build+Raspberry+Pi+1+Offical+OpenWrt%22) | [√](https://github.com/SuLingGG/OpenWrt-Rpi/actions?query=workflow%3A%22Build+Raspberry+Pi+1+Project+OpenWrt%22) |
|      树莓派 2B      | [√](https://github.com/SuLingGG/OpenWrt-Rpi/actions?query=workflow%3A%22Build+Raspberry+Pi+2+Lean%27s+OpenWrt%22) | [√](https://github.com/SuLingGG/OpenWrt-Rpi/actions?query=workflow%3A%22Build+Raspberry+Pi+2+Offical+OpenWrt%22) | [√](https://github.com/SuLingGG/OpenWrt-Rpi/actions?query=workflow%3A%22Build+Raspberry+Pi+2+Project+OpenWrt%22) |
|    树莓派 3B/3B+    | [√](https://github.com/SuLingGG/OpenWrt-Rpi/actions?query=workflow%3A%22Build+Raspberry+Pi+3+Lean%27s+OpenWrt%22) | [√](https://github.com/SuLingGG/OpenWrt-Rpi/actions?query=workflow%3A%22Build+Raspberry+Pi+3+Offical+OpenWrt%22) | [√](https://github.com/SuLingGG/OpenWrt-Rpi/actions?query=workflow%3A%22Build+Raspberry+Pi+3+Project+OpenWrt%22) |
|      树莓派 4B      | [√](https://github.com/SuLingGG/OpenWrt-Rpi/actions?query=workflow%3A%22Build+Raspberry+Pi+4+Lean%27s+OpenWrt%22) | [√](https://github.com/SuLingGG/OpenWrt-Rpi/actions?query=workflow%3A%22Build+Raspberry+Pi+4+Offical+OpenWrt%22) | [√](https://github.com/SuLingGG/OpenWrt-Rpi/actions?query=workflow%3A%22Build+Raspberry+Pi+4+Project+OpenWrt%22) |
|       竞斗云        | [√](https://github.com/SuLingGG/OpenWrt-Rpi/actions?query=workflow%3A%22Build+G-Dock+Lean%27s+OpenWrt%22) |                              -                               | [√](https://github.com/SuLingGG/OpenWrt-Rpi/actions?query=workflow%3A%22Build+G-Dock+Project+OpenWrt%22) |
|       x86_64        | [√](https://github.com/SuLingGG/OpenWrt-Rpi/actions?query=workflow%3A%22Build+x86_64+Lean%27s+OpenWrt%22) |                              -                               | [√](https://github.com/SuLingGG/OpenWrt-Rpi/actions?query=workflow%3A%22Build+x86_64+Project+OpenWrt%22) |

其中：

版本为 Lean 为基于 [Lean 大源码](https://github.com/coolsnowwolf/lede) 编译的固件 (Luci 采用 Lean 版 Luci 18.06 )；

版本为 Offical 为基于 [OpenWrt 官方源码](https://github.com/openwrt/openwrt/tree/master) Master 分支编译的固件 (Luci 采用官方版 Luci 19.07)；

版本为 Project 为基于 [Project-OpenWrt 源码](https://github.com/project-openwrt/openwrt/tree/18.06-kernel5.4) 18.06-kernel5.4 分支编译的固件，目前在仍处于测试阶段 (Luci 采用 Lean 版 Luci 18.06 )。

树莓派 2B 的固件通用于树莓派 2B、3B、3B+、4B，但板载无线功能可能不可用。

**请不要直接 Fork 此项目**，如果你想使用本项目编译 OpenWrt 固件，请前往：

<https://github.com/SuLingGG/Action-OpenWrt-Plus>

## 注意事项：

1. 点击上表中蓝色 “√” 即可跳转到该设备固件下载页面。
2. 在固件编译完成后，会上传一份副本到 WeTransfer 和 奶牛快传，对于国内网络用户，为提高下载体验，可下载存放于这两个网站中的固件副本，副本下载地址位于固件下载页面中固件文件列表下的 Annotations 提示框内 (还是找不到？[点击这里](https://shop.io.mi-img.com/app/shop/img?id=shop_984341b0a0aa6f0bad6bf272a9fe4ce2.png)~) 。在极少数情况下，因网络原因这两份副本可能会上传失败，如果遇到这种情况，就只能下载存放在 Github Action 里的固件了:
3. 由于 Github Action 限制，需要登录 Github 账号才可下载存放于 Github Action 中的固件 (未登录时固件链接不可被点击)，但 WeTransfer 和 奶牛快传 的固件下载链接在未登录状态下可正常查看，不受影响；
4. 如果需要下载存放于 Github Action 上的固件，由于众所周知的原因，请尽量使用科学上网方式下载固件，固件下载完成后，请下载 sha256sums 文件或使用压缩软件的 "测试压缩文件" 功能来验证固件的完整性；
5. 文件下载时默认被 zip 压缩，若有需要，请解压 zip 得到固件后再刷入；
6. 固件下载页面标注固件大小为解压 zip 文件后的大小，并非文件下载真实大小。例如，某文件在 Github Action 上标明的文件大小为 1.01G，但在下载过程中可能只会下载不到 300M 的一个 zip 压缩文件，解压后得到的文件大小才为标注的 1.01G；
7. 固件在每天凌晨 02:00 拉取 OpenWrt 源码和第三方软件包项目自动编译，默认情况下固件每日编译一次 (config 文件更新时除外)，未逐一经过实机测试，故 **不保证 100% 可靠性**；
8. 固件 (功能性) 更新内容可前往 Telegram 频道: [Beautiful Apps Channel](https://t.me/beautifulapps) 查看。
9. 其他联系方式: QQ 群: [397251040](https://jq.qq.com/?_wv=1027&k=5RkQisS) | Telegram群组: https://t.me/joinchat/Fc-MpxcaH3mEPA4yOMtJPQ

## 各版固件区别:

### 树莓派 1~4:

树莓派所有版本固件均未添加 IPV6 支持；

树莓派所有版本固件内均已集成所有 kmod ipk 软件包 (kmod ipk 软件包路径: /www/snapshots)，opkg 软件源也做好了相应设置，无需进行任何额外设置即可使用 opkg 从本地直接获取 kmod 包，从此和 kmod 不兼容情况说拜拜~

本项目中的所有树莓派固件均已集成 USB 有线网卡驱动和 3G/4G USB 网卡驱动。因 USB 无线网卡驱动各版本支持情况不同，故集成情况也不同；

Lean 版固件使用 Lean 大源码编译，**运行稳定**，但对于树莓派 1~4 来说，USB 无线网卡驱动支持较差，故固件内未集成除板载无线网卡之外的其他驱动，如确实需要无线网卡驱动，需要自行使用 opkg 安装相应驱动，**如果你仅用作旁路由使用，建议使用此版；**

Offical 版固件使用官方 Snapshot 源码 + 官方 LuCI 19.07 源码编译，源码处于 **高度活跃开发状态**，固件有时可能会因源码问题编译失败，无线网卡驱动支持性较好，固件内已内置大部分 USB 无线网卡驱动，无需另外安装，在 Offical 版固件的基础上，添加了大多数 Lean 版源码中的插件，但插件数量少于 Lean 版 (未集成进 Offical 固件的 Lean 版插件即为不支持)，对官方源的兼容性较好，**如果你有无线网卡需求，并有从软件源中安装软件包的需求，可以考虑使用此版；**

Project 版固件使用 Project-OpenWrt 源码 18.06-kernel5.4 分支编译，源码现处于 **测试阶段**，**稳定性介于以上两者之间**。LuCI 使用 Lean 版 LuCI 源码编译，LuCI 体验与 Lean 版固件无异。无线网卡驱动支持性较好，固件内已内置大部分 USB 无线网卡驱动，无需另外安装，插件齐全 (与 Lean 版源码相同)，**如果你有无线网卡需求，并且习惯使用 LuCI 18.06，可以考虑使用此版；**

### 竞斗云:

竞斗云固件默认支持 IPV6；

由于 ROM 大小限制，竞斗云固件内未集成 kmod ipk 软件包，未集成 USB 有线/无线网卡及 3G/4G USB 网卡驱动，若需要相关驱动请使用与固件一同提供的 package-server 安装；

竞斗云固件插件内置情况与树莓派基本相同，但未内置 Docker 及其相关组件 (ROM 大小以及设备性能限制)；

Project 版固件与 Lean 版固件 **不支持** 在 LuCI 中跨版本 (指 Project 版与 Lean 版) 通刷，**如果有跨版本需求，需要在 OpBoot 中刷入 ubi 固件**。

### x86_64:

x86_64 固件未添加 IPV6 支持；

x86_64 所有版本固件内均已集成所有 kmod ipk 软件包 (kmod ipk 软件包路径: /www/snapshots)，opkg 软件源也做好了相应设置，无需进行任何额外设置即可使用 opkg 从本地直接获取 kmod 包。

x86_64 固件插件内置情况与树莓派基本相同，固件内置大多数网络驱动、摄像头驱动、大多数 USB 有线/无线网卡驱动、3G/4G USB 网卡驱动；

x86_64 固件同时提供 Legacy 启动与 UEFI 启动版本，另外额外提供 VirtualBox、VmWare、KVM 磁盘映像，导入相应虚拟机中即可使用，无需另外安装。

### 第三方软件包集成情况:

另外，本项目固件均集成了众多优秀的第三方软件包项目，固件内软件包集成情况可以下载与固件一同提供的 manifest 文件查看，因篇幅所限，这里不再赘述。

## 文件说明:

除提供已编译好的固件外，本项目还提供以下文件:

1. 完整性校验文件: sha256sums
2. OpenWrt 编译配置: config.seed/config.buildinfo
3. 固件内已集成的软件包列表: openwrt-$target-$subtarget-$devices.manifest
5. 适用于 Windows / 集成 web 服务器的 ipk 软件包归档 (便于搭建局域网软件包服务器): packages-server.zip

在 WeTransfer 和 奶牛快传 链接中，还提供以下文件:

1. OpenWrt Image Builder
2. OpenWrt SDK
3. OpenWrt Tool Chain

以上文件可按需下载。

## 鸣谢：

P3TERX/Actions-OpenWrt (本项目基于此项目):

<https://github.com/P3TERX/Actions-OpenWrt>

OpenWrt Source Repository:

<https://github.com/openwrt/openwrt/>

Lean's OpenWrt source:

<https://github.com/coolsnowwolf/lede>

CTCGFW's Team:

<https://github.com/project-openwrt>
