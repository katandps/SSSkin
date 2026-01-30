local append_all = require("utils/append_all")
local nirmala_ui_bold = require("common/digits/nirmala_ui_bold")
local VALUES = require("play/consts").VALUES
local VALUE = require("play/consts").VALUE
local OFFSETS = require("play/consts").OFFSETS
local TIMERS = require("play/consts").TIMERS
local geometry = require("play/geometry").build()
local OPTIONS = require("play/consts").OPTIONS
local main_state = require("main_state")

local function is_precise()
    local duration = math.abs(main_state.number(VALUE.VALUE_JUDGE_1P_DURATION))
    return duration < 15
end

local function is_early()
    local duration = main_state.number(VALUE.VALUE_JUDGE_1P_DURATION)
    return duration > 0
end

local function is_late()
    local duration = main_state.number(VALUE.VALUE_JUDGE_1P_DURATION)
    return duration < 0
end

local function is_not_precise()
    return not is_precise()
end

local function is_autoplay_off()
    return main_state.option(OPTIONS.OPTION_AUTOPLAYOFF)
end

local function load(skin)
    nirmala_ui_bold.load(skin)

    append_all(skin.value, {
        -- 判定タイミングのズレ（ミリ）
        nirmala_ui_bold.minus_plus({
            id = "judge_timing",
            digit = 4,
            ref = VALUE.VALUE_JUDGE_1P_DURATION,
            zeropadding = VALUES.zeropadding.NOPADDING
        }),
        -- 十分正確な場合
        nirmala_ui_bold.white_integer({
            id = "judge_timing_precise",
            digit = 4,
            ref = VALUE.VALUE_JUDGE_1P_DURATION,
        }),
    })
    -- ms表示
    append_all(skin.image, {
        nirmala_ui_bold.white_ms({ id = "judge_timing_ms_precise", }),
        nirmala_ui_bold.blue_ms({ id = "judge_timing_ms_early", }),
        nirmala_ui_bold.red_ms({ id = "judge_timing_ms_late", }),
    })

    local x = geometry.lane_left_margin + geometry.lane_width / 2 - nirmala_ui_bold.width * 2
    local y = geometry.lane_under_margin + geometry.judge_detail_default_y

    -- +-ms
    append_all(skin.destination, {
        {
            id = "judge_timing",
            offsets = { OFFSETS.OFFSET_LIFT, OFFSETS.OFFSET_JUDGEDETAIL_1P },
            loop = -1,
            timer = TIMERS.TIMER_JUDGE_1P,
            draw = function() return is_not_precise() and is_autoplay_off() end,
            dst = {
                { time = 0,  x = x, y = y, w = nirmala_ui_bold.width, h = nirmala_ui_bold.height },
                { time = 500 }
            }
        },
        {
            id = "judge_timing_ms_early",
            offsets = { OFFSETS.OFFSET_LIFT, OFFSETS.OFFSET_JUDGEDETAIL_1P },
            draw = function() return is_not_precise() and is_early() and is_autoplay_off() end,
            loop = -1,
            timer = TIMERS.TIMER_JUDGE_1P,
            dst = {
                { time = 0,  x = x + nirmala_ui_bold.width * 4, y = y, w = 38, h = nirmala_ui_bold.height },
                { time = 500 }
            }
        },
        {
            id = "judge_timing_ms_late",
            offsets = { OFFSETS.OFFSET_LIFT, OFFSETS.OFFSET_JUDGEDETAIL_1P },
            draw = function() return is_not_precise() and is_late() and is_autoplay_off() end,
            loop = -1,
            timer = TIMERS.TIMER_JUDGE_1P,
            dst = {
                { time = 0,  x = x + nirmala_ui_bold.width * 4, y = y, w = 38, h = nirmala_ui_bold.height },
                { time = 500 }
            }
        },
        {
            id = "judge_timing_precise",
            offsets = { OFFSETS.OFFSET_LIFT, OFFSETS.OFFSET_JUDGEDETAIL_1P },
            draw = function() return is_precise() and is_autoplay_off() end,
            loop = -1,
            timer = TIMERS.TIMER_JUDGE_1P,
            dst = {
                { time = 0,  x = x, y = y, w = nirmala_ui_bold.width, h = nirmala_ui_bold.height, r = 96, g = 96, b = 96 },
                { time = 500 }
            }
        },
        {
            id = "judge_timing_ms_precise",
            offsets = { OFFSETS.OFFSET_LIFT, OFFSETS.OFFSET_JUDGEDETAIL_1P },
            draw = function() return is_precise() and is_autoplay_off() end,
            loop = -1,
            timer = TIMERS.TIMER_JUDGE_1P,
            dst = {
                { time = 0,  x = x + nirmala_ui_bold.width * 4, y = y, w = 38, h = nirmala_ui_bold.height, r = 96, g = 96, b = 96 },
                { time = 500 }
            }
        },
    })
end

return { load = load }
