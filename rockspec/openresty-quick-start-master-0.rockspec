package = "openresty-quick-start"
version = "master-0"
supported_platforms = {"linux", "macosx"}

source = {
    url = "git@github.com:fengjx/openresty-quick-start.git",
    branch = "v1.0",
}

description = {
    summary = "openresty quick start",
    homepage = "https://github.com/fengjx/openresty-quick-start",
    license = "Apache License 2.0",
}

dependencies = {
    "lua-resty-ngxvar = 0.5"
}

build = {
    type = "make",
    build_variables = {
    },
    install_variables = {
    },
}
