# OpenResty 项目脚手架

OpenResty 项目模板，新项目可以 clone 下来修改

项目地址：<https://github.com/fengjx/openresty-quick-start>

相关阅读
- [OpenResty 从入门到开发一个网关服务](https://blog.fengjx.com/openresty/gateway/)
- [OpenResty 最佳实践](https://moonbingbing.gitbooks.io/openresty-best-practices/content/)
- [跟我学OpenResty(Nginx+Lua)开发](https://www.iteye.com/blog/jinnianshilongnian-2190344)

## 环境依赖

- [openresty](http://openresty.org/cn/installation.html)
- [luarocks](https://github.com/luarocks/luarocks/wiki/Download)

## make cmd

```bash
$ make help
Makefile cmd:

    deps:				安装依赖
    start:				启动服务（前台进程）
    start-background:			启动服务（后台进程）
    quit:				停止服务
    clean:				清理项目（删除日志、临时文件和依赖库）
    help:				Makefile帮助
```

## 快速开始

```bash
# 下载项目模板
$ git clone https://github.com/fengjx/openresty-quick-start.git

# 修改项目名
$ mv openresty-quick-start my-project

$ cd my-project

# 删除 git 文件
$ rm -rf .git

# 安装依赖
$ make deps

# 启动服务
$ make start-background
server start for background

# 访问测试
$ curl -i http://localhost:1024
HTTP/1.1 200 OK
Date: Wed, 14 Oct 2020 13:14:59 GMT
Content-Type: application/json
Transfer-Encoding: chunked
Connection: keep-alive
Server: OpenResty

ok

# 停止服务
$ make quit
server quit
```

## 目录结构

```
├── Makefile        - makefile 脚本
├── README.md       - 说明文档
├── conf            - nginx 配置
│   ├── common      - 公共配置
│   └── servers     - server 配置
├── logs            - 日志目录
├── rockspec        - 依赖管理
└── src             - lua 源码目录
    ├── app.lua
    └── core
```
