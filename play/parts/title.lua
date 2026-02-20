--- 曲のテキスト情報表示

local STRINGS = require("play/consts").STRINGS

local title_h = 28

local skin = { font = {}, text = {}, destination = {} }

local load_font = require("utils/load_font")
load_font.download_google_font(
    "https://github.com/notofonts/noto-cjk/raw/f8d157532fbfaeda587e826d4cd5b21a49186f7c/google-fonts/NotoSansJP%5Bwght%5D.ttf",
    { filename = "noto-sans-jp.ttf" })

table.insert(skin.font, { id = "noto-sans-jp-regular", path = "download/fonts/noto-sans-jp.ttf" })
-- table.insert(skin.font, { id = "genshin-gothic-heavy", path = "common/font/GenShinGothic-Heavy.ttf" })

-- 難易度表
table.insert(skin.text, {
    id = "info_difficulty",
    font = "noto-sans-jp-regular",
    size = title_h,
    align = 0, -- 左揃え
    overflow = 1,
    ref = STRINGS.STRING_TABLE_FULL
})
table.insert(skin.destination, {
    id = "info_difficulty",
    dst = {
        { x = 60, y = 144, w = 1040, h = title_h - 4 },
    }
})

-- フルタイトル
table.insert(skin.text, {
    id = "info_title",
    font = "noto-sans-jp-regular",
    size = title_h,
    align = 0, -- 左揃え
    overflow = 1,
    ref = STRINGS.STRING_FULLTITLE
})
table.insert(skin.destination, {
    id = "info_title",
    dst = {
        { x = 60, y = 100, w = 1040, h = title_h },
    }
})

-- アーティスト
table.insert(skin.text, {
    id = "info_artist",
    font = "noto-sans-jp-regular",
    size = title_h,
    align = 0, -- 左揃え
    overflow = 1,
    ref = STRINGS.STRING_FULLARTIST
})
table.insert(skin.destination, {
    id = "info_artist",
    dst = {
        { x = 60, y = 60, w = 1040, h = title_h - 4 },
    }
})
return skin
