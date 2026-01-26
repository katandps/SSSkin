local NUMBERS = require("play/consts").NUMBERS
local main_state = require("main_state")

--- 2割以上遅くなるソフラン中かどうか
local function with_slow_soflan()
    local main_duration = main_state.number(NUMBERS.NUMBER_MAINBPM_DURATION_LANECOVER_ON)
    local duration = main_state.number(NUMBERS.NUMBER_DURATION)
    return duration >= main_duration * 1.2
end

local function without_slow_soflan()
    return not with_slow_soflan()
end

return { with_slow_soflan = with_slow_soflan, without_slow_soflan = without_slow_soflan }
