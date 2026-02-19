local config = require("play/properties")

local header = {
    type = 0,
    name = "SSS Play skin 0.1",
    author = "katand",
    w = 1920,
    h = 1080,
    loadend = 1000,
    playstart = 1000,
    scene = 2700 * 1000,
    input = 500,
    close = 500,
    fadeout = 500,
    category = config.category,
    property = config.property,
    filepath = config.filepath,
    offset = config.offset,
}

return header
