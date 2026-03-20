--- oxボム
--- GREAT以上でo、BAD以下でxを表示する

local log = require("utils/log")
local serialize_value = require("utils/serialize_value")
local TIMERS = require("play/consts").TIMERS

local skin = { source = {}, image = {}, imageset = {}, destination = {} }

table.insert(skin.source, { id = "src_bomb_ox", path = "play/parts/bomb/ox.png" })


local VALUE_JUDGE_1P_SCRATCH = 500


local o_timer_list = { TIMERS.TIMER_BOMB_1P_KEY1, TIMERS.TIMER_BOMB_1P_KEY2, TIMERS.TIMER_BOMB_1P_KEY3, TIMERS
    .TIMER_BOMB_1P_KEY4, TIMERS.TIMER_BOMB_1P_KEY5, TIMERS.TIMER_BOMB_1P_KEY6, TIMERS.TIMER_BOMB_1P_KEY7, TIMERS
    .TIMER_BOMB_1P_SCRATCH }
local x_timer_list = { TIMERS.TIMER_BOMB_1P_KEY1, TIMERS.TIMER_BOMB_1P_KEY2, TIMERS.TIMER_BOMB_1P_KEY3, TIMERS
    .TIMER_BOMB_1P_KEY4, TIMERS.TIMER_BOMB_1P_KEY5, TIMERS.TIMER_BOMB_1P_KEY6, TIMERS.TIMER_BOMB_1P_KEY7, TIMERS
    .TIMER_BOMB_1P_SCRATCH }
local judge_value = { 501, 502, 503, 504, 505, 506, 507, VALUE_JUDGE_1P_SCRATCH }


for key = 1, 8 do
    table.insert(skin.image, {
        id = "img_bomb_o" .. key,
        src = "src_bomb_ox",
        x = 0,
        y = 0,
        w = 1600,
        h = 200,
        divx = 8,
        cycle = 201,
    })
    table.insert(skin.image, {
        id = "img_bomb_x" .. key,
        src = "src_bomb_ox",
        x = 0,
        y = 200,
        w = 1600,
        h = 200,
        divx = 8,
        cycle = 201,
    })

    local set_bomb_id = "set_bomb_" .. key
    table.insert(skin.imageset, {
        id = set_bomb_id,
        ref = judge_value[key],
        images = {
            "img_bomb_o" .. key, "img_bomb_o" .. key, "img_bomb_o" .. key, "img_bomb_o" .. key,
        },
        timer = o_timer_list[key],
    })

    table.insert(skin.destination, {
        id = set_bomb_id,
        timer = o_timer_list[key],
        loop = -1,
        dst = {
            { time = 0,   x = key * 100, y = 800, w = 100, h = 100, a = 0 },
            { time = 200, a = 255 },
            { time = 400, a = 0 },
        }
    })
end

log(serialize_value(skin))

return skin
