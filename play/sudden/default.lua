local geometry = require("play/geometry").build(27)
local append_all = require("utils/append_all")
local refs = require("play/consts").refs
local options = require("play/consts").options
local offsets = require("play/consts").offsets
local nirmala_ui_bold = require("common/digits/nirmala_ui_bold")

local function load(skin)
    nirmala_ui_bold.load(skin)

    append_all(skin.source, { { id = "src_lanecover", path = "play/sudden/cover.bmp" } })

    table.insert(skin.slider,
        { id = "lanecover", src = "src_lanecover", x = 0, y = 0, w = -1, h = -1, angle = 2, range = geometry.lane_height, type = 4 }
    )

    append_all(skin.value, {
        nirmala_ui_bold.white({
            id = "num_lanecover",
            digit = 4,
            ref = refs.NUMBER_LANECOVER1
        }),
        nirmala_ui_bold.green({
            id = "num_green_number",
            digit = 4,
            ref = refs.NUMBER_DURATION_GREEN
        }),
    })


    append_all(skin.destination, {
        {
            id = "lanecover",
            offset = { offsets.OFFSET_LIFT },
            dst = {
                { x = geometry.lane_left_margin, y = geometry.lane_under_margin + geometry.lane_height, w = geometry.lane_width, h = geometry.lane_height },
            }
        },
        {
            id = "num_lanecover",
            op = { options.OPTION_LANECOVER1_CHANGING },
            dst = {
                { x = geometry.lane_left_margin + geometry.lane_width * 0.3, y = 1044, w = nirmala_ui_bold.width, h = nirmala_ui_bold.height },
            }
        },
        {
            id = "num_green_number",
            op = { options.OPTION_LANECOVER1_CHANGING },
            dst = {
                { x = geometry.lane_left_margin + geometry.lane_width * 0.6, y = 1044, w = nirmala_ui_bold.width, h = nirmala_ui_bold.height },
            }
        },
    })
end
return { load = load }
