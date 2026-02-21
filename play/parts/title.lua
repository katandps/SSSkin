--- 曲のテキスト情報表示

local STRINGS = require("play/consts").STRINGS

local table_h = 20
local title_h = 26
local artist_h = 20

local skin = { font = {}, text = {}, destination = {} }

local load_font = require("utils/load_font")
local font_name = "NOTONOTO_HS_v0.0.3_Medium"
load_font.download_google_font(
    "https://github.com/yuru7/NOTONOTO/releases/download/v0.0.3/NOTONOTO_HS_v0.0.3.zip",
    font_name .. ".ttf",
    "NOTONOTO_HS_v0.0.3/NOTONOTOConsole_HS/NOTONOTOConsoleHS-Medium.ttf"
)

table.insert(skin.font, { id = font_name, path = "download/fonts/" .. font_name .. ".ttf" })

-- 難易度表
table.insert(skin.text, {
    id = "info_difficulty",
    font = font_name,
    size = table_h,
    align = 0, -- 左揃え
    overflow = 1,
    ref = STRINGS.STRING_TABLE_FULL
})
table.insert(skin.destination, {
    id = "info_difficulty",
    dst = {
        { x = 60, y = 128, w = 1040, h = table_h },
    }
})

-- フルタイトル
table.insert(skin.text, {
    id = "info_title",
    font = font_name,
    size = title_h,
    align = 0, -- 左揃え
    overflow = 1,
    ref = STRINGS.STRING_FULLTITLE
})
table.insert(skin.destination, {
    id = "info_title",
    dst = {
        { x = 60, y = 90, w = 1040, h = title_h },
    }
})

-- アーティスト
table.insert(skin.text, {
    id = "info_artist",
    font = font_name,
    size = artist_h,
    align = 0, -- 左揃え
    overflow = 1,
    ref = STRINGS.STRING_FULLARTIST
})
table.insert(skin.destination, {
    id = "info_artist",
    dst = {
        { x = 60, y = 60, w = 1040, h = artist_h },
    }
})
return skin
