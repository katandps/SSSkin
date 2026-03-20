--- スキンのBGA領域
local append_all = require("utils/append_all")
local geometry = require("play/geometry").build()
local RESOURCE_IDS = require("play/consts").RESOURCE_IDS
local bga_off_type = require("play/properties").bga_off_type
local PROPERTY = require("play/properties").PROPERTY
local OPTIONS = require("play/consts").OPTIONS


local skin = { bga = { "bga" }, destination = {} }
skin.bga = { id = "bga" }

local x = geometry.bga_area_x
local y = 680
local w = 480
local h = 270

if (bga_off_type() == PROPERTY.BGA_OFF_STAGEFILE) then
    table.insert(skin.destination, {
        id = RESOURCE_IDS.IMAGE_STAGEFILE, op = { OPTIONS.OPTION_BGAOFF }, dst = { { x = x, y = y, w = w, h = h, a = 255 }, stretch = 8, }
    })
elseif (bga_off_type() == PROPERTY.BGA_OFF_CHROMA_KEY) then
    table.insert(skin.destination,
        { id = RESOURCE_IDS.WHITE, op = { OPTIONS.OPTION_BGAOFF }, dst = { { x = x, y = y, w = w, h = h, r = 0, g = 0, b = 255, a = 255 } } })
else
    table.insert(skin.destination,
        { id = RESOURCE_IDS.WHITE, op = { OPTIONS.OPTION_BGAOFF }, dst = { { x = x, y = y, w = w, h = h, r = 0, g = 0, b = 0, a = 255 } } })
end

append_all(skin.destination, {
    { id = "bga", op = { OPTIONS.OPTION_BGAON }, dst = { { x = x, y = y, w = w, h = h, a = 255 }, stretch = 1, } },
})
return skin
