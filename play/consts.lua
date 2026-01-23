-- プロパティ用定数
local properties = {
    -- 27インチモニターで43インチモニターと同等のサイズ
    size_27inch = 920,
    -- 43インチモニターでちょうどよいサイズ
    size_43inch = 921,
}

--- 組み込み定数
-- @see https://github.com/exch-bms2/beatoraja/blob/master/src/bms/player/beatoraja/skin/SkinProperty.java
-- @see https://right-stick.sub.jp/lr2skinhelp/hanyou.html#src_number
local refs = {
    STRING_FULLTITLE      = 12,
    NUMBER_LANECOVER1     = 14,
    STRING_FULLARTIST     = 16,
    current_combo         = 75,
    STRING_TABLE_FULL     = 1003,
    NUMBER_DURATION_GREEN = 313,
}
local numbers = {
    NUMBER_SCORE = 101,
    NUMBER_SCORE_RATE = 102,
    NUMBER_SCORE_RATE_AFTERDOT = 103,
    NUMBER_MAXBPM = 90,
    NUMBER_MINBPM = 91,
    NUMBER_GROOVEGAUGE = 107,
    NUMBER_GROOVEGAUGE_AFTERDOT = 407,
    NUMBER_HIGHSCORE = 150,
    NUMBER_DIFF_HIGHSCORE = 152,
    NUMBER_NOWBPM = 160,
    NUMBER_HIGHSCORE2 = 170, -- 更新前のEXSCORE

    NUMBER_PERFECT = 110,
    NUMBER_EARLY_PERFECT = 410,
    NUMBER_LATE_PERFECT = 411,
    NUMBER_GREAT = 111,
    NUMBER_EARLY_GREAT = 412,
    NUMBER_LATE_GREAT = 413,
    NUMBER_GOOD = 112,
    NUMBER_EARLY_GOOD = 414,
    NUMBER_LATE_GOOD = 415,
    NUMBER_BAD = 113,
    NUMBER_EARLY_BAD = 416,
    NUMBER_LATE_BAD = 417,
    NUMBER_POOR = 114,
    NUMBER_EARLY_POOR = 418,
    NUMBER_LATE_POOR = 419,
    NUMBER_MISS = 420,
    NUMBER_EARLY_MISS = 421,
    NUMBER_LATE_MISS = 422,

    NUMBER_TOTALEARLY = 423,
    NUMBER_TOTALLATE = 424,
    NUMBER_COMBOBREAK = 425,
    NUMBER_POOR_PLUS_MISS = 426,
    NUMBER_BAD_PLUS_POOR_PLUS_MISS = 427,
}
local value = {
    VALUE_JUDGE_1P_DURATION = 525,
}

local timers = {
    TIMER_STARTINPUT = 1,
    TIMER_FADEOUT = 2,
    TIMER_FAILED = 3,

    TIMER_JUDGE_1P = 46,
    TIMER_KEYON_1P_SCRATCH = 100,
    TIMER_KEYON_1P_KEY1 = 101,
    TIMER_KEYON_1P_KEY2 = 102,
    TIMER_KEYON_1P_KEY3 = 103,
    TIMER_KEYON_1P_KEY4 = 104,
    TIMER_KEYON_1P_KEY5 = 105,
    TIMER_KEYON_1P_KEY6 = 106,
    TIMER_KEYON_1P_KEY7 = 107,
}

local offsets = {
    OFFSET_LIFT     = 3,
    OFFSET_JUDGE_1P = 32,
}

local options = {
    OPTION_BPMCHANGE           = 177,
    OPTION_LANECOVER1_CHANGING = 270,
}

local buttons = {
    BUTTON_RANDOM_1P = 42,
}

--- skin.valueに使えるオプション
local values = {
    zeropadding = {       -- zeropadding要素に指定する
        NOPADDING = 0,    -- スペースを埋めない
        ZEROPADDING = 1,  -- 数字を0埋めで表示する
        ZERO2PADDING = 2, -- 数字を裏0埋めで表示する
    }
}

local resource_ids = {
    WHITE = -111
}

return {
    buttons = buttons,
    numbers = numbers,
    offsets = offsets,
    options = options,
    properties = properties,
    refs = refs,
    resource_ids = resource_ids,
    timers = timers,
    value = value,
    values = values,
}
