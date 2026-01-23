local consts = require("play/consts")
local append_all = require("utils/append_all")
local geometry = require("play/geometry").build(27)
local offsets = consts.offsets

local judge_font_w = 420
local judge_height = 96

local number_width = 96
local number_chip_width = number_width * 10
local num_space = -4
local function load(skin)
    table.insert(skin.source, { id = "src_judge", path = "play/judge/reiko-square.png" })
    append_all(skin.image, {
        { id = "judge_f_pg", src = "src_judge", x = number_chip_width, y = 0,                w = judge_font_w, h = judge_height },
        { id = "judge_f_gr", src = "src_judge", x = number_chip_width, y = judge_height,     w = judge_font_w, h = judge_height },
        { id = "judge_f_gd", src = "src_judge", x = number_chip_width, y = judge_height * 2, w = judge_font_w, h = judge_height },
        { id = "judge_f_bd", src = "src_judge", x = number_chip_width, y = judge_height * 3, w = judge_font_w, h = judge_height },
        { id = "judge_f_pr", src = "src_judge", x = number_chip_width, y = judge_height * 4, w = judge_font_w, h = judge_height },
        { id = "judge_f_ms", src = "src_judge", x = number_chip_width, y = judge_height * 5, w = judge_font_w, h = judge_height },
    })

    append_all(skin.value, {
        { id = "judge_n_pg", src = "src_judge", x = 0, y = 0,                w = number_chip_width, h = judge_height, divx = 10, digit = 6, ref = consts.current_combo, space = num_space },
        { id = "judge_n_gr", src = "src_judge", x = 0, y = judge_height,     w = number_chip_width, h = judge_height, divx = 10, digit = 6, ref = consts.current_combo, space = num_space },
        { id = "judge_n_gd", src = "src_judge", x = 0, y = judge_height * 2, w = number_chip_width, h = judge_height, divx = 10, digit = 6, ref = consts.current_combo, space = num_space },
        { id = "judge_n_bd", src = "src_judge", x = 0, y = judge_height * 3, w = number_chip_width, h = judge_height, divx = 10, digit = 6, ref = consts.current_combo, space = num_space },
        { id = "judge_n_pr", src = "src_judge", x = 0, y = judge_height * 4, w = number_chip_width, h = judge_height, divx = 10, digit = 6, ref = consts.current_combo, space = num_space },
        { id = "judge_n_ms", src = "src_judge", x = 0, y = judge_height * 5, w = number_chip_width, h = judge_height, divx = 10, digit = 6, ref = consts.current_combo, space = num_space },
    })
    local x = geometry.lane_left_margin + geometry.lane_width / 2 - judge_font_w / 2 - geometry.lane_margin -- いい感じの位置
    local y = geometry.lane_under_margin + 200 - judge_height / 2 -- 判定文字の種類による差を軽減する
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
                        { time = 0, x = x, y = geometry.lane_under_margin + 200, w = judge_font_w, h = judge_height },
                    }
                },
                {
                    id = "judge_f_gr",
                    timer = 46,
                    offsets = { offsets.OFFSET_LIFT, offsets.OFFSET_JUDGE_1P },
                    dst = {
                        { time = 0, x = x, y = geometry.lane_under_margin + 200, w = judge_font_w, h = judge_height },
                    }
                },
                {
                    id = "judge_f_gd",
                    timer = 46,
                    offsets = { offsets.OFFSET_LIFT, offsets.OFFSET_JUDGE_1P },
                    dst = {
                        { time = 0, x = x, y = geometry.lane_under_margin + 200, w = judge_font_w, h = judge_height },
                    }
                },
                {
                    id = "judge_f_bd",
                    timer = 46,
                    offsets = { offsets.OFFSET_LIFT, offsets.OFFSET_JUDGE_1P },
                    dst = {
                        { time = 0, x = x, y = geometry.lane_under_margin + 200, w = judge_font_w, h = judge_height },
                    }
                },
                {
                    id = "judge_f_pr",
                    timer = 46,
                    offsets = { offsets.OFFSET_LIFT, offsets.OFFSET_JUDGE_1P },
                    dst = {
                        { time = 0, x = x, y = geometry.lane_under_margin + 200, w = judge_font_w, h = judge_height },
                    }
                },
                {
                    id = "judge_f_ms",
                    timer = 46,
                    offsets = { offsets.OFFSET_LIFT, offsets.OFFSET_JUDGE_1P },
                    dst = {
                        { time = 0, x = x, y = geometry.lane_under_margin + 200, w = judge_font_w, h = judge_height },
                    }
                }
            },
            -- numbersはimagesの場所を基準として表示される
            numbers = {
                {
                    id = "judge_n_pg",
                    offsets = { offsets.OFFSET_JUDGE_1P },
                    timer = 46,
                    dst = {
                        { time = 0, x = judge_font_w + 40, y = 0, w = number_width, h = judge_height },
                    }
                },
                {
                    id = "judge_n_gr",
                    offsets = { offsets.OFFSET_JUDGE_1P },
                    timer = 46,
                    dst = {
                        { time = 0, x = judge_font_w + 40, y = 0, w = number_width, h = judge_height },
                    }
                },
                {
                    id = "judge_n_gd",
                    offsets = { offsets.OFFSET_JUDGE_1P },
                    timer = 46,
                    dst = {
                        { time = 0, x = judge_font_w + 40, y = 0, w = number_width, h = judge_height },
                    }
                },
                {
                    id = "judge_n_bd",
                    offsets = { offsets.OFFSET_JUDGE_1P },
                    timer = 46,
                    dst = {
                        { time = 0, x = judge_font_w + 40, y = 0, w = number_width, h = judge_height },
                    }
                },
                {
                    id = "judge_n_pr",
                    offsets = { offsets.OFFSET_JUDGE_1P },
                    timer = 46,
                    dst = {
                        { time = 0, x = judge_font_w + 40, y = 0, w = number_width, h = judge_height },
                    }
                },
                {
                    id = "judge_n_ms",
                    offsets = { offsets.OFFSET_JUDGE_1P },
                    timer = 46,
                    dst = {
                        { time = 0, x = judge_font_w + 40, y = 0, w = number_width, h = judge_height },
                    }
                }
            },
            shift = true
        }
    }

    table.insert(skin.destination, { id = "judge" })
end
return { load = load }
