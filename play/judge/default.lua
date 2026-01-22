local consts = require("play/consts")
local append_all = require("utils/append_all")
local geometry = require("play/geometry").build(27)
local offsets = consts.offsets

local f_w = 227
local f_h = 84

local n_w = 55
local n_total_w = n_w * 10
local num_space = 5
local function load(skin)
    table.insert(skin.source, { id = "src_judge", path = "play/judge/gridgazer.png" })
    append_all(skin.image, {
        { id = "judge_f_pg", src = "src_judge", x = 0,   y = 0,   w = f_w, h = f_h },
        { id = "judge_f_gr", src = "src_judge", x = 0,   y = 252, w = f_w, h = f_h },
        { id = "judge_f_gd", src = "src_judge", x = 0,   y = 420, w = f_w, h = f_h },
        { id = "judge_f_bd", src = "src_judge", x = 227, y = 420, w = f_w, h = f_h },
        { id = "judge_f_pr", src = "src_judge", x = 454, y = 420, w = f_w, h = f_h },
        { id = "judge_f_ms", src = "src_judge", x = 454, y = 420, w = f_w, h = f_h },
    })

    append_all(skin.value, {
        { id = "judge_n_pg", src = "src_judge", x = 227, y = 0,   w = n_total_w, h = f_h, divx = 10, digit = 6, ref = consts.current_combo, space = num_space },
        { id = "judge_n_gr", src = "src_judge", x = 227, y = 252, w = n_total_w, h = f_h, divx = 10, digit = 6, ref = consts.current_combo, space = num_space },
        { id = "judge_n_gd", src = "src_judge", x = 227, y = 252, w = n_total_w, h = f_h, divx = 10, digit = 6, ref = consts.current_combo, space = num_space },
        { id = "judge_n_bd", src = "src_judge", x = 227, y = 252, w = n_total_w, h = f_h, divx = 10, digit = 6, ref = consts.current_combo, space = num_space },
        { id = "judge_n_pr", src = "src_judge", x = 227, y = 252, w = n_total_w, h = f_h, divx = 10, digit = 6, ref = consts.current_combo, space = num_space },
        { id = "judge_n_ms", src = "src_judge", x = 227, y = 252, w = n_total_w, h = f_h, divx = 10, digit = 6, ref = consts.current_combo, space = num_space },
    })
    local x = geometry.lane_left_margin + geometry.lane_width / 2 - f_w / 2
    skin.judge = {
        {
            id = "judge",
            index = 0,
            images = {
                {
                    id = "judge_f_pg",
                    timer = 46,
                    offsets = { offsets.OFFSET_LIFT, offsets.OFFSET_JUDGE_1P },
                    dst = {
                        { time = 0, x = x, y = geometry.lane_under_margin + 200, w = f_w, h = f_h },
                    }
                },
                {
                    id = "judge_f_gr",
                    timer = 46,
                    offsets = { offsets.OFFSET_LIFT, offsets.OFFSET_JUDGE_1P },
                    dst = {
                        { time = 0, x = x, y = geometry.lane_under_margin + 200, w = f_w, h = f_h },
                    }
                },
                {
                    id = "judge_f_gd",
                    timer = 46,
                    offsets = { offsets.OFFSET_LIFT, offsets.OFFSET_JUDGE_1P },
                    dst = {
                        { time = 0, x = x, y = geometry.lane_under_margin + 200, w = f_w, h = f_h },
                    }
                },
                {
                    id = "judge_f_bd",
                    timer = 46,
                    offsets = { offsets.OFFSET_LIFT, offsets.OFFSET_JUDGE_1P },
                    dst = {
                        { time = 0, x = x, y = geometry.lane_under_margin + 200, w = f_w, h = f_h },
                    }
                },
                {
                    id = "judge_f_pr",
                    timer = 46,
                    offsets = { offsets.OFFSET_LIFT, offsets.OFFSET_JUDGE_1P },
                    dst = {
                        { time = 0, x = x, y = geometry.lane_under_margin + 200, w = f_w, h = f_h },
                    }
                },
                {
                    id = "judge_f_ms",
                    timer = 46,
                    offsets = { offsets.OFFSET_LIFT, offsets.OFFSET_JUDGE_1P },
                    dst = {
                        { time = 0, x = x, y = geometry.lane_under_margin + 200, w = f_w, h = f_h },
                    }
                }
            },
            -- numbersはimagesの場所を基準として表示される
            numbers = {
                {
                    id = "judge_n_pg",
                    offset = { offsets.OFFSET_LIFT, offsets.OFFSET_JUDGE_1P },
                    timer = 46,
                    dst = {
                        { time = 0, x = f_w, y = 0, w = n_w, h = f_h },
                    }
                },
                {
                    id = "judge_n_gr",
                    offset = { offsets.OFFSET_LIFT, offsets.OFFSET_JUDGE_1P },
                    timer = 46,
                    dst = {
                        { time = 0, x = f_w, y = 0, w = n_w, h = f_h },
                    }
                },
                {
                    id = "judge_n_gd",
                    offset = { offsets.OFFSET_LIFT, offsets.OFFSET_JUDGE_1P },
                    timer = 46,
                    dst = {
                        { time = 0, x = f_w, y = 0, w = n_w, h = f_h },
                    }
                },
                {
                    id = "judge_n_bd",
                    offset = { offsets.OFFSET_LIFT, offsets.OFFSET_JUDGE_1P },
                    timer = 46,
                    dst = {
                        { time = 0, x = f_w, y = 0, w = n_w, h = f_h },
                    }
                },
                {
                    id = "judge_n_pr",
                    offset = { offsets.OFFSET_LIFT, offsets.OFFSET_JUDGE_1P },
                    timer = 46,
                    dst = {
                        { time = 0, x = f_w, y = 0, w = n_w, h = f_h },
                    }
                },
                {
                    id = "judge_n_ms",
                    offset = { offsets.OFFSET_LIFT, offsets.OFFSET_JUDGE_1P },
                    timer = 46,
                    dst = {
                        { time = 0, x = f_w, y = 0, w = n_w, h = f_h },
                    }
                }
            },
            shift = true
        }
    }

    table.insert(skin.destination, { id = "judge" })
end
return { load = load }
