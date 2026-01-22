local nirmala_ui_bold = require("common/digits/nirmala_ui_bold")
local append_all = require("utils/append_all")
local numbers = require("play/consts").numbers
local values = require("play/consts").values

local function load(skin)
    nirmala_ui_bold.load(skin)

    -- ハイスコア
    append_all(skin.value, {
        nirmala_ui_bold.yellow({
            id = "num_info_panel_score",
            digit = 5,
            ref = numbers.NUMBER_SCORE
        }),
        nirmala_ui_bold.yellow({
            id = "num_info_panel_rate_integer_part",
            digit = 3,
            ref = numbers.NUMBER_SCORE_RATE
        }),
        nirmala_ui_bold.yellow({
            id = "num_info_panel_rate_decimal_part",
            digit = 2,
            zeropadding = values.zeropadding.ZEROPADDING,
            ref = numbers.NUMBER_SCORE_RATE_AFTERDOT
        }),
        nirmala_ui_bold.white({
            id = "num_info_panel_high_score",
            digit = 5,
            ref = numbers.NUMBER_HIGHSCORE
        }),
        nirmala_ui_bold.white_integer({
            id = "num_info_panel_diff_high_score",
            digit = 5,
            ref = numbers.NUMBER_DIFF_HIGHSCORE
        }),
    })

    append_all(skin.destination, {
        { -- 背景
            id = -111,
            dst = {
                { x = 200, y = 400, w = 200, h = 200, r = 50, g = 50, b = 50, a = 128 },
            }
        },
        {
            id = "num_info_panel_score",
            dst = {
                { x = 360 - nirmala_ui_bold.width * 5, y = 440, w = nirmala_ui_bold.width, h = nirmala_ui_bold.height },
            }
        },
        {
            id = "num_info_panel_rate_integer_part",
            dst = {
                { x = 360 - nirmala_ui_bold.width * 6, y = 480, w = nirmala_ui_bold.width, h = nirmala_ui_bold.height },
            }
        },
        {
            id = "num_info_panel_rate_decimal_part",
            dst = {
                { x = 360 - nirmala_ui_bold.width * 2, y = 480, w = nirmala_ui_bold.width, h = nirmala_ui_bold.height },
            }
        },
        {
            id = "num_info_panel_high_score",
            dst = {
                { x = 360 - nirmala_ui_bold.width * 5, y = 520, w = nirmala_ui_bold.width, h = nirmala_ui_bold.height },
            }
        },
        {
            id = "num_info_panel_diff_high_score",
            dst = {
                { x = 360 - nirmala_ui_bold.width * 5, y = 560, w = nirmala_ui_bold.width, h = nirmala_ui_bold.height },
            }
        },
    })
end
return { load = load }
