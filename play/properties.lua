--- skin_configから得られる情報を他のコンポーネントで使える形式にして提供する
--- skin_config.optionはここでしか読み込まない

-- プロパティ用定数
local PROPERTY = {
    -- 設定画面用ダミー
    DUMMY_PROPERTY = 901,

    -- 27インチモニターで43インチモニターと同等のサイズ
    SIZE_27INCH = 920,
    -- 43インチモニターでちょうどよいサイズ
    SIZE_43INCH = 921,
    -- 1Pサイド
    SIDE_1P = 930,
    -- 2Pサイド
    SIDE_2P = 931,

    --- 判定ライン：シンプル
    JUDGE_LINE_SIMPLE = 1000,
    --- 判定ライン：発光付き
    JUDGE_LINE_GLOW = 1001,
    --- 判定ライン：発光付き（タイミング）
    JUDGE_LINE_GLOW_TIMING = 1002,
}


local function display_size()
    local op = skin_config.option["Display Size"]
    if op == PROPERTY.SIZE_27INCH then
        return 27
    elseif op == PROPERTY.SIZE_43INCH then
        return 43
    else
        error("Invalid Display Size option: " .. tostring(op))
    end
end

local function player_side()
    local op = skin_config.option["Player Side"]
    if op == PROPERTY.SIDE_1P then
        return require("play/consts").PLAYER1
    elseif op == PROPERTY.SIDE_2P then
        return require("play/consts").PLAYER2
    else
        error("Invalid Player Side option: " .. tostring(op))
    end
end

local function judge_line_type()
    return skin_config.option["Judge Line Type"]
end

local property = {
    {
        name = "---全般設定---",
        item = { { name = "-", op = PROPERTY.DUMMY_PROPERTY } }
    },
    {
        name = "Display Size",
        category = "General",
        item = {
            { name = "27inch", op = PROPERTY.SIZE_27INCH },
            { name = "43inch(未実装)", op = PROPERTY.SIZE_43INCH }
        }
    },
    {
        name = "Player Side",
        category = "General",
        item = {
            { name = "1P", op = PROPERTY.SIDE_1P },
            { name = "2P", op = PROPERTY.SIDE_2P }
        }
    },
    {
        name = "---パーツ設定---",
        item = { { name = "-", op = PROPERTY.DUMMY_PROPERTY } }
    },
    {
        name = "Judge Line Type",
        category = "Custom Parts",
        item = {
            { name = "Simple",       op = PROPERTY.JUDGE_LINE_SIMPLE },
            { name = "Glow",         op = PROPERTY.JUDGE_LINE_GLOW },
            { name = "Glow(timing)", op = PROPERTY.JUDGE_LINE_GLOW_TIMING },
        }
    },
    {
        name = "---パーツ位置調整---",
        item = { { name = "-", op = PROPERTY.DUMMY_PROPERTY } }
    },
}

local filepath = {
    { name = "dummy", path = "play/resource/*.png" }
}

local offset = {
    { name = "dummy_offset", id = 40, a = true }
}

return {
    property = property,
    filepath = filepath,
    offset = offset,
    display_size = display_size,
    player_side = player_side,
    judge_line_type = judge_line_type,
    PROPERTY = PROPERTY,
}
