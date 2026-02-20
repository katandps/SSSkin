local exec = require("utils/exec")
local is_windows = require("utils/is_windows")
local quote_cmd = require("utils/quote_cmd")

---
-- make_directory
-- 指定したパスのディレクトリを再帰的に作成します。
-- @param path 作成するディレクトリのパス
-- @return なし
return function(path)
    if is_windows() then
        exec('if not exist ' .. quote_cmd(path) .. ' mkdir ' .. quote_cmd(path))
    else
        exec('mkdir -p ' .. quote_cmd(path))
    end
end
