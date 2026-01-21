local ref = require("play/consts").refs

local title_h = 28
local function load(skin)
    -- 難易度表
    table.insert(skin.text, {
        id = "info_difficulty",
        font = "vl-gothic-regular",
        size = title_h,
        align = 0, -- 左揃え
        overflow = 1,
        ref = ref.STRING_TABLE_FULL
    })
    table.insert(skin.destination, {
        id = "info_difficulty",
        dst = {
            { x = 80, y = 164, w = 1040, h = title_h - 4 },
        }
    })

    -- フルタイトル
    table.insert(skin.text, {
        id = "info_title",
        font = "vl-gothic-regular",
        size = title_h,
        align = 0, -- 左揃え
        overflow = 1,
        ref = ref.STRING_FULLTITLE
    })
    table.insert(skin.destination, {
        id = "info_title",
        dst = {
            { x = 80, y = 120, w = 1040, h = title_h },
        }
    })

    -- アーティスト
    table.insert(skin.text, {
        id = "info_artist",
        font = "vl-gothic-regular",
        size = title_h,
        align = 0, -- 左揃え
        overflow = 1,
        ref = ref.STRING_FULLARTIST
    })
    table.insert(skin.destination, {
        id = "info_artist",
        dst = {
            { x = 80, y = 80, w = 1040, h = title_h - 4 },
        }
    })
end
return { load = load }
