--- 判定ライン
local load = require("utils/load")

local properties = require("play/properties")

local skin = {}
local type = properties.judge_line_type()
if type == properties.PROPERTY.JUDGE_LINE_SIMPLE then
    load(skin, require("play/parts/judgeline/simple"), "judgeline")
elseif type == properties.PROPERTY.JUDGE_LINE_GLOW then
    load(skin, require("play/parts/judgeline/glow"), "judgeline")
elseif type == properties.PROPERTY.JUDGE_LINE_GLOW_TIMING then
    load(skin, require("play/parts/judgeline/glow_timing"), "judgeline")
else
    error("Invalid judge line type: " .. tostring(type))
end
return skin
