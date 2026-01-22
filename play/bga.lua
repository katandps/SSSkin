local append_all = require("utils/append_all")

local function load(skin)
    skin.bga = { id = "bga" }
    append_all(skin.destination, {
        { id = -111,  dst = { { x = 60, y = 680, w = 480, h = 270, r = 0, g = 0, b = 0, a = 255 } } },
        { id = "bga", dst = { { x = 60, y = 680, w = 480, h = 270, a = 255 }, stretch = 1, } },
    })
end
return { load = load }
