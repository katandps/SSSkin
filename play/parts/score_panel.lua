--- スコア関連情報表示

local nirmala_ui_bold = require("common/digits/nirmala_ui_bold")
local append_all = require("utils/append_all")
local load = require("utils/load")
local NUMBERS = require("play/consts").NUMBERS
local VALUES = require("play/consts").VALUES

local geometry = require("play/geometry").build()
local skin = { value = {}, image = {}, destination = {} }
load(skin, nirmala_ui_bold.skin, "score_panel_font")

-- ハイスコア
append_all(skin.value, {
    nirmala_ui_bold.yellow({
        id = "num_info_panel_score",
        digit = 5,
        ref = NUMBERS.NUMBER_SCORE
    }),
    nirmala_ui_bold.yellow({
        id = "num_info_panel_rate_integer_part",
        digit = 3,
        ref = NUMBERS.NUMBER_SCORE_RATE
    }),
    nirmala_ui_bold.yellow({
        id = "num_info_panel_rate_decimal_part",
        digit = 2,
        zeropadding = VALUES.zeropadding.ZEROPADDING,
        ref = NUMBERS.NUMBER_SCORE_RATE_AFTERDOT
    }),
    nirmala_ui_bold.white({
        id = "num_info_panel_high_score",
        digit = 5,
        ref = NUMBERS.NUMBER_HIGHSCORE
    }),
    nirmala_ui_bold.white_integer({
        id = "num_info_panel_diff_high_score",
        digit = 5,
        ref = NUMBERS.NUMBER_DIFF_HIGHSCORE
    }),
})

append_all(skin.image, {
    nirmala_ui_bold.yellow_period({ id = "num_info_panel_rate_period", }),
    nirmala_ui_bold.yellow_percent({ id = "num_info_panel_rate_percent", }),
})

append_all(skin.destination, {
    { -- 背景
        id = -111,
        dst = {
            { x = geometry.score_panel_x, y = geometry.score_panel_y, w = geometry.score_panel_w, h = geometry.score_panel_h, r = 50, g = 50, b = 50, a = 128 },
        }
    },
    {
        id = "num_info_panel_score",
        dst = {
            { x = geometry.score_panel_x + 160 - nirmala_ui_bold.width * 5, y = geometry.score_panel_y + 40, w = nirmala_ui_bold.width, h = nirmala_ui_bold.height },
        }
    },
    {
        id = "num_info_panel_rate_integer_part",
        dst = {
            { x = geometry.score_panel_x + 160 - nirmala_ui_bold.width * 6, y = geometry.score_panel_y + 80, w = nirmala_ui_bold.width, h = nirmala_ui_bold.height },
        }
    },
    {
        id = "num_info_panel_rate_decimal_part",
        dst = {
            { x = geometry.score_panel_x + 160 - nirmala_ui_bold.width * 2, y = geometry.score_panel_y + 80, w = nirmala_ui_bold.width, h = nirmala_ui_bold.height },
        }
    },
    {
        id = "num_info_panel_high_score",
        dst = {
            { x = geometry.score_panel_x + 160 - nirmala_ui_bold.width * 5, y = geometry.score_panel_y + 120, w = nirmala_ui_bold.width, h = nirmala_ui_bold.height },
        }
    },
    {
        id = "num_info_panel_diff_high_score",
        dst = {
            { x = geometry.score_panel_x + 160 - nirmala_ui_bold.width * 5, y = geometry.score_panel_y + 160, w = nirmala_ui_bold.width, h = nirmala_ui_bold.height },
        }
    },
    {
        id = "num_info_panel_rate_period",
        dst = {
            { x = geometry.score_panel_x + 160 - nirmala_ui_bold.width * 3, y = geometry.score_panel_y + 80, w = nirmala_ui_bold.width, h = nirmala_ui_bold.height },
        }
    },
    {
        id = "num_info_panel_rate_percent",
        dst = {
            { x = geometry.score_panel_x + 160, y = geometry.score_panel_y + 80, w = nirmala_ui_bold.percent_w, h = nirmala_ui_bold.height },
        }
    }
})
return skin
