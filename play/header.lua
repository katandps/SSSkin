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
    property = require("play/properties").property,
    filepath = {
        { name = "dummy", path = "play/resource/*.png" }
    },
    offset = {
        { name = "dummy_offset", id = 40, a = true }
    }
}

return header
