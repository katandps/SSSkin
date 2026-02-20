local M = {}

local is_windows = require("utils/is_windows")

local quote_cmd = require("utils/quote_cmd")

local make_directory = require("utils/make_directory")
local exec = require("utils/exec")


local function strip_query(url)
    return (url:gsub("%?.*$", ""))
end

local function filename_from_url(url)
    local clean = strip_query(url)
    return clean:match("/([^/]+)$") or "font"
end

local function file_ext(name)
    return name:match("%.([^.]+)$")
end

local download_file = require("utils/download_file")

local extract_zip = require("utils/extract_zip")
local log = require("utils/log").log

local list_ttf_files = require("utils/list_ttf_files")

-- 引数なしで実行パス（カレントディレクトリ）の絶対パスを取得
local beatoraja_path = require("utils/beatoraja_path")

--- Download a Google Fonts asset and place it under download/fonts.
---
--- url: Direct URL to a .ttf or a .zip download.
--- opts:
---   filename: Override output filename for non-zip downloads.
---   keep_zip: If true, keep the downloaded zip file.
function M.download_google_font(url, opts)
    opts = opts or {}

    log("[load_font] download_google_font called: url=" .. tostring(url) .. ", opts=" .. (opts and "table" or "nil"))

    if type(url) ~= "string" or url == "" then
        log("[load_font] url is required")
        return false, "url is required"
    end

    -- スキン実行ディレクトリ配下のdownload/fontsを常に使う
    local sep = is_windows() and "\\" or "/"
    local download_dir = beatoraja_path() .. sep .. "skin" .. sep .. "SSSkin" .. sep .. "download" .. sep .. "fonts"
    log("[load_font] make_directory: " .. download_dir)
    make_directory(download_dir)

    local name = opts.filename or filename_from_url(url)
    log("[load_font] filename resolved: " .. name)
    local ext = file_ext(name)
    if not ext then
        log("[load_font] url does not include a filename; use opts.filename")
        return false, "url does not include a filename; use opts.filename"
    end

    local lower_ext = ext:lower()
    local is_zip = lower_ext == "zip"
    log("[load_font] file extension: " .. lower_ext .. (is_zip and " (zip)" or ""))

    if lower_ext == "css" then
        log("[load_font] url points to a CSS file; use a .zip or font file URL")
        return false, "url points to a CSS file; use a .zip or font file URL"
    end

    if not is_zip and lower_ext ~= "ttf" then
        log("[load_font] only .ttf is supported")
        return false, "only .ttf is supported"
    end

    local tmp_base = os.tmpname()
    local tmp_path = is_zip and (tmp_base .. ".zip") or tmp_base
    log("[load_font] download_file: url=" .. url .. ", tmp_path=" .. tmp_path)
    if not download_file(url, tmp_path) then
        log("[load_font] download failed: " .. url)
        return false, "download failed: " .. url
    end

    if is_zip then
        local extract_dir = os.tmpname() .. "_font"
        log("[load_font] make_directory (extract_dir): " .. extract_dir)
        make_directory(extract_dir)
        log("[load_font] extract_zip: " .. tmp_path .. " -> " .. extract_dir)
        if not extract_zip(tmp_path, extract_dir) then
            log("[load_font] zip extraction failed: " .. tmp_path)
            return false, "zip extraction failed"
        end
        log("[load_font] list_ttf_files: " .. extract_dir)
        local ttf_files = list_ttf_files(extract_dir)
        log("[load_font] ttf_files found: " .. #ttf_files)
        if #ttf_files == 0 then
            log("[load_font] no .ttf files found in zip: " .. tmp_path)
            return false, "no .ttf files found in zip"
        end
        -- opts.filename指定時、1つ目のttfファイルをその名前でコピー
        if opts.filename and ttf_files[1] then
            local custom_dest = download_dir .. sep .. opts.filename
            log("[load_font] copying first ttf to custom filename: " .. ttf_files[1] .. " -> " .. custom_dest)
            local moved = exec((is_windows() and "copy /Y " or "cp ") ..
                quote_cmd(ttf_files[1]) .. " " .. quote_cmd(custom_dest))
            if not moved then
                log("[load_font] failed to copy: " .. ttf_files[1] .. " -> " .. custom_dest)
                return false, "failed to copy custom filename"
            else
                log("[load_font] copied: " .. ttf_files[1] .. " -> " .. custom_dest)
            end
        end
        log("[load_font] move_ttf_files: copying all ttf to " .. download_dir)
        if not move_ttf_files(ttf_files, download_dir) then
            log("[load_font] failed to copy .ttf files to download/fonts")
            return false, "failed to copy .ttf files"
        end
        if not opts.keep_zip then
            log("[load_font] removing tmp zip: " .. tmp_path)
            os.remove(tmp_path)
        end
        -- cleanup extract_dir
        log("[load_font] cleaning up extract_dir: " .. extract_dir)
        if is_windows() then
            exec('rmdir /S /Q ' .. quote_cmd(extract_dir))
        else
            exec('rm -rf ' .. quote_cmd(extract_dir))
        end
        log("[load_font] zip extracted and .ttf copied, cleaned up: " .. extract_dir)
        return true
    end

    local out_path = download_dir .. sep .. name
    -- touchファイルを作成
    local touch_path = download_dir .. sep .. ".touch_font_write"
    log("[load_font] touching file: " .. touch_path)
    local f = io.open(touch_path, "w")
    if f then f:close() end
    -- コピー前のファイル存在・サイズ確認
    local function file_info(path)
        local f = io.open(path, "rb")
        if not f then return "not found" end
        local size = f:seek("end")
        f:close()
        return "exists, size=" .. tostring(size)
    end
    log("[load_font] tmp file info before copy: " .. tmp_path .. ": " .. file_info(tmp_path))
    log("[load_font] out file info before copy: " .. out_path .. ": " .. file_info(out_path))
    local ok
    if is_windows() then
        local ps_copy = 'powershell -NoProfile -Command Copy-Item ' .. quote_cmd(tmp_path) .. ' ' .. quote_cmd(out_path)
        log("[load_font] copy command: " .. ps_copy)
        ok = exec(ps_copy)
    else
        local cp_cmd = 'cp ' .. quote_cmd(tmp_path) .. ' ' .. quote_cmd(out_path)
        log("[load_font] copy command: " .. cp_cmd)
        ok = exec(cp_cmd)
    end
    log("[load_font] copy result: " .. tostring(ok))
    log("[load_font] out file info after copy: " .. out_path .. ": " .. file_info(out_path))
    if not ok then
        log("[load_font] failed to write font file: " .. out_path)
        return false, "failed to write font file: " .. out_path
    end
    log("[load_font] removing tmp file: " .. tmp_path)
    os.remove(tmp_path)
    log("[load_font] font file downloaded: " .. out_path)
    return true
end

return M
