local geometry = require("play/geometry").build()
local OFFSETS = require("play/consts").OFFSETS
local TIMERS = require("play/consts").TIMERS

local slow_soflan = require("play/judge/slow_soflan")
local append_all = require("utils/append_all")

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
        { id = "judge_n_pg", src = "src_judge", x = 0, y = 0,                w = number_chip_width, h = judge_height, divx = 10, digit = 6, space = num_space },
        { id = "judge_n_gr", src = "src_judge", x = 0, y = judge_height,     w = number_chip_width, h = judge_height, divx = 10, digit = 6, space = num_space },
        { id = "judge_n_gd", src = "src_judge", x = 0, y = judge_height * 2, w = number_chip_width, h = judge_height, divx = 10, digit = 6, space = num_space },
        { id = "judge_n_bd", src = "src_judge", x = 0, y = judge_height * 3, w = number_chip_width, h = judge_height, divx = 10, digit = 6, space = num_space },
        { id = "judge_n_pr", src = "src_judge", x = 0, y = judge_height * 4, w = number_chip_width, h = judge_height, divx = 10, digit = 6, space = num_space },
        { id = "judge_n_ms", src = "src_judge", x = 0, y = judge_height * 5, w = number_chip_width, h = judge_height, divx = 10, digit = 6, space = num_space },
    })
    local x = geometry.lane_left_margin + geometry.lane_width / 2 - judge_font_w / 2 - geometry.lane_margin
    local y = geometry.lane_under_margin + 200 - judge_height / 2 -- 判定文字の種類による差を軽減する

    local function text_dst(a)
        return { time = 0, x = x, y = y, w = judge_font_w, h = judge_height, a = a }
    end
    local function text_image(id, draw, a)
        return {
            id = id,
            timer = TIMERS.TIMER_JUDGE_1P,
            -- draw = draw, -- 現状では出し分けを実現できない
            offsets = { OFFSETS.OFFSET_LIFT, OFFSETS.OFFSET_JUDGE_1P },
            dst = { text_dst(a) }
        }
    end

    local function number_dst(a)
        return { time = 0, x = judge_font_w + 40, y = 0, w = number_width, h = judge_height, a = a }
    end
    local function number_image(id, draw, a)
        return {
            id = id,
            timer = TIMERS.TIMER_JUDGE_1P,
            -- draw = draw, -- 現状では出し分けを実現できない
            offsets = { OFFSETS.OFFSET_LIFT, OFFSETS.OFFSET_JUDGE_1P },
            dst = { number_dst(a) }
        }
    end
    skin.judge = {
        {
            id = "judge",
            index = 0,
            images = {
                text_image("judge_f_pg", slow_soflan.without_slow_soflan, 255),
                text_image("judge_f_gr", slow_soflan.without_slow_soflan, 255),
                text_image("judge_f_gd", slow_soflan.without_slow_soflan, 255),
                text_image("judge_f_bd", slow_soflan.without_slow_soflan, 255),
                text_image("judge_f_pr", slow_soflan.without_slow_soflan, 255),
                text_image("judge_f_ms", slow_soflan.without_slow_soflan, 255),
                -- skin.judgeのimagesは配列長に対してpg~msをimplicitに表示する仕様で、複数登録できない
                -- ソフラン時にjudgeの仕様を変えたい場合は自分でskin.judge相当のスキンを実装する必要がある
                -- text_image("judge_f_pg", slow_soflan.with_slow_soflan, 80),
            },

            -- numbersはimagesの場所を基準として表示される
            numbers = {
                number_image("judge_n_pg", slow_soflan.without_slow_soflan, 255),
                number_image("judge_n_gr", slow_soflan.without_slow_soflan, 255),
                number_image("judge_n_gd", slow_soflan.without_slow_soflan, 255),
                number_image("judge_n_bd", slow_soflan.without_slow_soflan, 255),
                number_image("judge_n_pr", slow_soflan.without_slow_soflan, 255),
                number_image("judge_n_ms", slow_soflan.without_slow_soflan, 255),
            },
            shift = true
        }
    }

    table.insert(skin.destination, { id = "judge" })
end
return { load = load }
