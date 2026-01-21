local geometry = require("play/geometry").build(27)

local margin = 20

local function load(skin)
    table.insert(skin.destination, {
        id = -111,
        offset = 3,
        dst = {
            { x = geometry.lane_left_margin - margin, y = geometry.lane_under_margin - margin, w = geometry.lane_width + margin * 2, h = geometry.lane_height + margin * 2, r = 0, g = 0, b = 0 },
        }
    })
end
return { load = load }
