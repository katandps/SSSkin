local function main()
    -- skin initialize
    local header = require("play/header")
    local skin = {}
    for k, v in pairs(header) do
        skin[k] = v
    end

    skin.source = {}
    skin.image = {}
    skin.font = {
        { id = "vl-gothic-regular", path = "common/font/VL-Gothic-Regular.ttf" },
    }
    skin.imageset = {}
    skin.value = {}
    skin.text = {}
    skin.slider = {}
    skin.liftCover = {}
    skin.hiddenCover = {}
    skin.graph = {}
    skin.note = {}
    skin.gauge = {}
    skin.judge = {}
    skin.bga = {}
    skin.destination = {}
    skin.judgegraph = { { id = "judgegraph", type = 1, backTexOff = 1 } }
    skin.bpmgraph = { { id = "bpmgraph" } }
    skin.timingvisualizer = { { id = "timing" } }

    -- 記述順に描画される
    require("play/background/default").load(skin)
    require("play/parts/lane").load(skin)

    require("play/keybeam/default").load(skin)
    require("play/note/default").load(skin)
    require("play/parts/judgeline").load(skin)
    require("play/sudden/default").load(skin)
    require("play/judge/default").load(skin)
    require("play/judge_timing").load(skin)
    require("play/parts/bpm").load(skin)
    require("play/score_panel").load(skin)
    require("play/parts/title").load(skin)
    require("play/bga").load(skin)

    return skin
end

return main
