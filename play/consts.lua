--- 組み込み定数
-- @see https://github.com/exch-bms2/beatoraja/blob/master/src/bms/player/beatoraja/skin/SkinProperty.java
-- @see https://right-stick.sub.jp/lr2skinhelp/hanyou.html#src_number
local STRINGS = {
    STRING_FULLTITLE  = 12,
    STRING_FULLARTIST = 16,
    STRING_TABLE_FULL = 1003,
}

local NUMBERS = {
    NUMBER_JUDGETIMING                   = 12,
    NUMBER_LANECOVER1                    = 14,

    NUMBER_SCORE                         = 101,
    NUMBER_SCORE_RATE                    = 102,
    NUMBER_SCORE_RATE_AFTERDOT           = 103,
    NUMBER_MAXBPM                        = 90,
    NUMBER_MINBPM                        = 91,
    NUMBER_GROOVEGAUGE                   = 107,
    NUMBER_GROOVEGAUGE_AFTERDOT          = 407,
    NUMBER_HIGHSCORE                     = 150,
    NUMBER_DIFF_HIGHSCORE                = 152,
    NUMBER_NOWBPM                        = 160,
    NUMBER_HIGHSCORE2                    = 170, -- 更新前のEXSCORE

    NUMBER_PERFECT                       = 110,
    NUMBER_EARLY_PERFECT                 = 410,
    NUMBER_LATE_PERFECT                  = 411,
    NUMBER_GREAT                         = 111,
    NUMBER_EARLY_GREAT                   = 412,
    NUMBER_LATE_GREAT                    = 413,
    NUMBER_GOOD                          = 112,
    NUMBER_EARLY_GOOD                    = 414,
    NUMBER_LATE_GOOD                     = 415,
    NUMBER_BAD                           = 113,
    NUMBER_EARLY_BAD                     = 416,
    NUMBER_LATE_BAD                      = 417,
    NUMBER_POOR                          = 114,
    NUMBER_EARLY_POOR                    = 418,
    NUMBER_LATE_POOR                     = 419,
    NUMBER_MISS                          = 420,
    NUMBER_EARLY_MISS                    = 421,
    NUMBER_LATE_MISS                     = 422,

    NUMBER_DURATION                      = 312, -- 表示時間(ms)
    NUMBER_DURATION_GREEN                = 313, -- 表示時間(緑数字)
    NUMBER_MAINBPM_DURATION_LANECOVER_ON = 1316,

    NUMBER_TOTALEARLY                    = 423,
    NUMBER_TOTALLATE                     = 424,
    NUMBER_COMBOBREAK                    = 425,
    NUMBER_POOR_PLUS_MISS                = 426,
    NUMBER_BAD_PLUS_POOR_PLUS_MISS       = 427,
}
local VALUE = {
    VALUE_JUDGE_1P_DURATION = 525,
}

local TIMERS = {
    TIMER_STARTINPUT = 1,
    TIMER_FADEOUT = 2,
    TIMER_FAILED = 3,

    TIMER_JUDGE_1P = 46,

    TIMER_BOMB_1P_SCRATCH = 50,
    TIMER_BOMB_1P_KEY1 = 51,
    TIMER_BOMB_1P_KEY2 = 52,
    TIMER_BOMB_1P_KEY3 = 53,
    TIMER_BOMB_1P_KEY4 = 54,
    TIMER_BOMB_1P_KEY5 = 55,
    TIMER_BOMB_1P_KEY6 = 56,
    TIMER_BOMB_1P_KEY7 = 57,

    TIMER_KEYON_1P_SCRATCH = 100,
    TIMER_KEYON_1P_KEY1 = 101,
    TIMER_KEYON_1P_KEY2 = 102,
    TIMER_KEYON_1P_KEY3 = 103,
    TIMER_KEYON_1P_KEY4 = 104,
    TIMER_KEYON_1P_KEY5 = 105,
    TIMER_KEYON_1P_KEY6 = 106,
    TIMER_KEYON_1P_KEY7 = 107,

    TIMER_ENDOFNOTE_1P = 143,

    --- CUSTOM TIMERS ---
    --- 値は10000 ~ 19999が利用できる
    CUSTOM_TIMER_SLOW_SOFLAN_1P = 10000,
}

local OFFSETS = {
    OFFSET_LIFT     = 3,
    OFFSET_JUDGE_1P = 32,
}

local OPTIONS = {
    OPTION_AUTOPLAYOFF         = 32,

    OPTION_BPMCHANGE           = 177,
    OPTION_LANECOVER1_CHANGING = 270,

    OPTION_1P_PERFECT          = 241,
    OPTION_1P_GREAT            = 242,
    OPTION_1P_EARLY            = 1242,
    OPTION_1P_GOOD             = 243,
    OPTION_1P_LATE             = 1243,
    OPTION_1P_BAD              = 244,
    OPTION_1P_POOR             = 245,
    OPTION_1P_MISS             = 246,

    OPTION_PERFECT_EXIST       = 2241,
    OPTION_GREAT_EXIST         = 2242,
    OPTION_GOOD_EXIST          = 2243,
    OPTION_BAD_EXIST           = 2244,
    OPTION_POOR_EXIST          = 2245,
    OPTION_MISS_EXIST          = 2246,
}

local BUTTONS = {
    BUTTON_RANDOM_1P = 42,
}

--- skin.valueに使えるオプション
local VALUES = {
    zeropadding = {       -- zeropadding要素に指定する
        NOPADDING = 0,    -- スペースを埋めない
        ZEROPADDING = 1,  -- 数字を0埋めで表示する
        ZERO2PADDING = 2, -- 数字を裏0埋めで表示する
    }
}

local GAUGE_TYPES = {
    GAUGE_TYPE_ASSIST_EASY  = 0,
    GAUGE_TYPE_EASY         = 1,
    GAUGE_TYPE_NORMAL       = 2,
    GAUGE_TYPE_HARD         = 3,
    GAUGE_TYPE_EXHARD       = 4,
    GAUGE_TYPE_HAZARD       = 5,
    GAUGE_TYPE_GRADE        = 6,
    GAUGE_TYPE_EX_GRADE     = 7,
    GAUGE_TYPE_EXHARD_GRADE = 8,
}

local RESOURCE_IDS = {
    WHITE = -111
}

local PLAYERS = {
    PLAYER1 = {
        SCRATCH = "LEFT",
    },
    PLAYER2 = {
        SCRATCH = "RIGHT",
    }
}

local DISPLAY = {
    INCH_27 = {
        size = 27,
        lane_magnification = 1
    },
    INCH_43 = {
        size = 43,
        lane_magnification = 10 / 16
    }
}

return {
    BUTTONS = BUTTONS,
    GAUGE_TYPES = GAUGE_TYPES,
    NUMBERS = NUMBERS,
    OFFSETS = OFFSETS,
    OPTIONS = OPTIONS,
    STRINGS = STRINGS,
    RESOURCE_IDS = RESOURCE_IDS,
    TIMERS = TIMERS,
    VALUE = VALUE,
    VALUES = VALUES,
    PLAYERS = PLAYERS,
    DISPLAY = DISPLAY,
}
