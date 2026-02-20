local is_windows = require("utils/is_windows")

-- beatoraja本体の絶対パスを取得する
return function()
    if is_windows() then
        local cmd = "powershell -NoProfile -Command Get-Location | Select-Object -ExpandProperty Path"
        local pipe = io.popen(cmd)
        if not pipe then return nil end
        local result = pipe:read("*a")
        pipe:close()
        result = result and result:gsub("\r?\n", "") or nil
        return result ~= "" and result or nil
    else
        local cmd = "pwd"
        local pipe = io.popen(cmd)
        if not pipe then return nil end
        local result = pipe:read("*a")
        pipe:close()
        result = result and result:gsub("\r?\n", "") or nil
        return result ~= "" and result or nil
    end
end
