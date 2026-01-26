-- 発光付き判定ライン

local geometry = require("play/geometry").build()
local OFFSETS = require("play/consts").OFFSETS
local append_all = require("utils/append_all")
local RESOURCE_IDS = require("play/consts").RESOURCE_IDS
local TIMERS = require("play/consts").TIMERS

local function load(skin)
    local left_margin = geometry.lane_left_margin
    local lane_x_positions = geometry.lane_x_positions

    local y = geometry.lane_under_margin - geometry.lane_margin
    table.insert(skin.destination, {
        id = RESOURCE_IDS.WHITE,
        offset = OFFSETS.OFFSET_LIFT,
        dst = { { x = left_margin, y = y, w = geometry.lane_width, h = geometry.note_height, r = 80, g = 0, b = 0 }, }
    })


    local function animation(position, width)
        return {
            { time = 0,   x = geometry.lane_left_margin + position, y = y, w = width, h = geometry.note_height, a = 255 },
            { time = 250, x = geometry.lane_left_margin + position, y = y, w = width, h = geometry.note_height, a = 128 },
            { time = 500, x = geometry.lane_left_margin + position, y = y, w = width, h = geometry.note_height, a = 0 },
        }
    end

    local function dst(timer, position, width)
        return {
            id = RESOURCE_IDS.WHITE,
            offsets = { OFFSETS.OFFSET_LIFT },
            loop = -1,
            timer = timer,
            dst = animation(position, width),
        }
    end

    append_all(skin.destination, {
        -- normal
        dst(TIMERS.TIMER_BOMB_1P_KEY1, lane_x_positions[1], geometry.lane_white_key_width),
        dst(TIMERS.TIMER_BOMB_1P_KEY2, lane_x_positions[2], geometry.lane_black_key_width),
        dst(TIMERS.TIMER_BOMB_1P_KEY3, lane_x_positions[3], geometry.lane_white_key_width),
        dst(TIMERS.TIMER_BOMB_1P_KEY4, lane_x_positions[4], geometry.lane_black_key_width),
        dst(TIMERS.TIMER_BOMB_1P_KEY5, lane_x_positions[5], geometry.lane_white_key_width),
        dst(TIMERS.TIMER_BOMB_1P_KEY6, lane_x_positions[6], geometry.lane_black_key_width),
        dst(TIMERS.TIMER_BOMB_1P_KEY7, lane_x_positions[7], geometry.lane_white_key_width),
        dst(TIMERS.TIMER_BOMB_1P_SCRATCH, lane_x_positions[8], geometry.lane_scratch_width),
        -- -- LN
        -- { id = resource_ids.WHITE, src = "src_bomb", x = lane_x_positions[i], y = y, w = geometry.note_width,           h = geometry.note_height, timer = lnBombTimer(i) },
        -- -- fast
        -- { id = resource_ids.WHITE, src = "src_bomb", x = lane_x_positions[i], y = y, w = geometry.note_width,           h = geometry.note_height, timer = bombTimer(i) },
        -- -- slow
        -- { id = resource_ids.WHITE, src = "src_bomb", x = lane_x_positions[i], y = y, w = geometry.note_width,           h = geometry.note_height, timer = bombTimer(i) }
    })
end
return { load = load }
