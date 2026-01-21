local geometry = require("play/geometry").build(27)

local function load(skin)
    table.insert(skin.destination, {
        id = -111,
        offset = 3,
        dst = {
            { x = geometry.lane_left_margin, y = geometry.lane_under_margin - geometry.note_height / 2, w = geometry.lane_width, h = geometry.note_height / 2, r = 220, g = 0, b = 0 },
        }
    })
end
return { load = load }
