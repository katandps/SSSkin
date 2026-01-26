local properties = require("play/properties")

local function load(skin)
    local type = properties.judge_line_type()
    if type == properties.PROPERTY.JUDGE_LINE_SIMPLE then
        require("play/parts/judgeline/simple").load(skin)
    elseif type == properties.PROPERTY.JUDGE_LINE_GLOW then
        require("play/parts/judgeline/glow").load(skin)
    elseif type == properties.PROPERTY.JUDGE_LINE_GLOW_TIMING then
        require("play/parts/judgeline/glow_timing").load(skin)
    else
        error("Invalid judge line type: " .. tostring(type))
    end
end
return { load = load }
