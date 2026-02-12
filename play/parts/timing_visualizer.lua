--- 判定タイミング表示グラフ

local append_all = require("utils/append_all")
local geometry = require("play/geometry").build()

local skin = { timingvisualizer = {}, destination = {}, }

append_all(skin.timingvisualizer, {
    {
        id = "timing_visualizer",
        width = geometry.timing_visualizer_w,
        judgeWidthMillis = 280,
        transparent = 1,
    }
})

append_all(skin.destination, {
    {
        id = "timing_visualizer",
        dst = { { x = geometry.timing_visualizer_x, y = geometry.timing_visualizer_y, w = geometry.timing_visualizer_w, h = geometry.timing_visualizer_h, a = 128 } }
    }
})

return skin
