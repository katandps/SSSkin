local merge_all = require("utils/merge_all")
local append_all = require("utils/append_all")

local width = 14
local height = 33
local divy = 1
local natural = { src = "src_number_nirmala_ui_bold", divx = 10, divy = divy, w = width * 10, h = height }
local integer = { src = "src_number_nirmala_ui_bold", divx = 24, divy = divy, w = width * 24, h = height }

local function white(t)
    return merge_all(merge_all(t, natural), { x = 0, y = 0, })
end

local function white_integer(t)
    return merge_all(merge_all(t, integer), { x = 0, y = 0, })
end

local function green(t)
    return merge_all(merge_all(t, natural), { x = 0, y = height, })
end

local function yellow(t)
    return merge_all(merge_all(t, natural), { x = 0, y = height * 2, })
end

--- プラスが青 マイナスが赤のimageを取得
local function plus_minus(t)
    return merge_all(merge_all(t, integer), { x = 0, y = height * 3, })
end

--- マイナスが青 プラスが赤のimageを取得
local function minus_plus(t)
    return merge_all(merge_all(t, integer), { x = 0, y = height * 4, })
end

local function load(skin)
    append_all(skin.source, { { id = "src_number_nirmala_ui_bold", path = "common/digits/nirmala_ui_bold.png" } })
end

--- 数字1個分の画像をimageにして取得
local function white_image(skin, i)
    append_all(skin.image, { {
        id = "nirmala_ui_bold_white_" .. i,
        src = "src_number_nirmala_ui_bold",
        x = i * width,
        y = 0,
        w = width,
        h = height,
    } })
end

local function white_pick(i)
    return "nirmala_ui_bold_white_" .. i
end

return {
    load = load,
    white = white,
    white_integer = white_integer,
    green = green,
    yellow = yellow,
    plus_minus = plus_minus,
    minus_plus = minus_plus,
    width = width,
    height = height,
    white_image = white_image,
    white_pick = white_pick,
}
