---
-- file_exists
-- 指定したパスのファイルが存在するか確認します。
-- @param path ファイルパス
-- @return 存在すればtrue, なければfalse
return function(path)
    local f = io.open(path, "rb")
    if f then
        f:close(); return true
    end
    return false
end
