--- 各キーごとの情報表示

local append_all = require("utils/append_all")
local load = require("utils/load")

local TIMERS = require("play/consts").TIMERS
local RESOURCE_IDS = require("play/consts").RESOURCE_IDS
local geometry = require("play/geometry").build()

local nirmala_ui_bold = require("common/digits/nirmala_ui_bold")

local skin = { value = {}, destination = {} }
load(skin, nirmala_ui_bold.skin, "font")

-- キーごとのイベント蓄積
local function key_info(key_id)
    return function()
        local miss_count = 123
        return {
            -- ミス数取得
            get_bad_poor = function()
                return miss_count
            end
        }
    end
end

local miss_key_1 = key_info(0)

append_all(skin.value, {
    nirmala_ui_bold.white_mini({
        id = "num_miss_key_1",
        digit = 3,
        value = miss_key_1().get_bad_poor
    })
})

-- 完成するまで表示しない
-- append_all(skin.destination, {
--     {
--         id = "num_miss_key_1",
--         dst = {
--             { x = geometry.lane_left_margin, y = geometry.lane_under_margin, w = nirmala_ui_bold.mini_width, h = nirmala_ui_bold.mini_height }
--         }
--     }
-- })

return skin
