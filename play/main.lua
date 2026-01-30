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
        { id = "genshin-gothic-heavy", path = "common/font/GenShinGothic-Heavy.ttf" },
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
    skin.judgegraph = {}
    skin.bpmgraph = {}
    skin.timingvisualizer = { { id = "timing" } }

    -- 記述順に描画される
    require("play/background/default").load(skin)
    require("play/parts/lane").load(skin)

    require("play/keybeam/default").load(skin)
    require("play/note/default").load(skin)
    require("play/parts/judgeline/load").load(skin)
    require("play/sudden/default").load(skin)
    require("play/parts/judge").load(skin)
    require("play/judge/judge_timing").load(skin)
    require("play/judge/score_ghost").load(skin)
    require("play/parts/bpm").load(skin)
    require("play/parts/gauge_value").load(skin)
    require("play/parts/score_panel").load(skin)
    require("play/parts/judge_detail").load(skin)
    require("play/parts/title").load(skin)
    require("play/parts/bga").load(skin)
    require("play/parts/judge_graph").load(skin)
    require("play/parts/finish/default").load(skin)
    require("play/parts/fadeout").load(skin)

    return skin
end

return main
