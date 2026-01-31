-- レーンの枠部分パーツ
-- これがないとjudgelineの下にノーツがはみ出していってしまう

local append_all = require("utils/append_all")
local geometry = require("play/geometry").build()

local function load(skin)
    append_all(skin.destination, {
        {
            -- Left frame
            id = -111,
            offset = 3,
            dst = {
                { x = geometry.lane_left_margin - geometry.lane_margin, y = geometry.lane_under_margin - geometry.lane_margin, w = geometry.lane_margin, h = geometry.lane_height + geometry.lane_margin, r = 16, g = 16, b = 16 },
            }
        },
        {
            -- Right frame
            id = -111,
            offset = 3,
            dst = {
                { x = geometry.lane_left_margin + geometry.lane_width, y = geometry.lane_under_margin - geometry.lane_margin, w = geometry.lane_margin, h = geometry.lane_height + geometry.lane_margin, r = 16, g = 16, b = 16 },
            }
        },
        {
            -- Bottom frame
            id = -111,
            offset = 3,
            dst = {
                { x = geometry.lane_left_margin - geometry.lane_margin, y = geometry.lane_under_margin - geometry.lane_margin, w = geometry.lane_width + geometry.lane_margin * 2, h = geometry.lane_margin, r = 16, g = 16, b = 16 },
            }
        },
    })
end
return { load = load }
