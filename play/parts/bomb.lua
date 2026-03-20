--- ボム
--- このファイルで切り替えて、各種ファイルから呼び出す

local load = require("utils/load")

local skin = {}
load(skin, require("play/parts/bomb/ox"), "bomb_ox")

return skin
