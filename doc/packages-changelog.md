# 软件包变更日志

## 移除了 ipv6helper

请用

`opkg update && opkg install ipv6helper` 

启用 IPV6 支持。

## 移除了一些软件包:

由于各种原因，移除了一些软件包，移除的软件包均可通过 `opkg` 命令安装 (见下文)

### 移除了一些不常用的软件包

| 包名:                  |                              |                        |
| ---------------------- | ---------------------------- | ---------------------- |
| luci-app-airplay2      | luci-app-music-remote-center | luci-app-udpxy         |
| luci-app-baidupcs-web  | luci-app-mwan3               | luci-app-uugamebooster |
| luci-app-familycloud   | luci-app-mwan3helper         | luci-app-verysync      |
| luci-app-filebrowser   | luci-app-ps3netsrv           | luci-app-xlnetacc      |
| luci-app-frps          | luci-app-rclone              | luci-udptools          |
| luci-app-haproxy-tcp   | luci-app-shairplay           | luci-proto-minieap     |
| luci-app-mentohust     | luci-app-socat               | bsdtar                 |
| luci-app-minidlna      | luci-app-syncthing           | bzip2                  |
| luci-app-mjpg-streamer | luci-app-tinyproxy           | zip                    |

### 移除了部分不常用且容易产生歧义的软件包:

| 包名                     |                                                              |
| ------------------------ | ------------------------------------------------------------ |
| luci-app-v2ray-server    | 可能会与客户端插件造成混淆 (客户端请用 ShadowSocks Plus+ / Passwall / OpenClash) |
| luci-app-ssr-mudb-server |                                                              |

### 移除了部分可能与其他插件产生冲突的软件包

| 包名                        | 移除原因                                                     |
| --------------------------- | ------------------------------------------------------------ |
| luci-app-dockerman / docker | Docker 会影响 UDP 转发                                       |
| luci-app-kodexplorer        | kodexplorer 中的 Nginx 会与 OpenWrt 的默认 Web 服务器 Uhttpd 产生端口冲突，打印大量错误日志 |
| luci-app-mwan3              |                                                              |
| luci-app-mwan3helper        | 默认配置下 多线多拨/负载均衡 会与 IPV6 冲突                  |
| luci-app-syncdial           |                                                              |

### 因编译时长问题，移除了以下软件包

| 包名                         | 移除原因                                             |
| ---------------------------- | ---------------------------------------------------- |
| luci-app-jd-dailybonus       | 依赖 node 且编译时间过长，有一定可能导致固件编译超时 |
| luci-app-unblockneteasemusic | 依赖 node 且编译时间过长，有一定可能导致固件编译超时 |
| luci-app-qbittorrent         | 依赖 qt5 且编译时间过长，有一定可能导致固件编译超时  |

## 软件包安装指南

更新软件包索引:

```
opkg update
```

列出可安装的所有 LuCI APP :

```
opkg list | grep luci-app | grep -v Translation
```

安装软件包 (以 luci-app-ssr-plus 为例):

```
opkg install luci-app-ssr-plus
```

若发现此时新安装软件包界面为英文，则尝试查找该软件包的中文翻译包:

```
opkg list | grep luci-app-ssr-plus | grep zh-cn
```

此时可以得到该软件包的中文翻译包为 `luci-i18n-ssr-plus-zh-cn`，使用 `opkg install` 命令安装此翻译包即可:

```
opkg install luci-i18n-ssr-plus-zh-cn
```

可安装的 LuCI APP 列表:

https://github.com/SuLingGG/OpenWrt-Mini/blob/main/doc/LuCI-App-List.md

更多 opkg 使用方法请参考 OpenWrt Guide:

https://openwrt.org/docs/guide-user/additional-software/opkg
