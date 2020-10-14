export BASE_DIR := $(shell pwd)
OR_EXEC ?= $(shell which openresty)
LUAROCKS_VER ?= $(shell luarocks --version | grep -E -o  "luarocks [0-9]+.")

.PHONY: default
default:
ifeq ($(OR_EXEC), )
ifeq ("$(wildcard /usr/local/openresty-debug/bin/openresty)", "")
	@echo "ERROR: OpenResty not found. You have to install OpenResty and add the binary file to PATH"
	exit 1
endif
endif

LUAJIT_DIR ?= $(shell ${OR_EXEC} -V 2>&1 | grep prefix | grep -Eo 'prefix=(.*)/nginx\s+--' | grep -Eo '/.*/')luajit

### deps:				安装依赖
.PHONY: deps
deps: default
ifeq ($(LUAROCKS_VER),luarocks 3.)
	luarocks install --lua-dir=$(LUAJIT_DIR) rockspec/openresty-quick-start-master-0.rockspec --tree=deps --only-deps --local
else
	luarocks install rockspec/openresty-quick-start-0.rockspec --tree=deps --only-deps --local
endif


### start:				启动服务（前台进程）
start: default
	@echo "server start"
	@openresty -p `pwd` -c conf/nginx.conf -g 'daemon off;'

### start-background:			启动服务（后台进程）
start-background: default
	@echo "server start for background"
	@openresty -p `pwd` -c conf/nginx.conf

### quit:				停止服务
quit:
	@echo "server quit"
	@openresty -p `pwd` -c conf/nginx.conf -s quit

### clean:				清理项目（删除日志、临时文件和依赖库）
clean:
	@echo "clean"
	rm -rf logs/*.log logs/nginx.pid deps *temp

### help:				Makefile帮助
.PHONY: help
help:
	@echo Makefile cmd:
	@echo
	@grep -E '^### [-A-Za-z0-9_]+:' Makefile | sed 's/###/   /'