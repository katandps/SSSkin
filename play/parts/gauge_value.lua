local append_all       = require("utils/append_all")
local anticyclone_bold = require("common/digits/anticyclone_bold")
local numbers          = require("play/consts").numbers

local function load(skin)
    anticyclone_bold.load(skin)

    append_all(skin.value, {
        anticyclone_bold.white({
            id = "gaugevalue",
            digit = 3,
            ref = numbers.NUMBER_GROOVEGAUGE
        }),
        anticyclone_bold.white({ id = "gaugevalue_ad", digit = 1, ref = numbers.NUMBER_GROOVEGAUGE_AFTERDOT }),
    })
    local x, y, w, h = 1400, 800, anticyclone_bold.width, anticyclone_bold.height
    append_all(skin.destination, {
        {
            id = "gaugevalue",
            dst = {
                { x = x, y = y, w = w, h = h },
            }
        },
        {
            id = "gaugevalue_ad",
            dst = {
                { x = x + w * 3 + 10, y = y, w = w, h = h },
            }
        },
    })
end

return { load = load }
