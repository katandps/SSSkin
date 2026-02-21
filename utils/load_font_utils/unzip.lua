local log = require("utils/log")
---
-- unzip
-- zipファイルから指定ファイルを展開して保存する
-- @param zip_path zipファイルのパス
-- @param target_file zip内で取り出すファイル名（パス）
-- @param out_path 展開先パス
-- @return 成功でtrue, 失敗でfalse
local is_windows = require("utils/load_font_utils/is_windows")
local quote_cmd = require("utils/load_font_utils/quote_cmd")
local separator = require("utils/load_font_utils/separator")
local log = require("utils/log")

local function ensure_zip_ext(path)
    if path:match("%.zip$") then return path end
    return path .. ".zip"
end

local function unzip(zip_path, target_file, out_path)
    log("[unzip] called: zip_path=" ..
        tostring(zip_path) .. ", target_file=" .. tostring(target_file) .. ", out_path=" .. tostring(out_path))
    local cmd
    if is_windows() then
        log("[unzip] using PowerShell Expand-Archive")
        local zip_path_with_ext = ensure_zip_ext(zip_path)
        local renamed = false
        if zip_path_with_ext ~= zip_path then
            log("[unzip] renaming file: " .. zip_path .. " -> " .. zip_path_with_ext)
            os.rename(zip_path, zip_path_with_ext)
            renamed = true
        end
        cmd = table.concat({
            'powershell -NoProfile -Command',
            'Expand-Archive -Force -LiteralPath ' ..
            quote_cmd(zip_path_with_ext) .. ' -DestinationPath ' .. quote_cmd(zip_path_with_ext .. '_extracted')
        }, ' ')
        log("[unzip] executing: " .. cmd)
        os.execute(cmd)
        local extracted_path = zip_path_with_ext .. '_extracted'
        local target = extracted_path .. separator .. target_file
        log("[unzip] extracting file: " .. target .. " -> " .. out_path)
        local f_in = io.open(target, 'rb')
        if not f_in then
            log("[unzip] failed to open extracted file: " .. target); return false
        end
        local f_out = io.open(out_path, 'wb')
        if not f_out then
            log("[unzip] failed to open output file: " .. out_path); f_in:close(); return false
        end
        local data = f_in:read('*a')
        f_out:write(data)
        f_in:close()
        f_out:close()
        log("[unzip] cleaning up: " .. extracted_path)
        -- os.execute('rmdir /S /Q ' .. quote_cmd(extracted_path))
        log("[unzip] success: " .. out_path)
        if renamed then
            log("[unzip] restoring file name: " .. zip_path_with_ext .. " -> " .. zip_path)
            os.rename(zip_path_with_ext, zip_path)
        end
        return true
    else
        log("[unzip] using unzip command")
        local tmp_dir = zip_path .. '_extracted'
        cmd = 'unzip -o ' .. quote_cmd(zip_path) .. ' ' .. quote_cmd(target_file) .. ' -d ' .. quote_cmd(tmp_dir)
        log("[unzip] executing: " .. cmd)
        os.execute(cmd)
        local target = tmp_dir .. separator .. target_file
        log("[unzip] extracting file: " .. target .. " -> " .. out_path)
        local f_in = io.open(target, 'rb')
        if not f_in then
            log("[unzip] failed to open extracted file: " .. target); return false
        end
        local f_out = io.open(out_path, 'wb')
        if not f_out then
            log("[unzip] failed to open output file: " .. out_path); f_in:close(); return false
        end
        local data = f_in:read('*a')
        f_out:write(data)
        f_in:close()
        f_out:close()
        log("[unzip] cleaning up: " .. tmp_dir)
        os.execute('rm -rf ' .. quote_cmd(tmp_dir))
        log("[unzip] success: " .. out_path)
        return true
    end
end

return unzip
