local nirmala_ui_bold = require("common/digits/nirmala_ui_bold")
local append_all = require("utils/append_all")
local NUMBERS = require("play/consts").NUMBERS
local OFFSETS = require("play/consts").OFFSETS

local geometry = require("play/geometry").build()

local function load(skin)
    nirmala_ui_bold.load(skin)

    -- ハイスコア
    append_all(skin.value, {
        nirmala_ui_bold.white_integer({
            id = "ghost_diff_high_score",
            digit = 5,
            ref = NUMBERS.NUMBER_DIFF_HIGHSCORE
        }),
    })

    local x = geometry.lane_left_margin + geometry.lane_width / 2 - nirmala_ui_bold.width * 2 - 80
    append_all(skin.destination, {
        {
            id = "ghost_diff_high_score",
            offsets = { OFFSETS.OFFSET_LIFT, OFFSETS.OFFSET_JUDGE_1P },
            dst = {
                { x = x, y = 420, w = nirmala_ui_bold.width, h = nirmala_ui_bold.height },
            }
        },
    })
end
return { load = load }
