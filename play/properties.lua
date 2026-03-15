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

    -- UIフォント
    UI_FONT_NOTONOTO_CONSOLE_HS_MEDIUM = 950,
    UI_FONT_GENSHIN_GOTHIC_HEAVY = 951,

    --- 判定ライン：シンプル
    JUDGE_LINE_SIMPLE = 1000,
    --- 判定ライン：発光付き
    JUDGE_LINE_GLOW = 1001,
    --- 判定ライン：発光付き（タイミング）
    JUDGE_LINE_GLOW_TIMING = 1002,

    --- ノートタイプ：デフォルト
    NOTE_TYPE_DEFAULT = 1100,
    --- ノートタイプ：オーシャン
    NOTE_TYPE_OCEAN = 1101,
    --- ノートタイプ：トロピカル
    NOTE_TYPE_TROPICAL = 1102,
}


local function display()
    local op = skin_config.option["Display Size"]
    if op == PROPERTY.SIZE_27INCH then
        return require("play/consts").DISPLAY.INCH_27
    elseif op == PROPERTY.SIZE_43INCH then
        return require("play/consts").DISPLAY.INCH_43
    else
        error("Invalid Display Size option: " .. tostring(op))
    end
end

local function player_side()
    local op = skin_config.option["Player Side"]
    if op == PROPERTY.SIDE_1P then
        return require("play/consts").PLAYERS.PLAYER1
    elseif op == PROPERTY.SIDE_2P then
        return require("play/consts").PLAYERS.PLAYER2
    else
        error("Invalid Player Side option: " .. tostring(op))
    end
end

local function judge_line_type()
    return skin_config.option["Judge Line Type"]
end

local function note_type()
    return skin_config.option["Note Type"]
end

local function ui_font()
    local op = skin_config.option["UI Font"]
    if op == PROPERTY.UI_FONT_NOTONOTO_CONSOLE_HS_MEDIUM then
        return require("common/font/NOTONOTOConsoleHS_medium")
    elseif op == PROPERTY.UI_FONT_GENSHIN_GOTHIC_HEAVY then
        return require("common/font/GenShinGothic_heavy")
    else
        error("Invalid UI Font option: " .. tostring(op))
    end
end

local property = {
    {
        name = "Display Size",
        category = "property_category_id_display_size",
        item = {
            { name = "27inch", op = PROPERTY.SIZE_27INCH },
            { name = "43inch", op = PROPERTY.SIZE_43INCH }
        }
    },
    {
        name = "Player Side",
        category = "property_category_id_player_side",
        item = {
            { name = "1P", op = PROPERTY.SIDE_1P },
            { name = "2P", op = PROPERTY.SIDE_2P }
        }
    },
    {
        name = "UI Font",
        category = "property_category_id_ui_font",
        item = {
            { name = "NOTONOTO Console HS Medium", op = PROPERTY.UI_FONT_NOTONOTO_CONSOLE_HS_MEDIUM },
            { name = "源真ゴシック Heavy", op = PROPERTY.UI_FONT_GENSHIN_GOTHIC_HEAVY }
        }
    },
    {
        name = "Judge Line Type",
        category = "property_category_id_judge_line_type",
        item = {
            { name = "Simple",       op = PROPERTY.JUDGE_LINE_SIMPLE },
            { name = "Glow",         op = PROPERTY.JUDGE_LINE_GLOW },
            { name = "Glow(timing)", op = PROPERTY.JUDGE_LINE_GLOW_TIMING },
        }
    },
    {
        name = "Note Type",
        category = "property_category_id_note_type",
        item = {
            { name = "Default",  op = PROPERTY.NOTE_TYPE_DEFAULT },
            { name = "Ocean",    op = PROPERTY.NOTE_TYPE_OCEAN },
            { name = "Tropical", op = PROPERTY.NOTE_TYPE_TROPICAL },
        }
    },
}

return {
    category = {
        {
            name = "全般設定(General Settings)",
            item = {
                "property_category_id_display_size",
                "property_category_id_player_side",
                "property_category_id_ui_font",

            }
        },
        {
            name = "カスタムパーツ(Custom Parts)",
            item = {
                "property_category_id_judge_line_type",
                "property_category_id_note_type",
            }
        },
    },
    property = property,
    filepath = {},
    offset = {},
    display = display,
    player_side = player_side,
    judge_line_type = judge_line_type,
    note_type = note_type,
    ui_font = ui_font,
    PROPERTY = PROPERTY,
}
