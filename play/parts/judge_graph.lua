-- 判定状況を表示するグラフ
local append_all = require("utils/append_all")
local geometry = require("play/geometry").build()

local function load(skin)
    skin.judgegraph = {
        { id = "judgegraph", noGap = 0, orderReverse = 1, type = 2, backTexOff = 0 },
    }
    skin.bpmgraph = { { id = "bpmgraph" } }

    append_all(skin.destination, {
        {
            id = "judgegraph",
            dst = {
                { time = 0, x = geometry.judge_graph_x, y = geometry.judge_graph_y, w = geometry.judge_graph_w, h = geometry.judge_graph_h },
            }
        },
        {
            id = "bpmgraph",
            dst = {
                { time = 0, x = geometry.judge_graph_x, y = geometry.judge_graph_y, w = geometry.judge_graph_w, h = geometry.judge_graph_h }
            }
        },
    })
end

return { load = load }
