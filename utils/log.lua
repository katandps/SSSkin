--- ログ出力関数
--- beatoraja/ssskin.log に出力される
return function(msg)
    local log_path = "ssskin.log"
    local f = io.open(log_path, "a")
    if f then
        f:write(os.date("[%Y-%m-%d %H:%M:%S] ") .. tostring(msg) .. "\n")
        f:close()
    end
end
