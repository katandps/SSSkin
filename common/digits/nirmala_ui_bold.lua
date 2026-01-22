local merge_all = require("utils.merge_all")
local append_all = require("utils/append_all")

local width = 14
local height = 33
local divx = 24
local divy = 1
local common = { src = "src_number_nirmala_ui_bold", divx = divx, divy = divy, w = width * divx, h = height }

local function white(t)
    return merge_all(merge_all(t, common), { x = 0, y = 0, })
end

local function green(t)
    return merge_all(merge_all(t, common), { x = 0, y = height, })
end

local function yellow(t)
    return merge_all(merge_all(t, common), { x = 0, y = height * 2, })
end

local function load(skin)
    append_all(skin.source, { { id = "src_number_nirmala_ui_bold", path = "common/digits/nirmala_ui_bold.png" } })
end

return { load = load, white = white, green = green, yellow = yellow, width = width, height = height }
