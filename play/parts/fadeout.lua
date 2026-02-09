--- 画面終了演出

local header = require("play/header")
local TIMERS = require("play/consts").TIMERS

local skin = { destination = {} }
-- 手動で終了
table.insert(skin.destination, {
    id = -110,
    timer = TIMERS.TIMER_FADEOUT,
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
    timer = TIMERS.TIMER_FAILED,
    loop = 500,
    dst = {
        { time = 0,   x = 0,   y = 0, w = header.w, h = header.h, r = 128, g = 0, b = 0, a = 0 },
        { time = 250, r = 128, g = 0, b = 0,        a = 128 },
        { time = 500, r = 128, g = 0, b = 0,        a = 255 }
    }
})
return skin
