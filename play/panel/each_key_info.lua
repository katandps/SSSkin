--- 各キーごとの情報表示

local append_all = require("utils/append_all")
local load = require("utils/load")
local main_state = require("main_state")

local VALUE = require("play/consts").VALUE
local TIMERS = require("play/consts").TIMERS
local RESOURCE_IDS = require("play/consts").RESOURCE_IDS
local geometry = require("play/geometry").build()

local nirmala_ui_bold = require("common/digits/nirmala_ui_bold")

local skin = { value = {}, destination = {} }
load(skin, nirmala_ui_bold.skin, "font")

local judge_value_keys = {
    VALUE.VALUE_JUDGE_1P_SCRATCH,
    VALUE.VALUE_JUDGE_1P_KEY1,
    VALUE.VALUE_JUDGE_1P_KEY2,
    VALUE.VALUE_JUDGE_1P_KEY3,
    VALUE.VALUE_JUDGE_1P_KEY4,
    VALUE.VALUE_JUDGE_1P_KEY5,
    VALUE.VALUE_JUDGE_1P_KEY6,
    VALUE.VALUE_JUDGE_1P_KEY7,
}

-- キーごとの最新の判定を取得する
-- @param key string キー名 (0(S),1,2,3,4,5,6,7)
local function judge_type(key)
    local type_int = main_state.event_index(judge_value_keys[key])
    local judge_type_map = {
        [0] = "NONE",
        [1] = "PERFECT",
        [2] = "FASTGREAT",
        [3] = "SLOWGREAT",
        [4] = "FASTGOOD",
        [5] = "SLOWGOOD",
        [6] = "FASTBAD",
        [7] = "SLOWBAD",
        [8] = "FASTPOOR",
        [9] = "SLOWPOOR",
        [10] = "MISS"
    }
    return judge_type_map[type_int] or "NONE"
end

-- キーごとのイベント蓄積
local function notes_tracker(key_id)
    return function()
        local miss_count = 123
        local last_update_time = -1


        local val = 0
        local function update()
            local now = main_state.time()
            if now == last_update_time then
                return
            end
            last_update_time = now
        end
        -- 鍵盤処理イベントを記録する
        local function record()
            local judge_value = main_state.event_index(judge_value_keys[key_id])

            val               = judge_value
        end

        -- ミス数取得
        local function get_bad_poor()
            update()
            return last_update_time
        end

        -- テスト用関数
        local function count()
            return 12345
        end

        return {
            update = update,
            record = record,
            get_bad_poor = get_bad_poor,
            count = count
        }
    end
end

local miss_key_1 = notes_tracker(1)

append_all(skin.value, {
    nirmala_ui_bold.white_mini({
        id = "num_miss_key_1",
        digit = 3,
        value = miss_key_1().get_bad_poor
    }),
    nirmala_ui_bold.white_mini({
        id = "num_miss_key_2",
        digit = 3,
        value = miss_key_1().count
    })
})

-- 完成するまで表示しない
append_all(skin.destination, {
    {
        id = "num_miss_key_1",
        dst = {
            { x = geometry.lane_left_margin, y = geometry.lane_under_margin, w = nirmala_ui_bold.mini_width, h = nirmala_ui_bold.mini_height }
        }
    },
    {
        id = "num_miss_key_2",
        dst = {
            { x = geometry.lane_left_margin + 60, y = geometry.lane_under_margin, w = nirmala_ui_bold.mini_width, h = nirmala_ui_bold.mini_height }
        }
    }
})

return skin
