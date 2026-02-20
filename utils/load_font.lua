local M = {}

local is_windows = require("utils/is_windows")
local make_directory = require("utils/make_directory")

local function strip_query(url)
    return (url:gsub("%?.*$", ""))
end

local function filename_from_url(url)
    local clean = strip_query(url)
    return clean:match("/([^/]+)$") or "font"
end

local download_file = require("utils/download_file")

local log = require("utils/log")

-- 引数なしで実行パス（カレントディレクトリ）の絶対パスを取得
local beatoraja_path = require("utils/beatoraja_path")

local copy_file = require("utils/copy_file")

--- Download true type font file to download/fonts as filename
---
--- url: Direct URL to a .ttf
--- filename: output filename
function M.download_google_font(url, filename)
    log("[load_font] download_google_font called: url=" .. tostring(url) .. ", filename=" .. tostring(filename))

    if type(url) ~= "string" or url == "" then
        log("[load_font] url is required")
        return false, "url is required"
    end

    -- スキン実行ディレクトリ配下のdownload/fontsを常に使う
    local sep = is_windows() and "\\" or "/"
    local download_dir = beatoraja_path() .. sep .. "skin" .. sep .. "SSSkin" .. sep .. "download" .. sep .. "fonts"
    log("[load_font] make_directory: " .. download_dir)
    make_directory(download_dir)

    local name = filename or filename_from_url(url)
    log("[load_font] filename resolved: " .. name)

    local tmp_base = os.tmpname()
    log("[load_font] download_file: url=" .. url .. ", tmp_path=" .. tmp_base)
    if not download_file(url, tmp_base) then
        log("[load_font] download failed: " .. url)
        return false, "download failed: " .. url
    end

    local out_path = download_dir .. sep .. name
    -- touchファイルを作成
    local touch_path = download_dir .. sep .. ".touch_font_write"
    log("[load_font] touching file: " .. touch_path)
    local f = io.open(touch_path, "w")
    if f then f:close() end
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
