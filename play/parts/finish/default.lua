local append_all = require("utils/append_all")
local timers = require("play/consts").timers
local options = require("play/consts").options
local main_state = require("main_state")

local function load(skin)
    local geometry = require("play/geometry").build()
    local offsets = require("play/consts").offsets
    table.insert(skin.source, { id = "src_finish", path = "play/parts/finish/finish.png" })

    local finish_w = 450
    local fullcombo_w = 606
    local perfect_w = 400
    local height = 112
    append_all(skin.image, {
        { id = "finish_finish",    src = "src_finish", x = 0, y = 0,          w = finish_w,    h = height },
        { id = "finish_fullcombo", src = "src_finish", x = 0, y = height,     w = fullcombo_w, h = height },
        { id = "finish_perfect",   src = "src_finish", x = 0, y = height * 2, w = perfect_w,   h = height },
    })

    local y = geometry.lane_under_margin + 80

    append_all(skin.destination, {
        {
            id = "finish_finish",
            offset = offsets.OFFSET_LIFT,
            timer = timers.TIMER_ENDOFNOTE_1P,
            draw = function()
                return main_state.option(options.OPTION_BAD_EXIST) or main_state.option(options.OPTION_POOR_EXIST)
            end,
            loop = 1000,
            dst = {
                { time = 0,    x = geometry.lane_left_margin + geometry.lane_width / 2 - finish_w / 2, y = y, w = finish_w, h = height, a = 0 },
                { time = 1000, a = 255 }
            }
        },
        {
            id = "finish_fullcombo",
            offset = offsets.OFFSET_LIFT,
            timer = timers.TIMER_ENDOFNOTE_1P,
            op = { options.OPTION_GOOD_EXIST, -options.OPTION_BAD_EXIST, -options.OPTION_POOR_EXIST },
            loop = 1000,
            dst = {
                { time = 0,    x = geometry.lane_left_margin + geometry.lane_width / 2 - fullcombo_w / 2, y = y, w = fullcombo_w, h = height, a = 0 },
                { time = 1000, a = 255 }
            }
        },
        {
            id = "finish_perfect",
            offset = offsets.OFFSET_LIFT,
            timer = timers.TIMER_ENDOFNOTE_1P,
            op = { -options.OPTION_GOOD_EXIST, -options.OPTION_BAD_EXIST, -options.OPTION_POOR_EXIST },
            loop = 1000,
            dst = {
                { time = 0,    x = geometry.lane_left_margin + geometry.lane_width / 2 - perfect_w / 2, y = y, w = perfect_w, h = height, a = 0 },
                { time = 1000, a = 255 }
            }
        },
    })
end
return { load = load }
