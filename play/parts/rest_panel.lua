--- ステージ残り時間・残りノーツ数表示

local font = require("common/digits/nirmala_ui_bold")
local append_all = require("utils/append_all")
local load = require("utils/load")
local NUMBERS = require("play/consts").NUMBERS
local main_state = require("main_state")
local geometry = require("play/geometry").build()
local RESOURCE_IDS = require("play/consts").RESOURCE_IDS

local panel_x = geometry.rest_panel_x
local panel_y = geometry.rest_panel_y
local panel_w = geometry.rest_panel_w
local panel_h = geometry.rest_panel_h

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

local skin = { value = {}, image = {}, destination = {} }
load(skin, font.skin, "rest_panel_font")
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
    { -- 背景
        id = RESOURCE_IDS.WHITE,
        dst = {
            { x = panel_x, y = panel_y, w = panel_w, h = panel_h, r = 50, g = 50, b = 50, a = 128 },
        }
    },
    {
        id = "rest_minutes",
        dst = { { x = panel_x + panel_w - font.width * 6, y = panel_y + 17, w = font.width, h = font.height } }
    },
    {
        id = "rest_colon",
        dst = { { x = panel_x + panel_w - font.width * 4, y = panel_y + 17, w = font.width, h = font.height } }
    },
    {
        id = "rest_seconds",
        dst = { { x = panel_x + panel_w - font.width * 3, y = panel_y + 17, w = font.width, h = font.height } }
    },
    {
        id = "rest_notes",
        dst = { { x = panel_x + panel_w - font.width * 12, y = panel_y + 50, w = font.width, h = font.height } }
    },
    {
        id = "rest_notes_percent",
        dst = { { x = panel_x + panel_w - font.width * 4 - font.percent_w, y = panel_y + 50, w = font.width, h = font.height } }
    },
    {
        id = "rest_notes_percent_percent",
        dst = { { x = panel_x + panel_w - font.width - font.percent_w, y = panel_y + 50, w = font.percent_w, h = font.height } }
    }
})
return skin
