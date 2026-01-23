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

return {
    buttons = buttons,
    numbers = numbers,
    offsets = offsets,
    options = options,
    properties = properties,
    refs = refs,
    timers = timers,
    value = value,
    values = values,
}
