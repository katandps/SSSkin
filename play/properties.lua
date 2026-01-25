--- skin_configから得られる情報を他のコンポーネントで使える形式にして提供する
--- skin_config.optionはここでしか読み込まない

-- プロパティ用定数
local PROPERTY = {
    -- 27インチモニターで43インチモニターと同等のサイズ
    SIZE_27INCH = 920,
    -- 43インチモニターでちょうどよいサイズ
    SIZE_43INCH = 921,
    -- 1Pサイド
    SIDE_1P = 930,
    -- 2Pサイド
    SIDE_2P = 931,
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

local property = {
    {
        name = "Display Size",
        item = {
            { name = "27inch", op = PROPERTY.SIZE_27INCH },
            { name = "43inch(未実装)", op = PROPERTY.SIZE_43INCH }
        }
    },
    {
        name = "Player Side",
        item = {
            { name = "1P", op = PROPERTY.SIDE_1P },
            { name = "2P", op = PROPERTY.SIDE_2P }
        }
    }
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
    player_side =
        player_side
}
