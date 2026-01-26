local append_all = require("utils/append_all")
local nirmala_ui_bold = require("common/digits/nirmala_ui_bold")
local values = require("play/consts").values
local value = require("play/consts").value
local offsets = require("play/consts").offsets
local timers = require("play/consts").timers
local geometry = require("play/geometry").build()
local options = require("play/consts").options
local main_state = require("main_state")

local function is_precise()
    local duration = math.abs(main_state.number(value.VALUE_JUDGE_1P_DURATION))
    return duration < 15
end

local function is_not_precise()
    return not is_precise()
end

local function is_autoplay_off()
    return main_state.option(options.OPTION_AUTOPLAYOFF)
end

local function load(skin)
    nirmala_ui_bold.load(skin)

    append_all(skin.value, {
        -- 判定タイミングのズレ（ミリ）
        nirmala_ui_bold.minus_plus({
            id = "judge_timing",
            digit = 4,
            ref = value.VALUE_JUDGE_1P_DURATION,
            zeropadding = values.zeropadding.NOPADDING
        }),
        -- 十分正確な場合
        nirmala_ui_bold.white_integer({
            id = "judge_timing_precise",
            digit = 4,
            ref = value.VALUE_JUDGE_1P_DURATION,
        }),
    })

    local x = geometry.lane_left_margin + geometry.lane_width / 2 - nirmala_ui_bold.width * 2

    -- +-ms
    append_all(skin.destination, {
        {
            id = "judge_timing",
            offsets = { offsets.OFFSET_LIFT, offsets.OFFSET_JUDGE_1P },
            loop = -1,
            timer = timers.TIMER_JUDGE_1P,
            draw = function() return is_not_precise() and is_autoplay_off() end,
            dst = {
                { time = 0,  x = x, y = 420, w = nirmala_ui_bold.width, h = nirmala_ui_bold.height },
                { time = 500 }
            }
        },
        {
            id = "judge_timing_precise",
            offsets = { offsets.OFFSET_LIFT, offsets.OFFSET_JUDGE_1P },
            draw = function() return is_precise() and is_autoplay_off() end,
            loop = -1,
            timer = timers.TIMER_JUDGE_1P,
            dst = {
                { time = 0,  x = x, y = 420, w = nirmala_ui_bold.width, h = nirmala_ui_bold.height },
                { time = 500 }
            }
        },
    })
end

return { load = load }
