local header = require("play/header")
local timers = require("play/consts").timers

local function load(skin)
    -- 手動で終了
    table.insert(skin.destination, {
        id = -110,
        timer = timers.TIMER_FADEOUT,
        loop = 500,
        dst = {
            { time = 0,   x = 0,  y = 0, w = header.w, h = header.h, a = 0 },
            { time = 250, a = 128 },
            { time = 500, a = 255 }
        }
    })
    -- Failed
    table.insert(skin.destination, {
        id = -111,
        timer = timers.TIMER_FAILED,
        loop = 500,
        dst = {
            { time = 0,   x = 0,   y = 0, w = header.w, h = header.h, r = 128, g = 0, b = 0, a = 0 },
            { time = 250, r = 128, g = 0, b = 0,        a = 128 },
            { time = 500, r = 128, g = 0, b = 0,        a = 255 }
        }
    })
end
return { load = load }
