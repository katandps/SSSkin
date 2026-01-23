local merge_all = require("utils/merge_all")
local append_all = require("utils/append_all")

local width = 30
local height = 40
local divy = 1
local natural = { src = "src_anticyclone_bold", divx = 11, divy = divy, w = width * 10, h = height }

local function white(t)
    return merge_all(merge_all(t, natural), { x = 0, y = 0, })
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
    width = width,
    height = height,
    white_image = white_image,
    white_pick = white_pick
}
