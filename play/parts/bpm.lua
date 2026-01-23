local header = require("play/header")
local consts = require("play/consts")

local numbers = consts.numbers
local options = consts.options

local append_all = require("utils/append_all")

local anticyclone_bold = require("common/digits/anticyclone_bold")

local bpm_center_x = header.w / 2
local bpm_y = 19
local bpm_w = 420
local bpm_h = 60

local function load(skin)
    anticyclone_bold.load(skin)

    append_all(skin.value, {
        anticyclone_bold.white({
            id = "bpm_min",
            digit = 3,
            align = 2,
            ref = numbers.NUMBER_MINBPM
        }),
        anticyclone_bold.white({
            id = "bpm_now",
            digit = 3,
            align = 2,
            ref = numbers.NUMBER_NOWBPM
        }),
        anticyclone_bold.white({
            id = "bpm_max",
            digit = 3,
            align = 2,
            ref = numbers.NUMBER_MAXBPM
        }),
    })

    local num_y = bpm_y + 6
    local sideNumRate = 0.7
    local side_num_dist = 120
    local hiphen_width = 20

    append_all(skin.destination, {
        -- background black
        {
            id = -111,
            dst = {
                { x = bpm_center_x - bpm_w / 2, y = bpm_y, w = bpm_w, h = bpm_h, a = 50 }
            }
        },

        {
            id = "bpm_min",
            op = { options.OPTION_BPMCHANGE },
            filter = 1,
            dst = {
                { x = bpm_center_x - side_num_dist - anticyclone_bold.width * 1.5 * sideNumRate, y = num_y, w = anticyclone_bold.width * sideNumRate, h = anticyclone_bold.height * sideNumRate }
            }
        },
        {
            id = "bpm_now",
            filter = 1,
            dst = {
                { x = bpm_center_x - anticyclone_bold.width * 1.5, y = num_y, w = anticyclone_bold.width, h = anticyclone_bold.height }
            }
        },
        {
            id = "bpm_max",
            op = { options.OPTION_BPMCHANGE },
            filter = 1,
            dst = {
                { x = bpm_center_x + side_num_dist - anticyclone_bold.width * 1.5 * sideNumRate, y = num_y, w = anticyclone_bold.width * sideNumRate, h = anticyclone_bold.height * sideNumRate }
            }
        },
        { -- min側のハイフン
            id = -111,
            op = { options.OPTION_BPMCHANGE },
            dst = {
                { x = bpm_center_x - anticyclone_bold.width * 2.2 - hiphen_width / 2, y = num_y + anticyclone_bold.height * sideNumRate * 0.4, w = hiphen_width, h = anticyclone_bold.height * 0.2 * sideNumRate }
            }
        },
        {
            -- max側のハイフン
            id = -111,
            op = { options.OPTION_BPMCHANGE },
            dst = {
                { x = bpm_center_x + anticyclone_bold.width * 2.2 - hiphen_width / 2, y = num_y + anticyclone_bold.height * sideNumRate * 0.4, w = hiphen_width, h = anticyclone_bold.height * 0.2 * sideNumRate }
            }
        }
    })
end

return { load = load }
