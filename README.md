# [OpenWrt-Rpi](https://github.com/SuLingGG/OpenWrt-Rpi)

## 项目介绍

1. 提供适配于 树莓派全系、Rockchip 平台、ipq40xx 平台以及 x86 平台设备的 OpenWrt 固件
2. 包含丰富的 OpenWrt 原版 LuCI 插件及社区 LuCI 插件
3. 固件跟随源码更新自动编译，确保获得最新体验
4. 预配置本地 kmod 软件源，远离 kmod 依赖冲突
5. 集成绝大多数有线、无线、3G / 4G 网卡驱动，无需额外安装
6. 预置最新版 Clash 核心、预置 oh-my-zsh，最大程度减少配置成本
7. 提供全格式固件 / 文件 (ext4/squashfs/ubi/initramfs/rootfs)
8. 对于高级用户，提供完整的固件/软件包构建工具 (imagebuilder / sdk / toolchain)
9. 如果你想捐助此项目，请移步 [FUNDING.md](https://github.com/SuLingGG/OpenWrt-Mini/blob/main/FUNDING.md)

## 文档

固件 下载安装 / 初始设置 / 软件包安装说明 等信息请看文档:

<https://doc.openwrt.cc/2-OpenWrt-Rpi>

## 固件预览

### 主界面:

![主界面](https://ae05.alicdn.com/kf/H6814822fa93d4246837bea1edcec6d23j.png)

### 内置功能:

(建议保存至本地放大查看)

![内置功能](https://ae02.alicdn.com/kf/Hf29f2d94339d4188bbdde7f3131b500af.png)

## 鸣谢

感谢以下项目 / 厂商:

| Github Actions                                        | OpenWrt 源码项目                                             | OpenWrt 构建项目                                             | Action 项目                                                  | 云服务厂商                               |
| ----------------------------------------------------- | ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ | ---------------------------------------- |
| [Github Actions](https://github.com/features/actions) | [openwrt/openwrt](https://github.com/openwrt/openwrt/)       | [openwrt/buildbot](https://git.openwrt.org/?p=buildbot.git;a=summary) | [ncipollo/release-action](https://github.com/ncipollo/release-action) | [Acloud](https://acloud.net/)            |
|                                                       | [coolsnowwolf/lede](https://github.com/coolsnowwolf/lede)    | [P3TERX/Actions-OpenWrt](https://github.com/P3TERX/Actions-OpenWrt) | [mknejp/delete-release-assets](https://github.com/mknejp/delete-release-assets) | [Cloudflare](https://www.cloudflare.com) |
|                                                       | [immortalwrt/immortalwrt](https://github.com/immortalwrt/immortalwrt) | [immortalwrt/opde](https://github.com/immortalwrt/opde)      | [GitRML/delete-workflow-runs](https://github.com/GitRML/delete-workflow-runs) | [BackBlaze](https://www.backblaze.com/)  |
|                                                       |                                                              | [aparcar/openwrt](https://github.com/aparcar/openwrt)        | [easingthemes/ssh-deploy](https://github.com/easingthemes/ssh-deploy) | [HostHatch](https://hosthatch.com/)      |
|                                                       |                                                              | [klever1988/nanopi-openwrt](https://github.com/klever1988/nanopi-openwrt) | [easimon/maximize-build-space](https://github.com/easimon/maximize-build-space) |                                          |

