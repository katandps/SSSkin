local geometry = require("play/geometry").build()
local OFFSETS = require("play/consts").OFFSETS
local TIMERS = require("play/consts").TIMERS

local slow_soflan = require("play/judge/slow_soflan")
local reiko_square = require("play/judge/reiko-square")

local function load(skin)
    reiko_square.load(skin)
    local chip = reiko_square.chip

    local x = geometry.lane_x_center - chip.text_width / 2 - geometry.lane_margin
    local y = geometry.lane_under_margin + 200 - chip.judge_height / 2 -- 判定文字の種類による差を軽減する

    local function text_dst(a)
        return { time = 0, x = x, y = y, w = chip.text_width, h = chip.judge_height, a = a }
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
        return { time = 0, x = chip.text_width + 40, y = 0, w = chip.number_width, h = chip.judge_height, a = a }
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
