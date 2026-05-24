local append_all = require("utils/append_all")
local geometry = require("play/geometry").build()
local RESOURCE_IDS = require("play/consts").RESOURCE_IDS

local skin = { destination = {} }
append_all(skin.destination, {
    {
        id = RESOURCE_IDS.WHITE,
        dst = {
            { x = geometry.lane_left_margin, y = geometry.lane_under_margin, w = geometry.lane_width, h = geometry.lane_height, r = 0, g = 0, b = 0 },
        }
    },
})
return skin
