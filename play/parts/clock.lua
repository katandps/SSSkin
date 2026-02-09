--- 時刻表示

local append_all = require("utils/append_all")
local load = require("utils/load")

local font = require("common/digits/nirmala_ui_bold")
local NUMBERS = require("play/consts").NUMBERS
local geometry = require("play/geometry").build()

local clock_width = font.width * 21
local clock_height = font.height

local skin = { value = {}, image = {}, destination = {} }
load(skin, font.skin, "clock_font")

append_all(skin.value, {
    font.white({ id = "clock-year", digit = 4, ref = NUMBERS.NUMBER_TIME_YEAR }),
    font.white({ id = "clock-month", digit = 2, ref = NUMBERS.NUMBER_TIME_MONTH }),
    font.white({ id = "clock-day", digit = 2, ref = NUMBERS.NUMBER_TIME_DAY }),
    font.white({ id = "clock-hour", digit = 2, ref = NUMBERS.NUMBER_TIME_HOUR }),
    font.white({ id = "clock-minute", digit = 2, ref = NUMBERS.NUMBER_TIME_MINUTE }),
    font.white({ id = "clock-second", digit = 2, ref = NUMBERS.NUMBER_TIME_SECOND }),
})

append_all(skin.image, {
    font.white_slash({ id = "clock-slash" }),
    font.white_colon({ id = "clock-colon" }),
})

local x_pos = geometry.total_width - clock_width
local w = font.width
local h = font.height
append_all(skin.destination, {
    -- date
    { id = -111,           dst = { { x = x_pos, y = 0, w = clock_width, h = clock_height, a = 30 } } },
    { id = "clock-year",   dst = { { x = x_pos + 20, y = 0, w = w, h = h } } },
    { id = "clock-slash",  dst = { { x = x_pos + 20 + w * 4, y = 0, w = w, h = h } } },
    { id = "clock-month",  dst = { { x = x_pos + 20 + w * 5, y = 0, w = w, h = h } } },
    { id = "clock-slash",  dst = { { x = x_pos + 20 + w * 7, y = 0, w = w, h = h } } },
    { id = "clock-day",    dst = { { x = x_pos + 20 + w * 8, y = 0, w = w, h = h } } },
    -- time
    { id = "clock-hour",   dst = { { x = x_pos + 20 + w * 11, y = 0, w = w, h = h } } },
    { id = "clock-colon",  dst = { { x = x_pos + 20 + w * 13, y = 0, w = w, h = h } } },
    { id = "clock-minute", dst = { { x = x_pos + 20 + w * 14, y = 0, w = w, h = h } } },
    { id = "clock-colon",  dst = { { x = x_pos + 20 + w * 16, y = 0, w = w, h = h } } },
    { id = "clock-second", dst = { { x = x_pos + 20 + w * 17, y = 0, w = w, h = h } } },
})
return skin
