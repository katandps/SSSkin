-- 判定ライン

local geometry = require("play/geometry").build()
local OFFSETS = require("play/consts").OFFSETS
local RESOURCE_IDS = require("play/consts").RESOURCE_IDS
local consts = require("play/parts/judgeline/consts")

local skin = { destination = {} }
local left_margin = geometry.lane_left_margin

table.insert(skin.destination, {
    id = RESOURCE_IDS.WHITE,
    offsets = consts.offsets,
    dst = { { x = left_margin, y = consts.y_position, w = geometry.lane_width, h = geometry.note_height, r = 80, g = 0, b = 0 }, }
})
return skin
