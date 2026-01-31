--!strict
--- propertyとconstsから設定値を取得して座標の設定値を構築する
local property = require("play/properties")
local serialize_value = require("utils/serialize_value").serialize_value

local INCH_27 = {              -- 43インチ比率から1.6倍
    lane_white_key_width = 83, -- 83.2
    lane_black_key_width = 64,
    lane_between_margin = 3,   -- 3.2
    lane_scratch_width = 144,
    lane_all_height = 1158,
    lane_height = 927, -- 1157.8 FULL HDで表示できない 白数字の表示などで補正する
    note_height = 24,
    lane_under_margin = 153,
    lane_left_margin = 615,
    judge_default_y = 320,
    judge_detail_default_y = 352,

    score_panel_x = 200,
    score_panel_y = 400,
}

local INCH_43 = {
    lane_white_key_width = 52,
    lane_black_key_width = 40,
    lane_between_margin = 2,
    lane_scratch_width = 90,
    lane_all_height = 723,
    lane_height = 723,
    note_height = 15,
    lane_under_margin = 357,
    lane_left_margin = 1200,
    judge_default_y = 200,
    judge_detail_default_y = 220,

    score_panel_x = 200,
    score_panel_y = 400,
}


local function lane_width(display_size)
    return display_size.lane_white_key_width * 4
        + display_size.lane_black_key_width * 3 +
        display_size.lane_scratch_width +
        display_size.lane_between_margin * 7
end

local function lane_x_positions(display, player_side)
    local type = player_side.SCRATCH
    local w = display.lane_white_key_width
    local b = display.lane_black_key_width
    local s = display.lane_scratch_width
    local m = display.lane_between_margin
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
        error("Invalid player side type: " .. serialize_value(player_side))
    end
end

local function build_display()
    local display = property.display()
    if display.size == 27 then
        return INCH_27
    elseif display.size == 43 then
        return INCH_43
    else
        error("Invalid display: " .. serialize_value(display))
    end
end

local function build()
    local display = build_display()
    local player_side = property.player_side()

    return {
        inch_27 = INCH_27,
        inch_43 = INCH_43,
        lane_white_key_width = display.lane_white_key_width,
        lane_black_key_width = display.lane_black_key_width,
        lane_scratch_width = display.lane_scratch_width,
        lane_between_margin = display.lane_between_margin,
        lane_all_height = display.lane_all_height, -- 表示できない分も含めたレーン長
        lane_height = display.lane_height,         -- 実際に表示されるレーン長
        note_height = display.note_height,
        lane_under_margin = display.lane_under_margin,
        lane_left_margin = display.lane_left_margin,
        lane_x_center = display.lane_left_margin + lane_width(display) / 2,
        lane_margin = 20,
        judge_default_y = display.judge_default_y,               -- デフォルト判定表示位置 判定ラインから上辺までの高さ
        judge_detail_default_y = display.judge_detail_default_y, -- 詳細判定表示位置 判定ラインから上辺までの高さ

        lane_x_positions = lane_x_positions(display, player_side),
        lane_width = lane_width(display),

        score_panel_x = display.score_panel_x,
        score_panel_y = display.score_panel_y,
        score_panel_w = 200,
        score_panel_h = 200,
    }
end

return { build = build }
