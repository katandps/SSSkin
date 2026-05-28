local OFFSETS = require("play/consts").OFFSETS
local geometry = require("play/geometry").build()

return {
    offsets = { OFFSETS.OFFSET_NOTES_1P, OFFSETS.OFFSET_LIFT },
    y_position = geometry.judge_line_y,
    NO_LOOP = -1,
}
