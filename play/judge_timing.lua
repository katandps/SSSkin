local append_all = require("utils/append_all")
local nirmala_ui_bold = require("common/digits/nirmala_ui_bold")
local values = require("play/consts").values
local value = require("play/consts").value
local offsets = require("play/consts").offsets
local timers = require("play/consts").timers
local geometry = require("play/geometry").build(27)

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
    })

    local x = geometry.lane_left_margin + geometry.lane_width / 2 - 227 / 2

    -- +-ms
    append_all(skin.destination, {
        {
            id = "judge_timing",
            offsets = { offsets.OFFSET_LIFT, offsets.OFFSET_JUDGE_1P },
            -- op = { MAIN.OP.AUTOPLAYOFF },
            loop = -1,
            timer = timers.TIMER_JUDGE_1P,
            dst = {
                { time = 0,  x = x, y = geometry.lane_under_margin + 300, w = nirmala_ui_bold.width, h = nirmala_ui_bold.height },
                { time = 500 }
            }
        },
    })
end

return { load = load }
