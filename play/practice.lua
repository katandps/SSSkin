--- プラクティスモードUI表示

local append_all = require("utils/append_all")
local load         = require("utils/load")
local property = require("play/properties")
local geometry = require("play/geometry").build()
local font = property.ui_font()

local row_num = 16
local font_size = 26

local skin = {image = {}, text = {}, destination = {}}

skin.practice = {{
    id = "practice",
    visibleItems = row_num,
}}

load(skin, font.skin, "practice_ui_font")

append_all(skin.image, {
})

for i = 1, row_num do
    local label_id = "practice_item" .. i .. "_label"
    local value_id = "practice_item" .. i .. "_value"
    local selectedOption = 3020 + i - 1
    append_all(skin.text, {
        {
            id = label_id,
            font = font.id,
            size = font_size,
            value = label_id,
        },
        {
            id = value_id,
            font = font.id,
            size = font_size,
            value = value_id,
        },
    })
    append_all(skin.destination, {
        {
            id = label_id,
            op = {1080}, -- on practice
            dst = {
                {
                    x = geometry.lane_left_margin + 150,
                    y = geometry.lane_under_margin + 800 - font_size * i * 2,
                    w = geometry.lane_width,
                    h = font_size,
                }
            },
        },
        {
            id = value_id,
            op = {1080, selectedOption}, -- on practice and selected
            dst = {
                {
                    x = geometry.lane_left_margin + 400,
                    y = geometry.lane_under_margin + 800 - font_size * i * 2,
                    w = geometry.lane_width,
                    h = font_size,
                    r = 255,
                    g = 255,
                    b = 128,
                }
            },
        },
        {
            id = value_id,
            op = {1080, -selectedOption}, -- on practice and not selected
            dst = {
                {
                    x = geometry.lane_left_margin + 400,
                    y = geometry.lane_under_margin + 800 - font_size * i * 2,
                    w = geometry.lane_width,
                    h = font_size,
                }
            },
        }
    })
end

table.insert(skin.text, {
    id = "dummy_text",
    font = font.id,
    size = font_size,
    constantText = "PRACTICE OPTIONS",
    align = 0,
})

append_all(skin.destination, {
    {
        id = "dummy_text",
        op = {1080}, -- on practice
        dst = {
            {
                x = geometry.lane_left_margin + 100,
                y = geometry.lane_under_margin + 830,
                w = geometry.lane_width,
                h = font_size,
            }
        },
    },
})

return skin
