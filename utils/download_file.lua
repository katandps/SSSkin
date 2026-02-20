local quote_cmd = require("utils/quote_cmd")
local ps_quote = require("utils/ps_quote")
local exec = require("utils/exec")
local is_windows = require("utils/is_windows")

return function(url, out_path)
    local user_agent =
    "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36"
    -- Windowsでもcurlを優先
    local curl_cmd = "curl -L -A " .. quote_cmd(user_agent) .. " -o " .. quote_cmd(out_path) .. " " .. quote_cmd(url)
    local ok = exec(curl_cmd)
    if ok then return true end
    -- curl失敗時のみInvoke-WebRequestを試す
    if is_windows() then
        local ps_cmd = table.concat({
            "powershell -NoProfile -Command",
            ps_quote("$ProgressPreference='SilentlyContinue';" ..
                "Invoke-WebRequest -Uri " .. ps_quote(url) ..
                " -OutFile " .. ps_quote(out_path) ..
                " -UserAgent " .. ps_quote(user_agent))
        }, " ")
        return exec(ps_cmd)
    end
    return false
end
