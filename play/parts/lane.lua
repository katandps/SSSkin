local append_all = require("utils/append_all")
local geometry = require("play/geometry").build()

local function load(skin)
    append_all(skin.destination, {
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
