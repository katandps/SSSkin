local geometry = require("play/geometry").build(27)
local offsets = require("play/consts").offsets

local function load(skin)
    table.insert(skin.destination, {
        id = -111,
        offset = offsets.OFFSET_LIFT,
        dst = {
            { x = geometry.lane_left_margin, y = geometry.lane_under_margin - geometry.note_height / 2, w = geometry.lane_width, h = geometry.note_height, r = 80, g = 0, b = 0 },
        }
    })
end
return { load = load }
