--!strict
--- propertyとconstsから設定値を取得して座標の設定値を構築する
local property = require("play/properties")

local INCH_27 = {              -- 43インチ比率から1.6倍
    lane_white_key_width = 83, -- 83.2
    lane_black_key_width = 64,
    lane_between_margin = 3,   -- 3.2
    lane_scratch_width = 144,
    lane_all_height = 1158,    -- 表示できない分も含めたレーン長
    lane_height = 927,         -- 1157.8 FULL HDで表示できない 白数字の表示などで補正する
    note_height = 24,
    lane_under_margin = 153,
    lane_left_margin = 615
}

local INCH_43 = {
    lane_white_key_width = 52, -- 83.2
    lane_black_key_width = 40,
    lane_between_margin = 2,
    lane_scratch_width = 90,
    lane_all_height = 723,
    lane_height = 723,
    note_height = 15,
    lane_under_margin = 357,
    lane_left_margin = 1200,
}


local function lane_width(display_size)
    return display_size.lane_white_key_width * 4
        + display_size.lane_black_key_width * 3 +
        display_size.lane_scratch_width +
        display_size.lane_between_margin * 7
end

local function lane_x_positions(display_size, player_side)
    local ds = display_size
    local type = player_side.SCRATCH
    local w = ds.lane_white_key_width
    local b = ds.lane_black_key_width
    local s = ds.lane_scratch_width
    local m = ds.lane_between_margin
    if type == "LEFT" then
        return {
            s + m,
            s + w + m * 2,
            s + w + b + m * 3,
            s + w * 2 + b + m * 4,
            s + w * 2 + b * 2 + m * 5,
            s + w * 3 + b * 2 + m * 6,
            s + w * 3 + b * 3 + m * 7,
            0,
        }
    elseif type == "RIGHT" then
        return {
            0,
            w + m,
            w + b + m * 2,
            w * 2 + b + m * 3,
            w * 2 + b * 2 + m * 4,
            w * 3 + b * 2 + m * 5,
            w * 3 + b * 3 + m * 6,
            w * 4 + b * 3 + m * 7,
        }
    else
        error("Invalid player side type: " .. tostring(type))
    end
end

local function build_display_size()
    local size = property.display_size()
    if size == 27 then
        return INCH_27
    elseif size == 43 then
        return INCH_43
    else
        error("Invalid display size: " .. tostring(size))
    end
end

local function build()
    local display_size = build_display_size()
    local player_side = property.player_side()

    return {
        inch_27 = INCH_27,
        inch_43 = INCH_43,
        lane_white_key_width = display_size.lane_white_key_width,
        lane_black_key_width = display_size.lane_black_key_width,
        lane_scratch_width = display_size.lane_scratch_width,
        lane_between_margin = display_size.lane_between_margin,
        lane_all_height = display_size.lane_all_height,
        lane_height = display_size.lane_height,
        note_height = display_size.note_height,
        lane_under_margin = display_size.lane_under_margin,
        lane_left_margin = display_size.lane_left_margin,
        lane_margin = 20,

        lane_x_positions = lane_x_positions(display_size, player_side),
        lane_width = lane_width(display_size),
    }
end

return { build = build }
