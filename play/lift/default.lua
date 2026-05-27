local geometry = require("play/geometry").build()
local append_all = require("utils/append_all")
local load = require("utils/load")
local NUMBERS = require("play/consts").NUMBERS
local OFFSETS = require("play/consts").OFFSETS
local OPTIONS = require("play/consts").OPTIONS
local nirmala_ui_bold = require("common/digits/nirmala_ui_bold")
local main_state = require("main_state")

--- モニタサイズが変わっても正しく表示されるようにリフトの値を再計算する
local function calc_liftcover_value()
    local lift = main_state.number(NUMBERS.NUMBER_LIFT)
    local lane_height = geometry.lane_height * lift -- pixel換算
    return (lane_height / geometry.lane_all_height)
end

local skin = { source = {}, liftCover = {}, value = {}, destination = {} }
load(skin, nirmala_ui_bold.skin, "font")

append_all(skin.source, { { id = "src_lift_cover", path = "play/lift/cover.bmp" } })

table.insert(skin.liftCover,
    { id = "liftcover", src = "src_lift_cover", x = 0, y = 0, w = -1, h = -1, disapearLine = geometry.lane_under_margin }
)

append_all(skin.value, {
    nirmala_ui_bold.white({
        id = "num_liftcover",
        digit = 4,
        value = calc_liftcover_value,
    }),
})


append_all(skin.destination, {
    {
        id = "liftcover",
        dst = {
            { x = geometry.lane_left_margin, y = geometry.lane_under_margin - geometry.lane_height, w = geometry.lane_width, h = geometry.lane_height },
        }
    },
    {
        id = "num_liftcover",
        op = { OPTIONS.OPTION_LANECOVER1_CHANGING },
        offset = { OFFSETS.OFFSET_NOTES_1P, OFFSETS.OFFSET_LIFT },
        dst = {
            { x = geometry.lane_left_margin + geometry.lane_width * 0.3, y = geometry.lane_under_margin, w = nirmala_ui_bold.width, h = nirmala_ui_bold.height },
        }
    },
})
return skin
