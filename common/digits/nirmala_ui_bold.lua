local merge_recursive = require("utils/merge_recursive")
local append_all = require("utils/append_all")

local width = 14
local height = 33
local divy = 1
local source_id = "src_number_nirmala_ui_bold"
local natural = { src = source_id, divx = 11, divy = divy, w = width * 11, h = height }
local integer = { src = source_id, divx = 24, divy = divy, w = width * 24, h = height }
local percent_x = 336
local percent_w = 24
local period_x = 360
local period_w = 14
local ms_x = 374
local ms_w = 38

local function white(t)
    return merge_recursive(merge_recursive(t, natural), { x = 0, y = 0, })
end

local function white_percent(t)
    return merge_recursive(merge_recursive(t, natural), { x = percent_x, y = 0, w = percent_w, })
end

local function white_period(t)
    return merge_recursive(merge_recursive(t, natural), { x = period_x, y = 0, w = period_w, })
end

local function white_ms(t)
    return merge_recursive(t, { src = source_id, x = ms_x, y = 0, w = ms_w, h = height })
end

local function white_integer(t)
    return merge_recursive(merge_recursive(t, integer), { x = 0, y = 0, })
end

local function green(t)
    return merge_recursive(merge_recursive(t, natural), { x = 0, y = height, })
end

local function yellow(t)
    return merge_recursive(merge_recursive(t, natural), { x = 0, y = height * 2, })
end

--- プラスが青 マイナスが赤のimageを取得
local function plus_minus(t)
    return merge_recursive(merge_recursive(t, integer), { x = 0, y = height * 3, })
end

local function blue(t)
    return merge_recursive(merge_recursive(t, natural), { x = 0, y = height * 4, })
end

local function blue_ms(t)
    return merge_recursive(t, { src = source_id, x = ms_x, y = height * 4, w = ms_w, h = height })
end

--- マイナスが青 プラスが赤のimageを取得
local function minus_plus(t)
    return merge_recursive(merge_recursive(t, integer), { x = 0, y = height * 4, })
end

local function red(t)
    return merge_recursive(merge_recursive(t, natural), { x = 0, y = height * 3, })
end

local function red_ms(t)
    return merge_recursive(t, { src = source_id, x = ms_x, y = height * 3, w = ms_w, h = height })
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
    red = red,
    red_ms = red_ms,
    blue = blue,
    blue_ms = blue_ms,
    plus_minus = plus_minus,
    minus_plus = minus_plus,
    width = width,
    height = height,
    white_image = white_image,
    white_pick = white_pick,
    white_percent = white_percent,
    white_period = white_period,
    white_ms = white_ms,
}
