-- 判定ライン

local geometry = require("play/geometry").build()
local OFFSETS = require("play/consts").OFFSETS
local RESOURCE_IDS = require("play/consts").RESOURCE_IDS

local function load(skin)
    local left_margin = geometry.lane_left_margin

    local y = geometry.lane_under_margin - geometry.lane_margin
    table.insert(skin.destination, {
        id = RESOURCE_IDS.WHITE,
        offsets = { OFFSETS.OFFSET_NOTES_1P, OFFSETS.OFFSET_LIFT },
        dst = { { x = left_margin, y = y, w = geometry.lane_width, h = geometry.note_height, r = 80, g = 0, b = 0 }, }
    })
end
return { load = load }
