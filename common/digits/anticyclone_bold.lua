local merge_recursive = require("utils/merge_recursive")
local append_all = require("utils/append_all")

local width = 30
local height = 40
local divy = 1
local period_width = 15

local natural = { src = "src_anticyclone_bold", divx = 10, divy = divy, w = width * 10, h = height }

local function white(t)
    return merge_recursive(merge_recursive({ x = 0, y = 0, }, natural), t)
end
local function white0(t)
    return merge_recursive(merge_recursive({ x = 0, y = 0, divx = 11, w = width * 11 }, natural), t)
end
local function white_period(t)
    return merge_recursive(t, { src = "src_anticyclone_bold", x = width * 11, y = 0, w = period_width, h = height })
end

local skin = { source = {} }
append_all(skin.source, { { id = "src_anticyclone_bold", path = "common/digits/anticyclone_bold.png" } })

return {
    skin = skin,
    white = white,
    white0 = white0,
    white_period = white_period,
    width = width,
    height = height,
    period_width = period_width,
}
