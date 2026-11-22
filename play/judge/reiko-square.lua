--- Reiko Square Judge Skin
--- 96 x 96
---

local append_all = require("utils/append_all")
local merge_recursive = require("utils/merge_recursive")

local property = require("play/properties")
local NUMBERS = require("play/consts").NUMBERS

local skin = { source = {}, image = {}, value = {} }

local function build_chip(judge_height, text_width, number_width, num_space)
    local number_chip_width = number_width * 10

    local text_chip = {
        src = "src_judge",
        w = text_width,
        h = judge_height,
    }

    append_all(skin.image, {
        merge_recursive({ id = "judge_f_pg", x = number_chip_width, y = 0 }, text_chip),
        merge_recursive({ id = "judge_f_gr", x = number_chip_width, y = judge_height }, text_chip),
        merge_recursive({ id = "judge_f_gd", x = number_chip_width, y = judge_height * 2 }, text_chip),
        merge_recursive({ id = "judge_f_bd", x = number_chip_width, y = judge_height * 3 }, text_chip),
        merge_recursive({ id = "judge_f_pr", x = number_chip_width, y = judge_height * 4 }, text_chip),
        merge_recursive({ id = "judge_f_ms", x = number_chip_width, y = judge_height * 5 }, text_chip),
    })

    local number_chip = {
        src = "src_judge",
        w = number_chip_width,
        h = judge_height,
        divx = 10,
        digit = 6,
        space = num_space,
        ref = NUMBERS.NUMBER_SCORE, -- current combo
    }

    append_all(skin.value, {
        merge_recursive({ id = "judge_n_pg", x = 0, y = 0 }, number_chip),
        merge_recursive({ id = "judge_n_gr", x = 0, y = judge_height }, number_chip),
        merge_recursive({ id = "judge_n_gd", x = 0, y = judge_height * 2 }, number_chip),
        merge_recursive({ id = "judge_n_bd", x = 0, y = judge_height * 3 }, number_chip),
        merge_recursive({ id = "judge_n_pr", x = 0, y = judge_height * 4 }, number_chip),
        merge_recursive({ id = "judge_n_ms", x = 0, y = judge_height * 5 }, number_chip),
    })

    local chip = {
        src = "src_judge",
        text_width = text_width,
        number_width = number_width,
        number_chip_width = number_chip_width,
        judge_height = judge_height,
    }
    return chip
end

local function chip_43()
    local judge_height = 60
    local text_width = 264
    local number_width = 60
    local num_space = -3
    table.insert(skin.source, { id = "src_judge", path = "play/judge/reiko-square-43.png" }) -- 43inch用

    return build_chip(judge_height, text_width, number_width, num_space)
end

local function chip_27()
    local judge_height = 96
    local text_width = 420
    local number_width = 96
    local num_space = -4

    table.insert(skin.source, { id = "src_judge", path = "play/judge/reiko-square-27.png" }) -- 27inch用
    return build_chip(judge_height, text_width, number_width, num_space)
end

local chip
if property.display().size == 43 then
    chip = chip_43()
else
    chip = chip_27()
end

return {
    skin = skin,
    chip = chip,
}
