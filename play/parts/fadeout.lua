local header = require("play/header")
local timers = require("play/consts").timers

local function load(skin)
    table.insert(skin.destination, {
        id = -110,
        timer = timers.TIMER_FADEOUT,
        loop = -1,
        dst = {
            { time = 0,   x = 0,  y = 0, w = header.w, h = header.h, a = 0 },
            { time = 500, a = 255 }
        }
    })
end
return { load = load }
