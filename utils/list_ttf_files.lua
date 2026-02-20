local is_windows = require("utils/is_windows")
local quote_cmd = require("utils/quote_cmd")
local ps_quote = require("utils/ps_quote")

return function(dir_path)
    if is_windows() then
        local cmd = table.concat({
            "powershell -NoProfile -Command",
            ps_quote("Get-ChildItem -LiteralPath " .. ps_quote(dir_path) ..
                " -Recurse -File -Filter *.ttf | ForEach-Object { $_.FullName }")
        }, " ")
        local pipe = io.popen(cmd)
        if not pipe then
            return {}
        end
        local content = pipe:read("*a") or ""
        pipe:close()
        local files = {}
        for line in content:gmatch("[^\r\n]+") do
            table.insert(files, line)
        end
        return files
    end

    local cmd = "find " .. quote_cmd(dir_path) .. " -type f -name '*.ttf'"
    local pipe = io.popen(cmd)
    if not pipe then
        return {}
    end
    local content = pipe:read("*a") or ""
    pipe:close()
    local files = {}
    for line in content:gmatch("[^\r\n]+") do
        table.insert(files, line)
    end
    return files
end
