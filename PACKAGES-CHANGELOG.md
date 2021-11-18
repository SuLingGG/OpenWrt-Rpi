1.移除了 ipv6helper，请用

`opkg install ipv6-helper` 

​	启用 IPV6 支持。

2.移除了以下不常用的软件包:

> luci-app-airplay2
>
> luci-app-baidupcs-web
>
> luci-app-familycloud
>
> luci-app-filebrowser
>
> luci-app-frps
>
> luci-app-haproxy-tcp
>
> luci-app-mentohust
>
> luci-app-minidlna
>
> luci-app-mjpg-streamer
>
> luci-app-music-remote-center
>
> luci-app-mwan3
>
> luci-app-mwan3helper
>
> luci-app-ps3netsrv
>
> luci-app-rclone
>
> luci-app-shairplay
>
> luci-app-socat
>
> luci-app-syncthing
>
> luci-app-tinyproxy
>
> luci-app-udpxy
>
> luci-app-uugamebooster
>
> luci-app-verysync
>
> luci-app-xlnetacc
>
> luci-udptools
>
> luci-proto-minieap
>
> bsdtar
>
> bzip2
>
> zip
>

3.移除了部分不常用且容易产生歧义的软件包:

> luci-app-v2ray-server
>
> luci-app-ssr-mudb-server
>

4.移除了部分可能与其他插件产生冲突的软件包:

> luci-app-dockerman
>

  Docker 会影响 UDP 转发。

> luci-app-kodexplorer
>

  kodexplorer 中的 Nginx 会与 OpenWrt 的 Uhttpd 产生冲突，打印大量错误日志。

> luci-app-mwan3
>
> luci-app-mwan3helper
>
> luci-app-syncdial
>

  可能会与 IPV6 冲突。