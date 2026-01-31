local append_all = require("utils/append_all")
local nirmala_ui_bold = require("common/digits/nirmala_ui_bold")
local RESOURCE_IDS = require("play/consts").RESOURCE_IDS
local NUMBERS = require("play/consts").NUMBERS

local geometry = require("play/geometry").build()

local function load(skin)
    nirmala_ui_bold.load(skin)

    append_all(skin.value, {
        nirmala_ui_bold.white({ id = "judge-count-pg", digit = 5, ref = NUMBERS.NUMBER_PERFECT }),                        -- PERFECT
        nirmala_ui_bold.white({ id = "judge-count-gr", digit = 5, ref = NUMBERS.NUMBER_GREAT }),                          -- GREAT
        nirmala_ui_bold.white({ id = "judge-count-gd", digit = 5, ref = NUMBERS.NUMBER_GOOD }),                           -- GOOD
        nirmala_ui_bold.white({ id = "judge-count-bd", digit = 5, ref = NUMBERS.NUMBER_BAD }),                            -- BAD
        nirmala_ui_bold.white({ id = "judge-count-pr", digit = 5, ref = NUMBERS.NUMBER_POOR }),                           -- POOR
        nirmala_ui_bold.white({ id = "judge-count-fl", digit = 5, ref = NUMBERS.NUMBER_MISS }),                           -- MISS

        nirmala_ui_bold.blue({ id = "judge-count-fpg", digit = 5, ref = NUMBERS.NUMBER_EARLY_PERFECT }),                  -- fast PERFECT
        nirmala_ui_bold.blue({ id = "judge-count-fgr", digit = 5, ref = NUMBERS.NUMBER_EARLY_GREAT }),                    -- fast GREAT
        nirmala_ui_bold.blue({ id = "judge-count-fgd", digit = 5, ref = NUMBERS.NUMBER_EARLY_GOOD }),                     -- fast GOOD
        nirmala_ui_bold.blue({ id = "judge-count-fbd", digit = 5, ref = NUMBERS.NUMBER_EARLY_BAD }),                      -- fast BAD
        nirmala_ui_bold.blue({ id = "judge-count-fpr", digit = 5, ref = NUMBERS.NUMBER_EARLY_POOR }),                     -- fast POOR
        nirmala_ui_bold.blue({ id = "judge-count-ffl", digit = 5, ref = NUMBERS.NUMBER_EARLY_MISS }),                     -- fast FAIL

        nirmala_ui_bold.red({ id = "judge-count-spg", digit = 5, ref = NUMBERS.NUMBER_LATE_PERFECT }),                    -- slow PERFECT
        nirmala_ui_bold.red({ id = "judge-count-sgr", digit = 5, ref = NUMBERS.NUMBER_LATE_GREAT }),                      -- slow GREAT
        nirmala_ui_bold.red({ id = "judge-count-sgd", digit = 5, ref = NUMBERS.NUMBER_LATE_GOOD }),                       -- slow GOOD
        nirmala_ui_bold.red({ id = "judge-count-sbd", digit = 5, ref = NUMBERS.NUMBER_LATE_BAD }),                        -- slow BAD
        nirmala_ui_bold.red({ id = "judge-count-spr", digit = 5, ref = NUMBERS.NUMBER_LATE_POOR }),                       -- slow POOR
        nirmala_ui_bold.red({ id = "judge-count-sfl", digit = 5, ref = NUMBERS.NUMBER_LATE_MISS }),                       -- slow FAIL

        nirmala_ui_bold.yellow({ id = "judge-count-total-early", digit = 5, ref = NUMBERS.NUMBER_TOTALEARLY }),           -- total early
        nirmala_ui_bold.yellow({ id = "judge-count-total-late", digit = 5, ref = NUMBERS.NUMBER_TOTALLATE }),             -- total late

        nirmala_ui_bold.green({ id = "judge-count-misscount", digit = 5, ref = NUMBERS.NUMBER_BAD_PLUS_POOR_PLUS_MISS }), -- COMBO MISS COUNT
        nirmala_ui_bold.green({ id = "judge-count-combo-break", digit = 5, ref = NUMBERS.NUMBER_COMBOBREAK }),            -- COMBO BREAK

    })

    local panel_x = geometry.judge_panel_x
    local panel_y = geometry.judge_panel_y
    local panel_w = geometry.judge_panel_w
    local panel_h = geometry.judge_panel_h
    local w = nirmala_ui_bold.width
    local h = nirmala_ui_bold.height

    append_all(skin.destination, {
        -- background
        { id = RESOURCE_IDS.WHITE,        dst = { { x = panel_x, y = panel_y, w = panel_w, h = panel_h, r = 50, g = 50, b = 50, a = 192 } } },

        { id = "judge-count-pg",          dst = { { x = 47 + panel_x, y = panel_y - h * 1 + panel_h, w = w, h = h } } },
        { id = "judge-count-gr",          dst = { { x = 47 + panel_x, y = panel_y - h * 2 + panel_h, w = w, h = h } } },
        { id = "judge-count-gd",          dst = { { x = 47 + panel_x, y = panel_y - h * 3 + panel_h, w = w, h = h } } },
        { id = "judge-count-bd",          dst = { { x = 47 + panel_x, y = panel_y - h * 4 + panel_h, w = w, h = h } } },
        { id = "judge-count-pr",          dst = { { x = 47 + panel_x, y = panel_y - h * 5 + panel_h, w = w, h = h } } },
        { id = "judge-count-fl",          dst = { { x = 47 + panel_x, y = panel_y - h * 6 + panel_h, w = w, h = h } } },

        { id = "judge-count-fpg",         dst = { { x = 47 + panel_x + w * 6, y = panel_y - h * 1 + panel_h, w = w, h = h } } },
        { id = "judge-count-fgr",         dst = { { x = 47 + panel_x + w * 6, y = panel_y - h * 2 + panel_h, w = w, h = h } } },
        { id = "judge-count-fgd",         dst = { { x = 47 + panel_x + w * 6, y = panel_y - h * 3 + panel_h, w = w, h = h } } },
        { id = "judge-count-fbd",         dst = { { x = 47 + panel_x + w * 6, y = panel_y - h * 4 + panel_h, w = w, h = h } } },
        { id = "judge-count-fpr",         dst = { { x = 47 + panel_x + w * 6, y = panel_y - h * 5 + panel_h, w = w, h = h } } },
        { id = "judge-count-ffl",         dst = { { x = 47 + panel_x + w * 6, y = panel_y - h * 6 + panel_h, w = w, h = h } } },
        { id = "judge-count-total-early", dst = { { x = 47 + panel_x + w * 6, y = panel_y - h * 7 + panel_h, w = w, h = h } } },


        { id = "judge-count-spg",         dst = { { x = 47 + panel_x + w * 12, y = panel_y - h * 1 + panel_h, w = w, h = h } } },
        { id = "judge-count-sgr",         dst = { { x = 47 + panel_x + w * 12, y = panel_y - h * 2 + panel_h, w = w, h = h } } },
        { id = "judge-count-sgd",         dst = { { x = 47 + panel_x + w * 12, y = panel_y - h * 3 + panel_h, w = w, h = h } } },
        { id = "judge-count-sbd",         dst = { { x = 47 + panel_x + w * 12, y = panel_y - h * 4 + panel_h, w = w, h = h } } },
        { id = "judge-count-spr",         dst = { { x = 47 + panel_x + w * 12, y = panel_y - h * 5 + panel_h, w = w, h = h } } },
        { id = "judge-count-sfl",         dst = { { x = 47 + panel_x + w * 12, y = panel_y - h * 6 + panel_h, w = w, h = h } } },
        { id = "judge-count-total-late",  dst = { { x = 47 + panel_x + w * 12, y = panel_y - h * 7 + panel_h, w = w, h = h } } },


        { id = "judge-count-combo-break", dst = { { x = 47 + panel_x, y = panel_y, w = w, h = h } } },
        { id = "judge-count-misscount",   dst = { { x = 47 + panel_x + w * 12, y = panel_y, w = w, h = h } } },

        -- MISS COUNT
        -- COMBO BREAK
    })
end

return { load = load }
