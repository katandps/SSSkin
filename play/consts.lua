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
    NUMBER_HIGHSCORE = 150,
    NUMBER_DIFF_HIGHSCORE = 152,
    NUMBER_NOWBPM = 160,
    NUMBER_HIGHSCORE2 = 170, -- 更新前のEXSCORE
}

local timers = {
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

return { properties = properties, refs = refs, offsets = offsets, numbers = numbers, options = options, timers = timers }
