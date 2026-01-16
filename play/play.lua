local header = require("metadata")
local resource = require("resource")

local function main()
    local skin = {}
    for k, v in pairs(header) do
        skin[k] = v
    end
    -- image resource file setting
    skin.source = resource
    -- image resource setting
    skin.image = {
        { id = "note1", src = "note1", x = 0, y = 0, w = 1, h = 1 },
        { id = "note2", src = "note2", x = 0, y = 0, w = 1, h = 1 },
        { id = "note3", src = "note3", x = 0, y = 0, w = 1, h = 1 },
        { id = "note4", src = "note4", x = 0, y = 0, w = 1, h = 1 },
        { id = "note5", src = "note5", x = 0, y = 0, w = 1, h = 1 },
        { id = "note6", src = "note6", x = 0, y = 0, w = 1, h = 1 },
        { id = "note7", src = "note7", x = 0, y = 0, w = 1, h = 1 },
        { id = "notes", src = "notes", x = 0, y = 0, w = 7, h = 1 },
    }
    skin.font = {
        -- {id = 0, path = "VL-Gothic-Regular.ttf"}
    }
    skin.image = {
        -- {id = "background", src = 1, x = 0, y = 0, w = 1280, h = 720},
    }
    skin.imageset = {
    }
    skin.value = {
        -- {id = 400, src = 5, x = 0, y = 0, w = 240, h = 24, divx = 10, digit = 4, ref = 91},
    }
    skin.text = {
        -- {id = 1000, font = 0, size = 24, align = 0, ref = 12}
    }
    skin.slider = {
        -- {id = 1050, src = 0, x = 0, y = 289, w = 14, h = 20, angle = 2, range = 520,type = 6}
    }
    skin.hiddenCover = {
    }
    skin.graph = {
    }
    skin.note = {
        id = "notes",
        note = { "note1", "note2", "note3", "note4", "note5", "note6", "note7" },
    }
    skin.gauge = {
    }
    skin.judge = {
    }
    skin.bga = {
        id = "bga"
    }
    skin.destination = {
        -- {id = "background", dst = { {x = 0, y = 0, w = 1280, h = 720} }},
    }
    return skin
end


return {
    header = header,
    main = main
}
