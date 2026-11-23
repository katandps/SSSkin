--- クリアゲージ残量表示

local append_all   = require("utils/append_all")
local load         = require("utils/load")
local font         = require("common/digits/anticyclone_bold")
local NUMBERS      = require("play/consts").NUMBERS
local GAUGE_TYPES  = require("play/consts").GAUGE_TYPES
local RESOURCE_IDS = require("play/consts").RESOURCE_IDS
local main_state   = require("main_state")

local geometry     = require("play/geometry").build()

local function current_gauge_type_is(type)
    local function func()
        local gauge = main_state.gauge_type()
        return gauge == type
    end
    return func
end
local skin = { source = {}, value = {}, image = {}, destination = {}, gauge = {} }
table.insert(skin.source, { id = "resource_gauge", path = "common/white_1dot.bmp" })

load(skin, font.skin, "gauge_value_font")

append_all(skin.value, {
    font.white({
        id = "gaugevalue",
        digit = 3,
        ref = NUMBERS.NUMBER_GROOVEGAUGE,
    }),
    font.white({ id = "gaugevalue_ad", digit = 1, ref = NUMBERS.NUMBER_GROOVEGAUGE_AFTERDOT }),
})

append_all(skin.image, {
    font.white_period({ id = "gaugevalue_period" }),
    { id = "gauge_white", src = "resource_gauge", x = 0, y = 0, w = 1, h = 1 }, -- srcは画像を用意する必要がある(NPEが出る)
    { id = "gauge_black", src = "resource_gauge", x = 0, y = 1, w = 1, h = 1 }, -- srcは画像を用意する必要がある(NPEが出る)
})

local x, y, w, h = geometry.gauge_value_x, geometry.gauge_value_y, font.width, font.height

local gauge_types = {
    { draw = GAUGE_TYPES.GAUGE_TYPE_ASSIST_EASY,  r = 255, g = 0,   b = 255, }, -- ASSIST EASY
    { draw = GAUGE_TYPES.GAUGE_TYPE_EASY,         r = 80,  g = 255, b = 80, },  -- EASY
    { draw = GAUGE_TYPES.GAUGE_TYPE_NORMAL,       r = 0,   g = 255, b = 255, }, -- NORMAL
    { draw = GAUGE_TYPES.GAUGE_TYPE_HARD,         r = 255, g = 0,   b = 0, },   -- HARD
    { draw = GAUGE_TYPES.GAUGE_TYPE_EXHARD,       r = 255, g = 255, b = 0, },   -- EXHARD
    { draw = GAUGE_TYPES.GAUGE_TYPE_HAZARD,       r = 255, g = 255, b = 255, }, -- HAZARD
    { draw = GAUGE_TYPES.GAUGE_TYPE_GRADE,        r = 255, g = 0,   b = 0, },   -- GRADE
    { draw = GAUGE_TYPES.GAUGE_TYPE_EX_GRADE,     r = 255, g = 255, b = 0, },   -- EX GRADE
    { draw = GAUGE_TYPES.GAUGE_TYPE_EXHARD_GRADE, r = 255, g = 255, b = 255, }, -- EXHARD GRADE
}

skin.gauge = {
    id = "gauge",
    range = 0, -- 点滅アニメーションの幅 点滅させない
    nodes = {
        -- overclear / underclear / overclear(dark) / underclear(dark) / chip / chip(dark)
        "gauge_white", "gauge_white", "gauge_black", "gauge_black", "gauge_white", "gauge_black", -- ASSIST EASY
        "gauge_white", "gauge_white", "gauge_black", "gauge_black", "gauge_white", "gauge_black", -- EASY
        "gauge_white", "gauge_white", "gauge_black", "gauge_black", "gauge_white", "gauge_black", -- NORMAL
        "gauge_white", "gauge_white", "gauge_black", "gauge_black", "gauge_white", "gauge_black", -- HARD
        "gauge_white", "gauge_white", "gauge_black", "gauge_black", "gauge_white", "gauge_black", -- EXHARD
        "gauge_white", "gauge_white", "gauge_black", "gauge_black", "gauge_white", "gauge_black", -- HAZARD
    }
}
for _, gauge_type in pairs(gauge_types) do
    append_all(skin.destination, {
        {
            id = RESOURCE_IDS.WHITE,
            draw = current_gauge_type_is(gauge_type.draw),
            dst = { { x = x - 10, y = y - 20, w = geometry.gauge_panel_w, h = geometry.gauge_panel_h, r = gauge_type.r, g = gauge_type.g, b = gauge_type.b, a = 20 } },
        },
        {
            id = "gauge",
            draw = current_gauge_type_is(gauge_type.draw),
            dst = { { x = x - 10, y = y - 20, w = geometry.gauge_panel_w, h = 10, r = gauge_type.r, g = gauge_type.g, b = gauge_type.b, a = 60 } },
        },
        {
            id = "gaugevalue",
            draw = current_gauge_type_is(gauge_type.draw),
            dst = { { x = x, y = y, w = w, h = h, r = gauge_type.r, g = gauge_type.g, b = gauge_type.b, } }
        },
        {
            id = "gaugevalue_period",
            draw = current_gauge_type_is(gauge_type.draw),
            dst = { { x = x + w * 3, y = y, w = font.period_width, h = h, r = gauge_type.r, g = gauge_type.g, b = gauge_type.b, } }
        },
        {
            id = "gaugevalue_ad",
            draw = current_gauge_type_is(gauge_type.draw),
            dst = { { x = x + w * 3 + font.period_width, y = y, w = w, h = h, r = gauge_type.r, g = gauge_type.g, b = gauge_type.b, } }
        },
    })
end
return skin
