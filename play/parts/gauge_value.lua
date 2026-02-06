local append_all  = require("utils/append_all")
local font        = require("common/digits/anticyclone_bold")
local NUMBERS     = require("play/consts").NUMBERS
local GAUGE_TYPES = require("play/consts").GAUGE_TYPES
local main_state  = require("main_state")

local geometry    = require("play/geometry").build()

local function gauge_type(type)
    local function func()
        local gauge = main_state.gauge_type()
        return gauge == type
    end
    return func
end

local function load(skin)
    font.load(skin)

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
    })

    local x, y, w, h = geometry.gauge_value_x, geometry.gauge_value_y, font.width, font.height
    append_all(skin.destination, {
        -- ASSIST EASY
        {
            id = "gaugevalue",
            draw = gauge_type(GAUGE_TYPES.GAUGE_TYPE_ASSIST_EASY),
            dst = { { x = x, y = y, w = w, h = h, r = 255, g = 0, b = 255, } }
        },
        {
            id = "gaugevalue_period",
            draw = gauge_type(GAUGE_TYPES.GAUGE_TYPE_ASSIST_EASY),
            dst = { { x = x + w * 3, y = y, w = font.period_width, h = h, r = 255, g = 0, b = 255, } }
        },
        {
            id = "gaugevalue_ad",
            draw = gauge_type(GAUGE_TYPES.GAUGE_TYPE_ASSIST_EASY),
            dst = { { x = x + w * 3 + font.period_width, y = y, w = w, h = h, r = 255, g = 0, b = 255, } }
        },
        --  EASY
        {
            id = "gaugevalue",
            draw = gauge_type(GAUGE_TYPES.GAUGE_TYPE_EASY),
            dst = { { x = x, y = y, w = w, h = h, r = 80, g = 255, b = 80, } }
        },
        {
            id = "gaugevalue_period",
            draw = gauge_type(GAUGE_TYPES.GAUGE_TYPE_EASY),
            dst = { { x = x + w * 3, y = y, w = font.period_width, h = h, r = 80, g = 255, b = 80, } }
        },
        {
            id = "gaugevalue_ad",
            draw = gauge_type(GAUGE_TYPES.GAUGE_TYPE_EASY),
            dst = { { x = x + w * 3 + font.period_width, y = y, w = w, h = h, r = 80, g = 255, b = 80, } }
        },
        --  NORMAL
        {
            id = "gaugevalue",
            draw = gauge_type(GAUGE_TYPES.GAUGE_TYPE_NORMAL),
            dst = { { x = x, y = y, w = w, h = h, r = 0, g = 255, b = 255, } }
        },
        {
            id = "gaugevalue_period",
            draw = gauge_type(GAUGE_TYPES.GAUGE_TYPE_NORMAL),
            dst = { { x = x + w * 3, y = y, w = font.period_width, h = h, r = 0, g = 255, b = 255, } }
        },
        {
            id = "gaugevalue_ad",
            draw = gauge_type(GAUGE_TYPES.GAUGE_TYPE_NORMAL),
            dst = { { x = x + w * 3 + font.period_width, y = y, w = w, h = h, r = 0, g = 255, b = 255, } }
        },
        -- HARD
        {
            id = "gaugevalue",
            draw = gauge_type(GAUGE_TYPES.GAUGE_TYPE_HARD),
            dst = { { x = x, y = y, w = w, h = h, r = 255, g = 0, b = 0, } }
        },
        {
            id = "gaugevalue_period",
            draw = gauge_type(GAUGE_TYPES.GAUGE_TYPE_HARD),
            dst = { { x = x + w * 3, y = y, w = font.period_width, h = h, r = 255, g = 0, b = 0, } }
        },
        {
            id = "gaugevalue_ad",
            draw = gauge_type(GAUGE_TYPES.GAUGE_TYPE_HARD),
            dst = { { x = x + w * 3 + font.period_width, y = y, w = w, h = h, r = 255, g = 0, b = 0, } }
        },
        -- EXHARD
        {
            id = "gaugevalue",
            draw = gauge_type(GAUGE_TYPES.GAUGE_TYPE_EXHARD),
            dst = { { x = x, y = y, w = w, h = h, r = 255, g = 255, b = 0, } }
        },
        {
            id = "gaugevalue_period",
            draw = gauge_type(GAUGE_TYPES.GAUGE_TYPE_EXHARD),
            dst = { { x = x + w * 3, y = y, w = font.period_width, h = h, r = 255, g = 255, b = 0, } }
        },
        {
            id = "gaugevalue_ad",
            draw = gauge_type(GAUGE_TYPES.GAUGE_TYPE_EXHARD),
            dst = { { x = x + w * 3 + font.period_width, y = y, w = w, h = h, r = 255, g = 255, b = 0, } }
        },
        -- HAZARD
        {
            id = "gaugevalue",
            draw = gauge_type(GAUGE_TYPES.GAUGE_TYPE_HAZARD),
            dst = { { x = x, y = y, w = w, h = h, r = 255, g = 255, b = 255, } }
        },
        {
            id = "gaugevalue_period",
            draw = gauge_type(GAUGE_TYPES.GAUGE_TYPE_HAZARD),
            dst = { { x = x + w * 3, y = y, w = font.period_width, h = h, r = 255, g = 255, b = 255, } }
        },
        {
            id = "gaugevalue_ad",
            draw = gauge_type(GAUGE_TYPES.GAUGE_TYPE_HAZARD),
            dst = { { x = x + w * 3 + font.period_width, y = y, w = w, h = h, r = 255, g = 255, b = 255, } }
        },
        -- GRADE
        {
            id = "gaugevalue",
            draw = gauge_type(GAUGE_TYPES.GAUGE_TYPE_GRADE),
            dst = { { x = x, y = y, w = w, h = h, r = 255, g = 0, b = 0, } }
        },
        {
            id = "gaugevalue_period",
            draw = gauge_type(GAUGE_TYPES.GAUGE_TYPE_GRADE),
            dst = { { x = x + w * 3, y = y, w = font.period_width, h = h, r = 255, g = 0, b = 0, } }
        },
        {
            id = "gaugevalue_ad",
            draw = gauge_type(GAUGE_TYPES.GAUGE_TYPE_GRADE),
            dst = { { x = x + w * 3 + font.period_width, y = y, w = w, h = h, r = 255, g = 0, b = 0, } }
        },
        -- EX GRADE
        {
            id = "gaugevalue",
            draw = gauge_type(GAUGE_TYPES.GAUGE_TYPE_EX_GRADE),
            dst = { { x = x, y = y, w = w, h = h, r = 255, g = 0, b = 0, } }
        },
        {
            id = "gaugevalue_period",
            draw = gauge_type(GAUGE_TYPES.GAUGE_TYPE_EX_GRADE),
            dst = { { x = x + w * 3, y = y, w = font.period_width, h = h, r = 255, g = 0, b = 0, } }
        },
        {
            id = "gaugevalue_ad",
            draw = gauge_type(GAUGE_TYPES.GAUGE_TYPE_EX_GRADE),
            dst = { { x = x + w * 3 + font.period_width, y = y, w = w, h = h, r = 255, g = 0, b = 0, } }
        },
        -- EXHARD GRADE
        {
            id = "gaugevalue",
            draw = gauge_type(GAUGE_TYPES.GAUGE_TYPE_EXHARD_GRADE),
            dst = { { x = x, y = y, w = w, h = h, r = 255, g = 255, b = 0, } }
        },
        {
            id = "gaugevalue_period",
            draw = gauge_type(GAUGE_TYPES.GAUGE_TYPE_EXHARD_GRADE),
            dst = { { x = x + w * 3, y = y, w = font.period_width, h = h, r = 255, g = 255, b = 0, } }
        },
        {
            id = "gaugevalue_ad",
            draw = gauge_type(GAUGE_TYPES.GAUGE_TYPE_EXHARD_GRADE),
            dst = { { x = x + w * 3 + font.period_width, y = y, w = w, h = h, r = 255, g = 255, b = 0, } }
        },

    })
end

return { load = load }
