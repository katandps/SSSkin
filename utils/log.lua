local M = {}

--- ログ出力関数
--- beatoraja/ssskin_log.txt に出力される
M.log = function(msg)
    local log_path = "ssskin_log.txt"
    local f = io.open(log_path, "a")
    if f then
        f:write(os.date("[%Y-%m-%d %H:%M:%S] ") .. tostring(msg) .. "\n")
        f:close()
    end
end

return M
