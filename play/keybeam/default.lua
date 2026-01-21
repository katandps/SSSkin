local append_all = require("utils/append_all")
local geometry = require("play/geometry").build(27)
local timers = require("play/consts").timers

local h = 564
local kind = { "kb_w", "kb_b", "kb_w", "kb_b", "kb_w", "kb_b", "kb_w", "kb_s" }
local width = { geometry.lane_white_key_width, geometry.lane_black_key_width, geometry.lane_white_key_width,
    geometry.lane_black_key_width, geometry.lane_white_key_width, geometry.lane_black_key_width,
    geometry.lane_white_key_width, geometry.lane_scratch_width
}
local timer_ref = {
    timers.TIMER_KEYON_1P_KEY1,
    timers.TIMER_KEYON_1P_KEY2,
    timers.TIMER_KEYON_1P_KEY3,
    timers.TIMER_KEYON_1P_KEY4,
    timers.TIMER_KEYON_1P_KEY5,
    timers.TIMER_KEYON_1P_KEY6,
    timers.TIMER_KEYON_1P_KEY7,
    timers.TIMER_KEYON_1P_SCRATCH
}
local lane_x_positions = geometry.lane_x_positions

local function load(skin)
    table.insert(skin.source, { id = "src_keybeam", path = "play/keybeam/default.png" })

    append_all(skin.image, {
        { id = "kb_s", src = "src_keybeam", x = 0,   y = 0, w = 108, h = h }, -- keybeam scratch
        { id = "kb_w", src = "src_keybeam", x = 108, y = 0, w = 60,  h = h }, -- keybeam white
        { id = "kb_b", src = "src_keybeam", x = 168, y = 0, w = 48,  h = h }, -- keybeam black
    })

    table.insert(skin.destination, {
        id = "kb_s",
        timer = timer_ref[8],
        dst = {
            { x = geometry.lane_left_margin + lane_x_positions[8], y = geometry.lane_under_margin, w = geometry.lane_scratch_width, h = h },
        }
    })

    for i = 1, 7 do
        table.insert(skin.destination, {
            id = kind[i],
            offset = 3,
            timer = timer_ref[i],
            blend = 1,
            dst = {
                { x = geometry.lane_left_margin + lane_x_positions[i], y = geometry.lane_under_margin, w = width[i], h = h }
            }
        })
    end
end

return { load = load }
