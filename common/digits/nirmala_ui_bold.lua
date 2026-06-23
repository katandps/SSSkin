local merge_recursive = require("utils/merge_recursive")
local append_all = require("utils/append_all")

local width = 14
local mini_width = 9
local height = 33
local mini_height = 25
local divy = 1
local source_id = "src_number_nirmala_ui_bold"
local natural = { src = source_id, divx = 11, divy = divy, w = width * 11, h = height }
local integer = { src = source_id, divx = 24, divy = divy, w = width * 24, h = height }
local mini = { src = source_id, divx = 10, divy = divy, w = mini_width * 10, h = mini_height }
local percent_x = 336
local percent_w = 24
local period_x = 360
local period_w = 14
local ms_x = 374
local ms_w = 38
local colon_x = 412
local colon_w = 14
local slash_x = 426
local slash_w = 14

local function white(t)
    return merge_recursive(merge_recursive(t, natural), { x = 0, y = 0, })
end

local function white_percent(t)
    return merge_recursive(t, { src = source_id, x = percent_x, y = 0, w = percent_w, h = height })
end

local function white_mini(t)
    return merge_recursive(merge_recursive(t, mini), { x = 0, y = height * 5, })
end

local function white_period(t)
    return merge_recursive(t, { src = source_id, x = period_x, y = 0, w = period_w, h = height })
end

local function white_ms(t)
    return merge_recursive(t, { src = source_id, x = ms_x, y = 0, w = ms_w, h = height })
end

local function white_colon(t)
    return merge_recursive(t, { src = source_id, x = colon_x, y = 0, w = colon_w, h = height })
end

local function white_slash(t)
    return merge_recursive(t, { src = source_id, x = slash_x, y = 0, w = slash_w, h = height }) -- todo fix
end

local function white_integer(t)
    return merge_recursive(merge_recursive(t, integer), { x = 0, y = 0, })
end

local function green(t)
    return merge_recursive(merge_recursive(t, natural), { x = 0, y = height, })
end

local function green_percent(t)
    return merge_recursive(t, { src = source_id, x = percent_x, y = height, w = percent_w, h = height })
end

local function yellow(t)
    return merge_recursive(merge_recursive(t, natural), { x = 0, y = height * 2, })
end

local function yellow_period(t)
    return merge_recursive(t, { src = source_id, x = period_x, y = height * 2, w = period_w, h = height })
end

local function yellow_percent(t)
    return merge_recursive(t, { src = source_id, x = percent_x, y = height * 2, w = percent_w, h = height })
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

local skin = { source = {} }
append_all(skin.source, { { id = "src_number_nirmala_ui_bold", path = "common/digits/nirmala_ui_bold.png" } })

return {
    skin = skin,
    white = white,
    white_integer = white_integer,
    white_mini = white_mini,
    green = green,
    green_percent = green_percent,
    yellow = yellow,
    yellow_period = yellow_period,
    yellow_percent = yellow_percent,
    red = red,
    red_ms = red_ms,
    blue = blue,
    blue_ms = blue_ms,
    plus_minus = plus_minus,
    minus_plus = minus_plus,
    width = width,
    height = height,
    mini_width = mini_width,
    mini_height = mini_height,
    white_percent = white_percent,
    white_period = white_period,
    white_ms = white_ms,
    white_colon = white_colon,
    white_slash = white_slash,

    percent_w = percent_w,
}
