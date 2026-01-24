local geometry = require("play/geometry").build()
local offsets = require("play/consts").offsets
local append_all = require("utils/append_all")
local resource_ids = require("play/consts").resource_ids
local timers = require("play/consts").timers

local function load(skin)
    local left_margin = geometry.lane_left_margin
    local lane_x_positions = geometry.lane_x_positions

    local y = geometry.lane_under_margin - geometry.lane_margin
    table.insert(skin.destination, {
        id = resource_ids.WHITE,
        offset = offsets.OFFSET_LIFT,
        dst = { { x = left_margin, y = y, w = geometry.lane_width, h = geometry.note_height, r = 80, g = 0, b = 0 }, }
    })


    local function animation(position, width)
        return {
            { time = 0,   x = geometry.lane_left_margin + position, y = y, w = width, h = geometry.note_height, a = 255 },
            { time = 250, x = geometry.lane_left_margin + position, y = y, w = width, h = geometry.note_height, a = 128 },
            { time = 500, x = geometry.lane_left_margin + position, y = y, w = width, h = geometry.note_height, a = 0 },
        }
    end
    append_all(skin.destination, {
        -- normal
        {
            id = resource_ids.WHITE,
            offsets = { offsets.OFFSET_LIFT },
            loop = -1,
            timer = timers.TIMER_BOMB_1P_KEY1,
            dst = animation(lane_x_positions[1], geometry.lane_white_key_width),
        },
        {
            id = resource_ids.WHITE,
            offsets = { offsets.OFFSET_LIFT },
            loop = -1,
            timer = timers.TIMER_BOMB_1P_KEY2,
            dst = animation(lane_x_positions[2], geometry.lane_black_key_width),
        },
        {
            id = resource_ids.WHITE,
            offsets = { offsets.OFFSET_LIFT },
            loop = -1,
            timer = timers.TIMER_BOMB_1P_KEY3,
            dst = animation(lane_x_positions[3], geometry.lane_white_key_width),
        },
        {
            id = resource_ids.WHITE,
            offsets = { offsets.OFFSET_LIFT },
            loop = -1,
            timer = timers.TIMER_BOMB_1P_KEY4,
            dst = animation(lane_x_positions[4], geometry.lane_black_key_width),
        },
        {
            id = resource_ids.WHITE,
            offsets = { offsets.OFFSET_LIFT },
            loop = -1,
            timer = timers.TIMER_BOMB_1P_KEY5,
            dst = animation(lane_x_positions[5], geometry.lane_white_key_width),
        },
        {
            id = resource_ids.WHITE,
            offsets = { offsets.OFFSET_LIFT },
            loop = -1,
            timer = timers.TIMER_BOMB_1P_KEY6,
            dst = animation(lane_x_positions[6], geometry.lane_black_key_width),
        },
        {
            id = resource_ids.WHITE,
            offsets = { offsets.OFFSET_LIFT },
            loop = -1,
            timer = timers.TIMER_BOMB_1P_KEY7,
            dst = animation(lane_x_positions[7], geometry.lane_white_key_width),
        },
        {
            id = resource_ids.WHITE,
            offsets = { offsets.OFFSET_LIFT },
            loop = -1,
            timer = timers.TIMER_BOMB_1P_SCRATCH,
            dst = animation(lane_x_positions[8], geometry.lane_scratch_width),
        },
        -- -- LN
        -- { id = resource_ids.WHITE, src = "src_bomb", x = lane_x_positions[i], y = y, w = geometry.note_width,           h = geometry.note_height, timer = lnBombTimer(i) },
        -- -- fast
        -- { id = resource_ids.WHITE, src = "src_bomb", x = lane_x_positions[i], y = y, w = geometry.note_width,           h = geometry.note_height, timer = bombTimer(i) },
        -- -- slow
        -- { id = resource_ids.WHITE, src = "src_bomb", x = lane_x_positions[i], y = y, w = geometry.note_width,           h = geometry.note_height, timer = bombTimer(i) }
    })
end
return { load = load }
