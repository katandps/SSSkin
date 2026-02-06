local font = require("common/digits/nirmala_ui_bold")
local append_all = require("utils/append_all")
local FLOATS = require("play/consts").FLOATS
local NUMBERS = require("play/consts").NUMBERS
local main_state = require("main_state")

-- 1ノーツあたりの回復量(整数部分)
local function recover_per_notes()
    local total = main_state.number(FLOATS.FLOAT_CHART_TOTALGAUGE)
    local per_notes = total / main_state.number(NUMBERS.NUMBER_TOTALNOTES)
    return math.floor(per_notes)
end
-- 1ノーツあたりの回復量(小数部分上3桁)
local function recover_per_notes_ad()
    local total = main_state.number(FLOATS.FLOAT_CHART_TOTALGAUGE)
    local per_notes = total * 1000 / main_state.number(NUMBERS.NUMBER_TOTALNOTES)
    return math.floor(per_notes) % 1000
end

local function load(skin)
    font.load(skin)
    append_all(skin.value, {
        font.white({ id = "song_info_total_notes", digit = 4, ref = NUMBERS.NUMBER_TOTALNOTES }),
        font.white({ id = "song_info_total_gauge", digit = 4, ref = FLOATS.FLOAT_CHART_TOTALGAUGE }),
        font.yellow({ id = "song_info_recover_per_notes", digit = 2, value = recover_per_notes }),
        font.yellow({ id = "song_info_recover_per_notes_ad", digit = 3, value = recover_per_notes_ad }),
    })

    append_all(skin.image, {
        font.yellow_period({ id = "song_info_recover_per_notes_period", }),
        font.yellow_percent({ id = "song_info_recover_per_notes_percent", }),
    })

    append_all(skin.destination, {
        {
            id = "song_info_total_notes",
            dst = { { x = 80, y = 20, w = font.width, h = font.height, } }
        },
        {
            id = "song_info_total_gauge",
            dst = { { x = 80 + font.width * 6, y = 20, w = font.width, h = font.height, } }
        },
        {
            id = "song_info_recover_per_notes",
            dst = { { x = 80 + font.width * 12, y = 20, w = font.width, h = font.height, } }
        },
        {
            id = "song_info_recover_per_notes_period",
            dst = { { x = 80 + font.width * 14, y = 20, w = font.width, h = font.height, } }
        },
        {
            id = "song_info_recover_per_notes_ad",
            dst = { { x = 80 + font.width * 15, y = 20, w = font.width, h = font.height, } }
        },
        {
            id = "song_info_recover_per_notes_percent",
            dst = { { x = 80 + font.width * 18, y = 20, w = font.width, h = font.height, } }
        },
    })
end

return { load = load }
