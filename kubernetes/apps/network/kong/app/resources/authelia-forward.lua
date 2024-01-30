-- authelia-forward.lua

local http = require "resty.http"

local authelia_url = "http://authelia.security.svc.cluster.local:8080/api/verify"

-- Function to forward the request to Authelia and process the response
local function forward_to_authelia()
    local httpc = http.new()

    local res, err = httpc:request_uri(authelia_url, {
        method = ngx.var.request_method,
        headers = ngx.req.get_headers(),
        query = ngx.var.args,
    })

    if not res then
        ngx.log(ngx.ERR, "Failed to request Authelia: ", err)
        ngx.exit(ngx.HTTP_INTERNAL_SERVER_ERROR)
    end

    if res.status == 401 then
        -- Redirect to Authelia login page
        local redirect_url = "https://auth.janpuc.com?rm=" .. ngx.var.request_method
        ngx.redirect(redirect_url, ngx.HTTP_MOVED_TEMPORARILY)
    elseif res.status ~= 200 then
        ngx.log(ngx.ERR, "Authelia authentication failed with status: ", res.status)
        ngx.exit(ngx.HTTP_UNAUTHORIZED)
    end

    -- Set custom headers based on Authelia response
    ngx.req.set_header("Remote-User", res.headers["Remote-User"])
    ngx.req.set_header("Remote-Name", res.headers["Remote-Name"])
    ngx.req.set_header("Remote-Email", res.headers["Remote-Email"])
    ngx.req.set_header("Remote-Groups", res.headers["Remote-Groups"])
end

-- Execute the forward_to_authelia function for the access phase
forward_to_authelia()
