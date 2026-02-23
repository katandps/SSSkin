--- 曲のテキスト情報表示

local STRINGS = require("play/consts").STRINGS
local property = require("play/properties")
local load = require("utils/load")

local table_h = 20
local title_h = 26
local artist_h = 20

local skin = { font = {}, text = {}, destination = {} }

local font = property.ui_font()
load(skin, font.skin)

-- 難易度表
table.insert(skin.text, {
    id = "info_difficulty",
    font = font.id,
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
    font = font.id,
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
    font = font.id,
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
