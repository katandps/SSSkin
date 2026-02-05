local font = require("common/digits/nirmala_ui_bold")
local append_all = require("utils/append_all")
local NUMBERS = require("play/consts").NUMBERS
local main_state = require("main_state")

local rest_x = 300
local rest_y = 300

local function rest_notes()
    local total = main_state.number(NUMBERS.NUMBER_TOTALNOTES2)
    local perfect = main_state.number(NUMBERS.NUMBER_PERFECT)
    local great = main_state.number(NUMBERS.NUMBER_GREAT)
    local good = main_state.number(NUMBERS.NUMBER_GOOD)
    local bad = main_state.number(NUMBERS.NUMBER_BAD)
    local poor = main_state.number(NUMBERS.NUMBER_POOR)
    return total - (perfect + great + good + bad + poor)
end

local function rest_notes_percent()
    local total = main_state.number(NUMBERS.NUMBER_TOTALNOTES2)
    if total == 0 then
        return 0
    end
    local rest = rest_notes()
    return math.floor(rest / total * 100 + 0.5)
end

local function load(skin)
    font.load(skin)
    append_all(skin.value, {
        font.white({ id = "rest_minutes", digit = 2, ref = NUMBERS.NUMBER_TIMELEFT_MINUTE }),
        font.white({ id = "rest_seconds", digit = 2, ref = NUMBERS.NUMBER_TIMELEFT_SECOND }),
        font.yellow({ id = "rest_notes", digit = 5, value = rest_notes }),
        font.green({ id = "rest_notes_percent", digit = 3, value = rest_notes_percent })
    })

    append_all(skin.image, {
        font.white_colon({ id = "rest_colon", }),
        font.green_percent({ id = "rest_notes_percent_percent", }),
    })
    append_all(skin.destination, {
        {
            id = "rest_minutes",
            dst = { { x = rest_x, y = rest_y, w = font.width, h = font.height } }
        },
        {
            id = "rest_colon",
            dst = { { x = rest_x + font.width * 2, y = rest_y, w = font.width, h = font.height } }
        },
        {
            id = "rest_seconds",
            dst = { { x = rest_x + font.width * 2 + 14, y = rest_y, w = font.width, h = font.height } }
        },
        {
            id = "rest_notes",
            dst = { { x = rest_x, y = rest_y + font.height, w = font.width, h = font.height } }
        },
        {
            id = "rest_notes_percent",
            dst = { { x = rest_x + font.width * 6, y = rest_y + font.height, w = font.width, h = font.height } }
        },
        {
            id = "rest_notes_percent_percent",
            dst = { { x = rest_x + font.width * 9, y = rest_y + font.height, w = font.percent_w, h = font.height } }
        }
    })
end

return { load = load }
