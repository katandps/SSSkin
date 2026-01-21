local function lane_x_positions(display_size)
    local ds = display_size
    return {
        0,
        ds.lane_white_key_width + ds.lane_between_margin,
        ds.lane_white_key_width + ds.lane_black_key_width + ds.lane_between_margin * 2,
        ds.lane_white_key_width * 2 + ds.lane_black_key_width + ds.lane_between_margin * 3,
        ds.lane_white_key_width * 2 + ds.lane_black_key_width * 2 + ds.lane_between_margin * 4,
        ds.lane_white_key_width * 3 + ds.lane_black_key_width * 2 + ds.lane_between_margin * 5,
        ds.lane_white_key_width * 3 + ds.lane_black_key_width * 3 + ds.lane_between_margin * 6,
        ds.lane_white_key_width * 4 + ds.lane_black_key_width * 3 + ds.lane_between_margin * 7,
    }
end
local function lane_width(display_size)
    return display_size.lane_white_key_width * 4
        + display_size.lane_black_key_width * 3 +
        display_size.lane_scratch_width +
        display_size.lane_between_margin * 7
end

local inch_27 = {              -- 43インチ比率から1.6倍
    lane_white_key_width = 83, -- 83.2
    lane_black_key_width = 64,
    lane_between_margin = 3,   -- 3.2
    lane_scratch_width = 144,
    lane_height = 927,         -- 1157.8 FULL HDで表示できない 白数字の表示などで補正する
    note_height = 24,
    lane_under_margin = 153,
    lane_left_margin = 615
}

local inch_43 = {
    lane_white_key_width = 52, -- 83.2
    lane_black_key_width = 40,
    lane_between_margin = 2,
    lane_scratch_width = 90,
    lane_height = 723,
    note_height = 15,
    lane_under_margin = 357,
    lane_left_margin = 1200,
}

local function build(display_size_inch)
    local display_size = {}
    if display_size_inch == 27 then
        display_size = inch_27
    elseif display_size_inch == 43 then
        display_size = inch_43
    end
    return {
        inch_27 = inch_27,
        inch_43 = inch_43,
        lane_white_key_width = display_size.lane_white_key_width,
        lane_black_key_width = display_size.lane_black_key_width,
        lane_scratch_width = display_size.lane_scratch_width,
        lane_between_margin = display_size.lane_between_margin,
        lane_height = display_size.lane_height,
        note_height = display_size.note_height,
        lane_under_margin = display_size.lane_under_margin,
        lane_left_margin = display_size.lane_left_margin,

        lane_x_positions = lane_x_positions(display_size),
        lane_width = lane_width(display_size),
    }
end

return { build = build }
