--- ステージ残り時間・残りノーツ数表示

local font = require("common/digits/nirmala_ui_bold")
local append_all = require("utils/append_all")
local load = require("utils/load")
local NUMBERS = require("play/consts").NUMBERS
local main_state = require("main_state")
local geometry = require("play/geometry").build()
local RESOURCE_IDS = require("play/consts").RESOURCE_IDS
local property = require("play/properties")
local ui_font = property.ui_font()

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

local title_font_size = 18

local skin = { value = {}, image = {}, text = {}, destination = {} }
load(skin, font.skin, "rest_panel_font")
append_all(skin.value, {
    font.white({ id = "rest_minutes", digit = 2, ref = NUMBERS.NUMBER_TIMELEFT_MINUTE }),
    font.white({ id = "rest_seconds", digit = 2, ref = NUMBERS.NUMBER_TIMELEFT_SECOND }),
    font.yellow({ id = "rest_notes", digit = 5, value = rest_notes }),
    font.green({ id = "rest_notes_percent", digit = 3, value = rest_notes_percent })
})

append_all(skin.text, {
    {
        id = "rest_time_label",
        font = ui_font.id,
        size = title_font_size,
        constantText = "REST TIME",
        align = 0,
    },
    {
        id = "rest_notes_label",
        font = ui_font.id,
        size = title_font_size,
        constantText = "REST NOTES",
        align = 0,
    }
})

append_all(skin.image, {
    font.white_colon({ id = "rest_colon", }),
    font.green_percent({ id = "rest_notes_percent_percent", }),
})

local time_y = panel_y + panel_h - 14 - font.height
local notes_y = panel_y + panel_h / 2 - 14 - font.height
    
append_all(skin.destination, {
    { -- 背景
        id = RESOURCE_IDS.WHITE,
        dst = {
            { x = panel_x, y = panel_y, w = panel_w, h = panel_h, r = 50, g = 50, b = 50, a = 128 },
        }
    },
    {
        id = "rest_time_label",
        dst = { { x = panel_x + 14, y = panel_y + panel_h - 14 - title_font_size, w = font.width * 10, h = title_font_size } }
    },
    {
        id = "rest_notes_label",
        dst = { { x = panel_x + 14, y = panel_y + panel_h / 2 - title_font_size, w = font.width * 10, h = title_font_size } }
    },
    {
        id = "rest_minutes",
        dst = { { x = panel_x + panel_w - font.width * 6, y = time_y, w = font.width, h = font.height } }
    },
    {
        id = "rest_colon",
        dst = { { x = panel_x + panel_w - font.width * 4, y = time_y, w = font.width, h = font.height } }
    },
    {
        id = "rest_seconds",
        dst = { { x = panel_x + panel_w - font.width * 3, y = time_y, w = font.width, h = font.height } }
    },
    {
        id = "rest_notes",
        dst = { { x = panel_x + panel_w - font.width * 12, y = notes_y, w = font.width, h = font.height } }
    },
    {
        id = "rest_notes_percent",
        dst = { { x = panel_x + panel_w - font.width * 4 - font.percent_w, y = notes_y, w = font.width, h = font.height } }
    },
    {
        id = "rest_notes_percent_percent",
        dst = { { x = panel_x + panel_w - font.width - font.percent_w, y = notes_y, w = font.percent_w, h = font.height } }
    }
})
return skin
