local M = {}

local is_windows = require("utils/load_font_utils/is_windows")
local separator = require("utils/load_font_utils/separator")
local make_directory = require("utils/load_font_utils/make_directory")
local file_exists = require("utils/load_font_utils/file_exists")
local touch_and_check = require("utils/load_font_utils/touch_and_check")

local download_file = require("utils/load_font_utils/download_file")

local log = require("utils/log")

-- 引数なしで実行パス（カレントディレクトリ）の絶対パスを取得
local beatoraja_path = require("utils/load_font_utils/beatoraja_path")

local copy_file = require("utils/load_font_utils/copy_file")

local function font_download_dir()
    return beatoraja_path() ..
        separator .. "skin" .. separator .. "SSSkin" .. separator .. "download" .. separator .. "fonts"
end

--- Download true type font file to download/fonts as filename
---
--- url: Direct URL to a .ttf
--- filename: output filename
function M.download_google_font(url, filename)
    log("[load_font] do called: url=" .. tostring(url) .. ", filename=" .. tostring(filename))

    if type(url) ~= "string" or url == "" then
        log("[load_font] url is required")
        return false, "url is required"
    end

    -- スキン実行ディレクトリ配下のdownload/fontsを常に使う
    local download_dir = font_download_dir()
    log("[load_font] make_directory: " .. download_dir)
    make_directory(download_dir)

    log("[load_font] filename resolved: " .. filename)
    local out_path = download_dir .. separator .. filename
    if file_exists(out_path) then
        log("[load_font] file already exists, skipping download: " .. out_path)
        return true, "file already exists: " .. out_path
    end

    local tmp_base = os.tmpname()
    log("[load_font] download_file: url=" .. url .. ", tmp_path=" .. tmp_base)
    if not download_file(url, tmp_base) then
        log("[load_font] download failed: " .. url)
        return false, "download failed: " .. url
    end

    touch_and_check(download_dir)
    local ok = copy_file(tmp_base, out_path)
    if not ok then
        log("[load_font] failed to write font file: " .. out_path)
        return false, "failed to write font file: " .. out_path
    end
    log("[load_font] removing tmp file: " .. tmp_base)
    os.remove(tmp_base)
    log("[load_font] font file downloaded: " .. out_path)
    return true
end

return M
