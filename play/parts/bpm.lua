local header = require("play/header")
local consts = require("play/consts")

local numbers = consts.numbers
local options = consts.options

local append_all = require("utils/append_all")
local number = require("utils/number")

local text_img_w = 205
local text_img_h = 70

local bpm_center_x = header.w / 2
local bpm_y = 19
local bpm_w = 420
local bpm_h = 64

local function load(skin)
    append_all(skin.source, {
        { id = "src_frame_bpm",            path = "play/parts/frame_bpm.png" },
        { id = "src_othertexts",           path = "play/parts/othertexts.png" },
        { id = "src_number_kenney_future", path = "play/parts/kenney_future_custom.png" },
    })

    append_all(skin.image, {
        { id = "frame_bpm",      src = "src_frame_bpm",  x = 0, y = 0,               w = -1,         h = -1 },

        { id = "text_image_bpm", src = "src_othertexts", x = 0, y = text_img_h * 9,  w = text_img_w, h = text_img_h },
        { id = "text_image_min", src = "src_othertexts", x = 0, y = text_img_h * 10, w = text_img_w, h = text_img_h },
        { id = "text_image_max", src = "src_othertexts", x = 0, y = text_img_h * 11, w = text_img_w, h = text_img_h },
    })

    append_all(skin.value, {
        number({
            id = "bpm_min",
            src = "src_number_kenney_future",
            divx = 10,
            digit = 4,
            align = 2,
            ref = numbers.NUMBER_MINBPM
        }),
        number({
            id = "bpm_now",
            src = "src_number_kenney_future",
            divx = 10,
            digit = 4,
            align = 2,
            ref = numbers.NUMBER_NOWBPM
        }),
        number({
            id = "bpm_max",
            src = "src_number_kenney_future",
            divx = 10,
            digit = 4,
            align = 2,
            ref = numbers.NUMBER_MAXBPM
        }),
    })

    local num_y = bpm_y + 6
    local num_w = 38
    local num_h = 26
    local sideNumRate = 0.7

    local text_img_w = 205
    local text_img_h = 70
    local text_y = num_y + num_h + 8
    local text_h = 18
    local imgRate = text_h / text_img_h * 0.9
    local sideTextRate = 0.85

    append_all(skin.destination, {
        -- background black
        {
            id = "frame_bpm",
            dst = {
                { x = bpm_center_x - bpm_w / 2 - 4, y = bpm_y - 4, w = bpm_w + 8, h = bpm_h + 8, a = 200 }
            }
        },

        {
            id = "bpm_min",
            op = { options.OPTION_BPMCHANGE },
            filter = 1,
            dst = {
                { x = bpm_center_x - 144 - (num_w * 2 * sideNumRate), y = num_y, w = num_w * sideNumRate, h = num_h * sideNumRate }
            }
        },
        {
            id = "bpm_now",
            filter = 1,
            dst = {
                { x = bpm_center_x - num_w * 2, y = num_y, w = num_w, h = num_h }
            }
        },
        {
            id = "bpm_max",
            op = { options.OPTION_BPMCHANGE },
            filter = 1,
            dst = {
                { x = bpm_center_x + 144 - (num_w * 2 * sideNumRate), y = num_y, w = num_w * sideNumRate, h = num_h * sideNumRate }
            }
        },

        {
            id = "text_image_min",
            filter = 1,
            dst = {
                { x = bpm_center_x - 144 - text_img_w * imgRate * sideTextRate / 2, y = text_y + 2, w = text_img_w * imgRate * sideTextRate, h = text_img_h * imgRate * sideTextRate }
            }
        },
        {
            id = "text_image_bpm",
            filter = 1,
            dst = {
                { x = bpm_center_x - text_img_w * imgRate / 2, y = text_y + 2, w = text_img_w * imgRate, h = text_img_h * imgRate }
            }
        },
        {
            id = "text_image_max",
            filter = 1,
            dst = {
                { x = bpm_center_x + 144 - text_img_w * imgRate * sideTextRate / 2, y = text_y + 2, w = text_img_w * imgRate * sideTextRate, h = text_img_h * imgRate * sideTextRate }
            }
        },
    })
end

return { load = load }
