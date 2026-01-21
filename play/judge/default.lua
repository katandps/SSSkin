local consts = require("play/consts")
local append_all = require("utils/append_all")
local geometry = require("play/geometry").build(27)
local offsets = consts.offsets

local looptime = 500
local f_w = 227
local f_h = 84

local n_w = 55
local n_total_w = n_w * 10
local num_space = 5
local function load(skin)
    table.insert(skin.source, { id = "src_judge", path = "play/judge/gridgazer.png" })
    append_all(skin.image, {
        { id = "judge_f_pg", src = "src_judge", x = 0,   y = 0,   w = f_w, h = 252, divy = 3, cycle = 240 },
        { id = "judge_f_gr", src = "src_judge", x = 0,   y = 252, w = f_w, h = 168, divy = 2, cycle = 80 },
        { id = "judge_f_gd", src = "src_judge", x = 0,   y = 420, w = f_w, h = 168, divy = 2, cycle = 80 },
        { id = "judge_f_bd", src = "src_judge", x = 227, y = 420, w = f_w, h = 168, divy = 2, cycle = 80 },
        { id = "judge_f_pr", src = "src_judge", x = 454, y = 420, w = f_w, h = 168, divy = 2, cycle = 80 },
        { id = "judge_f_ms", src = "src_judge", x = 454, y = 420, w = f_w, h = 168, divy = 2, cycle = 80 },
    })

    append_all(skin.value, {
        { id = "judge_n_pg", src = "src_judge", x = 227, y = 0,   w = n_total_w, h = 252, divx = 10, divy = 3, digit = 6, ref = consts.current_combo, cycle = 240, space = num_space },
        { id = "judge_n_gr", src = "src_judge", x = 227, y = 252, w = n_total_w, h = 168, divx = 10, divy = 2, digit = 6, ref = consts.current_combo, cycle = 80,  space = num_space },
        { id = "judge_n_gd", src = "src_judge", x = 227, y = 252, w = n_total_w, h = 168, divx = 10, divy = 2, digit = 6, ref = consts.current_combo, cycle = 80,  space = num_space },
        { id = "judge_n_bd", src = "src_judge", x = 227, y = 252, w = n_total_w, h = 168, divx = 10, divy = 2, digit = 6, ref = consts.current_combo, cycle = 80,  space = num_space },
        { id = "judge_n_pr", src = "src_judge", x = 227, y = 252, w = n_total_w, h = 168, divx = 10, divy = 2, digit = 6, ref = consts.current_combo, cycle = 80,  space = num_space },
        { id = "judge_n_ms", src = "src_judge", x = 227, y = 252, w = n_total_w, h = 168, divx = 10, divy = 2, digit = 6, ref = consts.current_combo, cycle = 80,  space = num_space },
    })

    skin.judge = {
        {
            id = "judge",
            index = 0,
            images = {
                {
                    id = "judge_f_pg",
                    loop = -1,
                    timer = 46,
                    offsets = { offsets.OFFSET_LIFT, offsets.OFFSET_JUDGE_1P },
                    dst = {
                        { time = 0,       x = geometry.lane_left_margin, y = geometry.lane_under_margin + 200, w = f_w, h = f_h },
                        { time = looptime }
                    }
                },
                {
                    id = "judge_f_gr",
                    loop = -1,
                    timer = 46,
                    offsets = { offsets.OFFSET_LIFT, offsets.OFFSET_JUDGE_1P },
                    dst = {
                        { time = 0,       x = geometry.lane_left_margin, y = geometry.lane_under_margin + 200, w = f_w, h = f_h },
                        { time = looptime }
                    }
                },
                {
                    id = "judge_f_gd",
                    loop = -1,
                    timer = 46,
                    offsets = { offsets.OFFSET_LIFT, offsets.OFFSET_JUDGE_1P },
                    dst = {
                        { time = 0,       x = geometry.lane_left_margin, y = geometry.lane_under_margin + 200, w = f_w, h = f_h },
                        { time = looptime }
                    }
                },
                {
                    id = "judge_f_bd",
                    loop = -1,
                    timer = 46,
                    offsets = { offsets.OFFSET_LIFT, offsets.OFFSET_JUDGE_1P },
                    dst = {
                        { time = 0,       x = geometry.lane_left_margin, y = geometry.lane_under_margin + 200, w = f_w, h = f_h },
                        { time = looptime }
                    }
                },
                {
                    id = "judge_f_pr",
                    loop = -1,
                    timer = 46,
                    offsets = { offsets.OFFSET_LIFT, offsets.OFFSET_JUDGE_1P },
                    dst = {
                        { time = 0,       x = geometry.lane_left_margin, y = geometry.lane_under_margin + 200, w = f_w, h = f_h },
                        { time = looptime }
                    }
                },
                {
                    id = "judge_f_ms",
                    loop = -1,
                    timer = 46,
                    offsets = { offsets.OFFSET_LIFT, offsets.OFFSET_JUDGE_1P },
                    dst = {
                        { time = 0,       x = geometry.lane_left_margin, y = geometry.lane_under_margin + 200, w = f_w, h = f_h },
                        { time = looptime }
                    }
                }
            },
            numbers = {
                {
                    id = "judge_n_pg",
                    loop = -1,
                    offset = { offsets.OFFSET_LIFT, offsets.OFFSET_JUDGE_1P },
                    timer = 46,
                    dst = {
                        { time = 0,       x = geometry.lane_left_margin, y = geometry.lane_under_margin + 200, w = n_w, h = f_h },
                        { time = looptime }
                    }
                },
                {
                    id = "judge_n_gr",
                    loop = -1,
                    offset = { offsets.OFFSET_LIFT, offsets.OFFSET_JUDGE_1P },
                    timer = 46,
                    dst = {
                        { time = 0,       x = geometry.lane_left_margin, y = geometry.lane_under_margin + 200, w = n_w, h = f_h },
                        { time = looptime }
                    }
                },
                {
                    id = "judge_n_gd",
                    loop = -1,
                    offset = { offsets.OFFSET_LIFT, offsets.OFFSET_JUDGE_1P },
                    timer = 46,
                    dst = {
                        { time = 0,       x = geometry.lane_left_margin, y = geometry.lane_under_margin + 200, w = n_w, h = f_h },
                        { time = looptime }
                    }
                },
                {
                    id = "judge_n_bd",
                    loop = -1,
                    offset = { offsets.OFFSET_LIFT, offsets.OFFSET_JUDGE_1P },
                    timer = 46,
                    dst = {
                        { time = 0,       x = geometry.lane_left_margin, y = geometry.lane_under_margin + 200, w = n_w, h = f_h },
                        { time = looptime }
                    }
                },
                {
                    id = "judge_n_pr",
                    loop = -1,
                    offset = { offsets.OFFSET_LIFT, offsets.OFFSET_JUDGE_1P },
                    timer = 46,
                    dst = {
                        { time = 0,       x = geometry.lane_left_margin, y = geometry.lane_under_margin + 200, w = n_w, h = f_h },
                        { time = looptime }
                    }
                },
                {
                    id = "judge_n_ms",
                    loop = -1,
                    offset = { offsets.OFFSET_LIFT, offsets.OFFSET_JUDGE_1P },
                    timer = 46,
                    dst = {
                        { time = 0,       x = geometry.lane_left_margin, y = geometry.lane_under_margin + 200, w = n_w, h = f_h },
                        { time = looptime }
                    }
                }
            },
            shift = true
        }
    }

    table.insert(skin.destination, { id = "judge" })
end
return { load = load }
