local append_all = require("utils/append_all")
local geometry = require("play/geometry").build()

local function load(skin)
    append_all(skin.destination, {
        {
            id = -111,
            offset = 3,
            dst = {
                { x = geometry.lane_left_margin - geometry.lane_margin, y = geometry.lane_under_margin - geometry.lane_margin, w = geometry.lane_width + geometry.lane_margin * 2, h = geometry.lane_height + geometry.lane_margin * 2, r = 16, g = 16, b = 16 },
            }
        },
        {
            id = -111,
            offset = 3,
            dst = {
                { x = geometry.lane_left_margin, y = geometry.lane_under_margin, w = geometry.lane_width, h = geometry.lane_height, r = 0, g = 0, b = 0 },
            }
        },
    })
end
return { load = load }
