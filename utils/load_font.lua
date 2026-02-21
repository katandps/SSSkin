local M = {}

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
--- path_to_ttf: これを指定すると、urlからダウンロードされたファイルをzipファイルとみなし、展開してpath_to_ttfで指定されたファイルを取り出す。zipファイル以外を指定した場合は失敗する。
function M.download_font(url, filename, path_to_ttf)
    log("[load_font] do called: url=" .. tostring(url) .. ", filename=" .. tostring(filename))

    if type(url) ~= "string" or url == "" then
        log("[load_font] url is required")
        return false, "url is required"
    end

    -- スキン実行ディレクトリ配下のdownload/fontsを常に使う
    local download_dir = font_download_dir()
    log("[load_font] make_directory: " .. download_dir)
    make_directory(download_dir)
    touch_and_check(download_dir)

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

    if path_to_ttf then
        log("[load_font] extracting from zip: " .. tmp_base .. ", target file in zip: " .. path_to_ttf)
        local unzip_ok = require("utils/load_font_utils/unzip")(tmp_base, path_to_ttf, out_path)
        if not unzip_ok then
            log("[load_font] failed to extract ttf from zip: " .. tmp_base)
            return false, "failed to extract ttf from zip: " .. tmp_base
        end
    else
        local ok = copy_file(tmp_base, out_path)
        if not ok then
            log("[load_font] failed to write font file: " .. out_path)
            return false, "failed to write font file: " .. out_path
        end
    end

    log("[load_font] removing tmp file: " .. tmp_base)
    os.remove(tmp_base)
    log("[load_font] font file downloaded: " .. out_path)
    return true
end

return M
