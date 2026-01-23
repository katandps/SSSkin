local geometry = require("play/geometry").build(27)

local function load(skin)
    table.insert(skin.destination, {
        id = -111,
        offset = 3,
        dst = {
            { x = geometry.lane_left_margin - geometry.lane_margin, y = geometry.lane_under_margin - geometry.lane_margin, w = geometry.lane_width + geometry.lane_margin * 2, h = geometry.lane_height + geometry.lane_margin * 2, r = 0, g = 0, b = 0 },
        }
    })
end
return { load = load }
