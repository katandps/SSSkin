local append_all = require("utils/append_all")

local function load(skin)
    skin.judgegraph = {
        { id = "judgegraph", noGap = 0, orderReverse = 1, type = 2, backTexOff = 0 },
    }
    skin.bpmgraph = { { id = "bpmgraph" } }

    local x, y, w, h = 1400, 100, 400, 150
    append_all(skin.destination, {
        {
            id = "judgegraph",
            dst = {
                { time = 0, x = x, y = y, w = w, h = h },
            }
        },
        {
            id = "bpmgraph",
            dst = {
                { time = 0, x = x, y = y, w = w, h = h }
            }
        },
    })
end

return { load = load }
