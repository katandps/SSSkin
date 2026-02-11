--- 判定タイミング表示グラフ

local append_all = require("utils/append_all")

local skin = { timingvisualizer = {}, destination = {}, }

append_all(skin.timingvisualizer, {
    {
        id = "timing_visualizer",
        width = 481,
        judgeWidthMillis = 280,
        transparent = 1,
    }
})

append_all(skin.destination, {
    {
        id = "timing_visualizer",
        dst = { { x = 100, y = 140, w = 481, h = 20, a = 128 } }
    }
})

return skin
