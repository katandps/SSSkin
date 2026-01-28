local merge_recursive = require("utils/merge_recursive")
local append_all = require("utils/append_all")

local width = 30
local height = 40
local divy = 1
local natural = { src = "src_anticyclone_bold", divx = 10, divy = divy, w = width * 10, h = height }

local function white(t)
    return merge_recursive(merge_recursive({ x = 0, y = 0, }, natural), t)
end
local function white0(t)
    return merge_recursive(merge_recursive({ x = 0, y = 0, divx = 11, w = width * 11 }, natural), t)
end

local function load(skin)
    append_all(skin.source, { { id = "src_anticyclone_bold", path = "common/digits/anticyclone_bold.png" } })
end

--- 数字1個分の画像をimageにして取得
local function white_image(skin, i)
    append_all(skin.image, { {
        id = "anticyclone_bold_white_" .. i,
        src = "src_anticyclone_bold",
        x = i * width,
        y = 0,
        w = width,
        h = height,
    } })
end

local function white_pick(i)
    return "anticyclone_bold_white_" .. i
end

return {
    load = load,
    white = white,
    white0 = white0,
    width = width,
    height = height,
    white_image = white_image,
    white_pick = white_pick
}
