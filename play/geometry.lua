--!strict
--- propertyとconstsから設定値を取得して座標の設定値を構築する
local property = require("play/properties")
local serialize_value = require("utils/serialize_value").serialize_value

local INCH_27 = { -- 43インチ比率から1.6倍
    SIZE = 27,

    lane_white_key_width = 83, -- 83.2
    lane_black_key_width = 64,
    lane_between_margin = 3,   -- 3.2
    lane_scratch_width = 144,
    lane_all_height = 1158,
    lane_height = 927, -- 1157.8 FULL HDで表示できない 白数字の表示などで補正する
    note_height = 24,

    lane_under_margin = 153,
    judge_default_y = 320,
    judge_detail_default_y = 352,

    score_panel_x = 100,
    score_panel_y = 400,

    -- rest_panel_x = 100, -- score_panel_xと同じ
    rest_panel_y = 250,

    judge_panel_x = 1400,
    judge_panel_y = 320,

    judge_graph_x = 1400,
    judge_graph_y = 100,
    judge_graph_w = 400,
    judge_graph_h = 150,

    gauge_value_x = 1340,
    gauge_value_y = 800,
}

local INCH_43 = {
    SIZE = 43,

    lane_white_key_width = 52,
    lane_black_key_width = 40,
    lane_between_margin = 2,
    lane_scratch_width = 90,
    lane_all_height = 723,
    lane_height = 723,
    note_height = 15,
    lane_under_margin = 357,
    lane_left_margin = 1413, -- lane right margin = 75
    judge_default_y = 200,
    judge_detail_default_y = 220,

    score_panel_x = 100,
    score_panel_y = 400,

    rest_panel_y = 250,

    judge_panel_x = 810,
    judge_panel_y = 320,
    judge_graph_x = 760,
    judge_graph_y = 100,
    judge_graph_w = 400,
    judge_graph_h = 150,

    gauge_value_x = 1200,
    gauge_value_y = 900,
}

local function gauge_value_x(display, player_side)
    if display.SIZE == 27 then
        return 1340
    elseif display.SIZE == 43 then
        if player_side.SCRATCH == "LEFT" then
            return 560
        elseif player_side.SCRATCH == "RIGHT" then
            return 1200
        else
            error("Invalid player side type: " .. serialize_value(player_side))
        end
    else
        error("Invalid display: " .. serialize_value(display))
    end
end

local function bga_area_x(display, player_side)
    if display.SIZE == 27 then
        return 60
    elseif display.SIZE == 43 then
        if player_side.SCRATCH == "LEFT" then
            return 1320
        elseif player_side.SCRATCH == "RIGHT" then
            return 60
        else
            error("Invalid player side type: " .. serialize_value(player_side))
        end
    else
        error("Invalid display: " .. serialize_value(display))
    end
end

local function score_panel_x(display, player_side)
    if display.SIZE == 27 then
        return 100
    elseif display.SIZE == 43 then
        if player_side.SCRATCH == "LEFT" then
            return 1320
        elseif player_side.SCRATCH == "RIGHT" then
            return 100
        else
            error("Invalid player side type: " .. serialize_value(player_side))
        end
    else
        error("Invalid display: " .. serialize_value(display))
    end
end

local function judge_timing_x(display, player_side)
    if display.SIZE == 27 then
        return 360
    elseif display.SIZE == 43 then
        if player_side.SCRATCH == "LEFT" then
            return 1600
        elseif player_side.SCRATCH == "RIGHT" then
            return 360
        else
            error("Invalid player side type: " .. serialize_value(player_side))
        end
    else
        error("Invalid display: " .. serialize_value(display))
    end
end

local function lane_left_margin(display, player_side)
    if display.SIZE == 27 then
        return 615
    elseif display.SIZE == 43 then
        if player_side.SCRATCH == "LEFT" then
            return 75
        elseif player_side.SCRATCH == "RIGHT" then
            return 1413
        else
            error("Invalid player side type: " .. serialize_value(player_side))
        end
    else
        error("Invalid display: " .. serialize_value(display))
    end
end


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

    local lane_width = lane_width(display)
    local lane_left_margin = lane_left_margin(display, player_side)

    return {
        total_width = 1920,
        total_height = 1080,

        lane_white_key_width = display.lane_white_key_width,
        lane_black_key_width = display.lane_black_key_width,
        lane_scratch_width = display.lane_scratch_width,
        lane_between_margin = display.lane_between_margin,
        lane_all_height = display.lane_all_height, -- 表示できない分も含めたレーン長
        lane_height = display.lane_height,         -- 実際に表示されるレーン長
        note_height = display.note_height,
        lane_under_margin = display.lane_under_margin,
        lane_left_margin = lane_left_margin,
        lane_x_center = lane_left_margin + lane_width / 2,
        lane_margin = 20,
        judge_default_y = display.judge_default_y,               -- デフォルト判定表示位置 判定ラインから上辺までの高さ
        judge_detail_default_y = display.judge_detail_default_y, -- 詳細判定表示位置 判定ラインから上辺までの高さ

        judge_line_y = display.lane_under_margin,

        lane_x_positions = lane_x_positions(display, player_side),
        lane_width = lane_width,

        score_panel_x = score_panel_x(display, player_side),
        score_panel_y = display.score_panel_y,
        score_panel_w = 200,
        score_panel_h = 200,

        rest_panel_x = score_panel_x(display, player_side),
        rest_panel_y = display.rest_panel_y,
        rest_panel_w = 200,
        rest_panel_h = 100,

        bga_area_x = bga_area_x(display, player_side),

        judge_panel_x = display.judge_panel_x,
        judge_panel_y = display.judge_panel_y,
        judge_panel_w = 360,
        judge_panel_h = 300,

        judge_graph_x = display.judge_graph_x,
        judge_graph_y = display.judge_graph_y,
        judge_graph_w = display.judge_graph_w,
        judge_graph_h = display.judge_graph_h,

        timing_visualizer_x = display.judge_graph_x,
        timing_visualizer_y = display.judge_graph_y + display.judge_graph_h + 20,
        timing_visualizer_w = display.judge_graph_w,
        timing_visualizer_h = 30,

        gauge_value_x = gauge_value_x(display, player_side),
        gauge_value_y = display.gauge_value_y,
        gauge_panel_w = 160,
        gauge_panel_h = 70,

        judge_timing_x = judge_timing_x(display, player_side),
        judge_timing_y = 250,
    }
end

return { build = build }
