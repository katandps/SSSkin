local quote_cmd = require("utils/load_font_utils/quote_cmd")
local ps_quote = require("utils/load_font_utils/ps_quote")
local exec = require("utils/load_font_utils/exec")
local is_windows = require("utils/load_font_utils/is_windows")
local log = require("utils/log")

return function(url, out_path)
    local user_agent =
    "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36"
    log("[download_file] called: url=" .. tostring(url) .. ", out_path=" .. tostring(out_path))
    -- Windowsでもcurlを優先
    local curl_cmd = "curl -L -A " .. quote_cmd(user_agent) .. " -o " .. quote_cmd(out_path) .. " " .. quote_cmd(url)
    log("[download_file] executing: " .. curl_cmd)
    local ok = exec(curl_cmd)
    log("[download_file] curl result: " .. tostring(ok))
    if ok then
        local f = io.open(out_path, "rb")
        if f then
            local size = f:seek("end")
            f:close()
            log("[download_file] curl file size: " .. tostring(size))
        end
        return true
    end
    -- curl失敗時のみInvoke-WebRequestを試す
    if is_windows() then
        local ps_cmd = table.concat({
            "powershell -NoProfile -Command",
            ps_quote("$ProgressPreference='SilentlyContinue';" ..
                "Invoke-WebRequest -Uri " .. ps_quote(url) ..
                " -OutFile " .. ps_quote(out_path) ..
                " -UserAgent " .. ps_quote(user_agent))
        }, " ")
        log("[download_file] executing: " .. ps_cmd)
        local ok2 = exec(ps_cmd)
        log("[download_file] powershell result: " .. tostring(ok2))
        if not ok2 then
            log("[download_file] powershell download failed")
            return false
        end
        -- 正のファイルサイズを持つファイルがダウンロードされているかを返す
        local f = io.open(out_path, "rb")
        if f then
            local size = f:seek("end")
            f:close()
            log("[download_file] powershell file size: " .. tostring(size))
            return size and size > 0
        end
    end
    log("[download_file] all download methods failed")
    return false
end
