--
-- Licensed to the Apache Software Foundation (ASF) under one or more
-- contributor license agreements.  See the NOTICE file distributed with
-- this work for additional information regarding copyright ownership.
-- The ASF licenses this file to You under the Apache License, Version 2.0
-- (the "License"); you may not use this file except in compliance with
-- the License.  You may obtain a copy of the License at
--
--     http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.
--
local ngx = ngx
local log = require("core.log")
local ngx_balancer = require("ngx.balancer")
local resp = require("core.response")

local _M = {}

function _M.http_init()
    log.info("init")
end

function _M.http_init_worker()
    log.info("init worker")
end

function _M.http_rewrite()
    log.info("init rewrite")
end

function _M.http_access()
    log.info("init rewrite")
end

function _M.http_content()
    log.info("init content")
    resp.exit(ngx.HTTP_OK, "ok")
end

function _M.http_balancer()
    log.info("init balancer")
    ngx_balancer.set_current_peer("127.0.0.1", 8080)
end

function _M.http_header_filter()
    log.info("init header filter")
end

function _M.http_body_filter()
    log.info("init body filter")
end

function _M.http_log()
    log.info("init log")
end

return _M
