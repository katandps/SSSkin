local exec = require("utils/exec")
local is_windows = require("utils/is_windows")
local quote_cmd = require("utils/quote_cmd")
local ps_quote = require("utils/ps_quote")

return function(zip_path, dest_dir)
    if is_windows() then
        local cmd = table.concat({
            "powershell -NoProfile -Command",
            ps_quote("Expand-Archive -Force -LiteralPath " .. ps_quote(zip_path) ..
                " -DestinationPath " .. ps_quote(dest_dir))
        }, " ")
        return exec(cmd)
    end
    local cmd = "unzip -o " .. quote_cmd(zip_path) .. " -d " .. quote_cmd(dest_dir)
    return exec(cmd)
end
