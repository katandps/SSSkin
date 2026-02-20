local exec = require("utils/load_font_utils/exec")
local is_windows = require("utils/load_font_utils/is_windows")
local quote_cmd = require("utils/load_font_utils/quote_cmd")
local log = require("utils/log")
---
-- copy_file
-- ファイルをコピーします。WindowsではPowerShellのCopy-Item、Unix系ではcpを使用。
-- @param src コピー元ファイルのパス
-- @param dst コピー先ファイルのパス
-- @return コピー成功でtrue, 失敗でfalse
return function(src, dst)
    local function file_info(path)
        local f = io.open(path, "rb")
        if not f then return "not found" end
        local size = f:seek("end")
        f:close()
        return "exists, size=" .. tostring(size)
    end
    log("[load_font] src file info before copy: " .. src .. ": " .. file_info(src))
    log("[load_font] dst file info before copy: " .. dst .. ": " .. file_info(dst))
    local ok
    if is_windows() then
        local ps_copy = 'powershell -NoProfile -Command Copy-Item ' .. quote_cmd(src) .. ' ' .. quote_cmd(dst)
        log("[load_font] copy command: " .. ps_copy)
        ok = exec(ps_copy)
    else
        local cp_cmd = 'cp ' .. quote_cmd(src) .. ' ' .. quote_cmd(dst)
        log("[load_font] copy command: " .. cp_cmd)
        ok = exec(cp_cmd)
    end
    log("[load_font] copy result: " .. tostring(ok))
    log("[load_font] dst file info after copy: " .. dst .. ": " .. file_info(dst))
    return ok
end
