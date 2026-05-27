--- 読み込み中表示
local append_all       = require("utils/append_all")
local BARGRAPHS        = require("play/consts").BARGRAPHS
local log              = require("utils/log")

local geometry         = require("play/geometry").build()
local OFFSETS          = require("play/consts").OFFSETS
local OPTIONS          = require("play/consts").OPTIONS
local JUDGELINE_CONSTS = require("play/parts/judgeline/consts")

local left_margin      = geometry.lane_left_margin
local skin             = { source = {}, graph = {}, destination = {} }

table.insert(skin.source, { id = "src_loading", path = "common/white_1dot.bmp" })

table.insert(skin.graph,
    {
        id = "graph-load-progress",
        src = "src_loading",
        x = 0,
        y = 0,
        w = 1,
        h = 1,
        angle = 0,
        type = BARGRAPHS.BARGRAPH_LOAD_PROGRESS
    })
append_all(skin.destination, {
    {
        id = "graph-load-progress",
        op = { OPTIONS.OPTION_NOW_LOADING },
        offsets = JUDGELINE_CONSTS.offsets,
        dst = { { x = left_margin, y = JUDGELINE_CONSTS.y_position, w = geometry.lane_width, h = geometry.note_height, r = 64, g = 64, b = 192 }, }
    },
})

log("Loading skin parts...")


return skin
