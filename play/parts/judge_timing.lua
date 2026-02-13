-- 判定調整表示
local append_all = require("utils/append_all")
local load = require("utils/load")

local font = require("common/digits/nirmala_ui_bold")
local NUMBERS = require("play/consts").NUMBERS
local RESOURCE_IDS = require("play/consts").RESOURCE_IDS
local geometry = require("play/geometry").build()

local main_state = require("main_state")

local width = 60
local height = geometry.note_height
local range = 150
local x = geometry.judge_timing_x
local y = geometry.judge_timing_y
local panel_width = width * 2 + font.width * 3
local panel_height = range + 40
local skin = { source = {}, slider = {}, destination = {}, value = {} }

load(skin, font.skin, "judge_timing_font")
append_all(skin.source, {
    { id = "src_judge_timing", path = "play/parts/judge_timing.bmp", x = 0, y = 0, w = width, h = height },
})

local function judge_timing_to_y()
    local judge_timing = main_state.number(NUMBERS.NUMBER_JUDGETIMING)
    local lane_height = (1000 - main_state.number(NUMBERS.NUMBER_LANECOVER1)) * geometry.lane_height / 1000 -- レーンの長さpx
    local duration = main_state.number(NUMBERS.NUMBER_DURATION)                                             -- ノーツの落下時間ms
    local diff = judge_timing * lane_height / duration
    return diff / range
end

append_all(skin.slider, {
    {
        id = "judge_timing_slider",
        src = "src_judge_timing",
        w = width,
        h = height,
        angle = 2,
        range = range,
        value = judge_timing_to_y,
    }
})
append_all(skin.value, {
    font.white_integer({
        id = "judge_timing_value",
        digit = 3,
        ref = NUMBERS.NUMBER_JUDGETIMING,
    }),

})

append_all(skin.destination, {
    {
        id = -111,
        dst = { { x = x, y = y, w = panel_width + 40, h = panel_height + 40, r = 50, g = 50, b = 50, a = 128 } }
    },
    {
        id = "judge_timing_slider",
        dst = { { x = x + 20, y = y + range / 2 + 20, w = width, h = height } }
    },
    {
        id = RESOURCE_IDS.WHITE,
        dst = { { x = x + width + 20, y = y + range / 2 + 20, w = width * 2 - 20, h = height, r = 200, g = 80, b = 80, } }
    },
    {
        id = "judge_timing_value",
        dst = { { x = x + width * 2 + font.width / 2, y = y + range / 2 + 20 - font.height / 2 + height / 2, w = font.width, h = font.height } }
    },
})
return skin
