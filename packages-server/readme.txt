    MyWebServer是一个高性能、易用、小巧、绿色的轻量级WEB服务器软件，是你快速建站及个人HTTP文件服务器的难得工具。支持HTTP/1.1、断点续传、大文件下载、正则表达式URL重写、虚拟目录、高速HTTP反向代理、HTTPS安全、gzip压缩等功能,内置ASP有限支持，可通过ISAPI接口、FastCGI接口实现执行服务器脚本（如PHP,asp,asp.net等），性能完全超越IIS等很多主流WEB服务器软件。

***特别说明:由于3.0版之后URL重写规则命令变化较大,请自行修改旧规则***

    使用说明:
　　使用FastCGI时，有两种途径:1.如果使用fastcgi_mod.dll模块,将扩展映射设置为PHP-CGI.exe路径即可;2.如果使用内置fastcgi进程管理器(支持远程访问),先配置好进程管理后,将映射设置为对应的"IP:端口号"（如：127.0.0.1:888）。
    如果使用ISAPI接口，将映射设置为指定ISAPI的DLL文件即可,不支持直接URL运行DLL文件.
　　HTTPS安全功能是需openssl库支持(http://218.63.109.198:8900/openssl.rar)，下载后将两个dll解压到服务器程序目录中即可，证书文件server.pem为证书私钥合并式pem文件，放在服务器程序目录即可。
    如果使用网页压缩功能需gzip.dll文件支持。

    注:(本服务器已内置ASP支持,支持UTF-8和ANSI编码，其它脚本需要使用请自行安装)：  PHP通过isapi和FastCGI接口均可(isapi方式建议使用PHP 5.2,因为5.3以上版不再提供ISAPI支持)；asp.net可通过第三方ISAPI模块运行(http://218.63.109.198:8900/asp.net支持.rar),也可安装mono然后通过FasctCGI接口实现。上述脚本已测试过可以运行。

　　URL重写命令（使用基于VBScript的正则表达式）：
　　ifsve  如果匹配指定的服务器变量则往下执行，否则执行下条规则之后的规则。（支持HTTP_HOST REMOTE_ADDR HTTP_REFERER　URL四个服务器变量）
    rewrite 如果匹配URL 则执行重写后面URL操作,可选命令参数: P 执行反向代理; R 执行重定向; L 当匹配此条规则时为最后一条规则(即不在执行之后的规则); D 禁止URL并返回HTTP状态码 例如:rewrite ^/test.rar /web/test.rar L  
　　sethd  修改反向代理时发送的HTTP头值 格式为 sethd=头名称:头值，头名称区分大小写。

    小技巧：通过URL重写可让WEB服务器变成一台HTTP代理服务器(代理上网)，服务端口就是代理端口，重写规则如下：  
    rewrite ^(http:.*) $1 P


    特别声明:本版本软件包中的所有DLL文件为第三方软件部件,文件来源于网络,不属于本软件的一部分,也不保证其安全性和稳定性,仅作为测试使用,不对其产生的后果负责.

    有任何建议和意见请联系 175384354@qq.com
 


