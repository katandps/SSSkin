--- スキンのメイン部分
--- 各パーツを読み込む

local load = require("utils/load")

local function main()
    -- skin initialize
    local header = require("play/header")
    local skin = {}
    load(skin, header, "header")

    skin.font = {
        { id = "genshin-gothic-heavy", path = "common/font/GenShinGothic-Heavy.ttf" },
    }
    skin.liftCover = {}
    skin.hiddenCover = {}
    skin.graph = {}
    skin.gauge = {}
    skin.timingvisualizer = { { id = "timing" } }

    -- 記述順に描画される
    -- background
    load(skin, require("play/parts/background"), "background")

    -- play area
    load(skin, require("play/parts/lane"), "lane")
    load(skin, require("play/keybeam/default"), "keybeam")
    load(skin, require("play/note/default"), "note")
    load(skin, require("play/parts/lane_frame"), "lane_frame")
    load(skin, require("play/parts/judgeline/load"), "judgeline")
    load(skin, require("play/sudden/default"), "sudden")
    load(skin, require("play/parts/judge"), "judge")
    load(skin, require("play/judge/judge_timing"), "judge_timing")
    load(skin, require("play/judge/score_ghost"), "score_ghost")

    -- panels
    load(skin, require("play/parts/bpm"), "bpm")
    load(skin, require("play/parts/gauge_value"), "gauge_value")
    load(skin, require("play/parts/score_panel"), "score_panel")
    load(skin, require("play/parts/rest_panel"), "rest_panel")
    load(skin, require("play/parts/song_info"), "song_info")
    load(skin, require("play/parts/judge_detail"), "judge_detail")
    load(skin, require("play/parts/title"), "title")
    load(skin, require("play/parts/bga"), "bga")
    load(skin, require("play/parts/judge_graph"), "judge_graph")
    load(skin, require("play/parts/clock"), "clock")

    -- finish effect
    load(skin, require("play/parts/finish/default"), "finish")

    -- overlays
    load(skin, require("play/parts/fadeout"), "fadeout")

    return skin
end

return main
