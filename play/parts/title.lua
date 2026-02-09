--- 曲のテキスト情報表示

local STRINGS = require("play/consts").STRINGS

local title_h = 28

local skin = { text = {}, destination = {} }

-- 難易度表
table.insert(skin.text, {
    id = "info_difficulty",
    font = "genshin-gothic-heavy",
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
    font = "genshin-gothic-heavy",
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
    font = "genshin-gothic-heavy",
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
