local merge_all = require("utils.merge_all")
local append_all = require("utils/append_all")

local width = 14
local height = 33
local function white(t)
    return merge_all(t, { src = "src_number_nirmala_ui_bold", x = 0, y = 0, w = width * 10, h = height })
end

local function green(t)
    return merge_all(t, { src = "src_number_nirmala_ui_bold", x = 0, y = height, w = width * 10, h = height })
end

local function load(skin)
    append_all(skin.source, { { id = "src_number_nirmala_ui_bold", path = "common/digits/nirmala_ui_bold.png" } })
end

return { load = load, white = white, green = green, width = width, height = height }
