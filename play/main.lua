--- スキンのメイン部分
--- 各パーツを読み込む

local load = require("utils/load")

-- skin initialize
local skin = {
    hiddenCover = {},
}

load(skin, require("play/header"), "header")

-- 記述順に描画される
-- background
load(skin, require("play/parts/background"), "background")

-- play area
load(skin, require("play/parts/lane"), "lane")
load(skin, require("play/keybeam/default"), "keybeam")
load(skin, require("play/note/default"), "note")
load(skin, require("play/parts/lane_frame"), "lane_frame")
load(skin, require("play/parts/judgeline/load"), "judgeline")
load(skin, require("play/lift/default"), "lift")
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
load(skin, require("play/parts/timing_visualizer"), "timing_visualizer")
load(skin, require("play/parts/judge_timing"), "judge_timing")
load(skin, require("play/parts/bomb"), "bomb")

load(skin, require("play/parts/loading"), "loading")

-- finish effect
load(skin, require("play/parts/finish/default"), "finish")

-- overlays
load(skin, require("play/parts/fadeout"), "fadeout")

return skin
