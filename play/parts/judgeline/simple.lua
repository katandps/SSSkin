-- 判定ライン

local geometry = require("play/geometry").build()
local offsets = require("play/consts").offsets
local resource_ids = require("play/consts").resource_ids

local function load(skin)
    local left_margin = geometry.lane_left_margin

    local y = geometry.lane_under_margin - geometry.lane_margin
    table.insert(skin.destination, {
        id = resource_ids.WHITE,
        offset = offsets.OFFSET_LIFT,
        dst = { { x = left_margin, y = y, w = geometry.lane_width, h = geometry.note_height, r = 80, g = 0, b = 0 }, }
    })
end
return { load = load }
