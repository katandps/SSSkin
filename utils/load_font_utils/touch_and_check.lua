local file_exists = require("utils/load_font_utils/file_exists")
local log = require("utils/log")
local separator = require("utils/load_font_utils/separator")

---
-- touch_and_check
-- 指定したパスに空ファイルをtouchし、存在を確認し、touchしたファイルを削除する 書き込み権限の確認に用いる
-- @param dir ディレクトリ
-- @return 成功でtrue, 失敗でfalse
return function(dir)
    local path = dir .. separator .. ".touch_check"
    local f = io.open(path, "w")
    if f then f:close() end
    local exists = file_exists(path)
    log("[load_font] touch_and_check result: " .. tostring(exists))
    if exists then
        os.remove(path)
    end
    return exists
end
