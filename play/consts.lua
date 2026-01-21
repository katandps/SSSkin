local properties = {
    -- プロパティ用定数
    size_27inch = 920,
    size_43inch = 921,
}

--- 組み込み定数
-- @see https://github.com/exch-bms2/beatoraja/blob/master/src/bms/player/beatoraja/skin/SkinProperty.java
local refs = {
    STRING_FULLTITLE  = 12,
    STRING_FULLARTIST = 16,
    current_combo     = 75,
    STRING_TABLE_FULL = 1003,
}
local numbers = {
    NUMBER_MAXBPM = 90,
    NUMBER_MINBPM = 91,
    NUMBER_NOWBPM = 160,
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

local options = {
    OPTION_BPMCHANGE = 177
}

return { properties = properties, refs = refs, numbers = numbers, options = options, timers = timers }
