--- 背景画像読み込み

local header = require("play/header")

local skin = { source = {}, image = {}, destination = {} }
table.insert(skin.source, { id = "src_background", path = "customize/background/default.jpg" })
table.insert(skin.image, { id = "background", src = "src_background", x = 0, y = 0, w = header.w, h = header.h })
table.insert(skin.destination, { id = "background", dst = { { x = 0, y = 0, w = header.w, h = header.h, a = 64 } } })
return skin
