local append_all = require("utils/append_all")
local geometry = require("play/geometry").build()

local function load(skin)
    skin.bga = { id = "bga" }
    append_all(skin.destination, {
        { id = -111,  dst = { { x = geometry.bga_area_x, y = 680, w = 480, h = 270, r = 0, g = 0, b = 0, a = 255 } } },
        { id = "bga", dst = { { x = geometry.bga_area_x, y = 680, w = 480, h = 270, a = 255 }, stretch = 1, } },
    })
end
return { load = load }
