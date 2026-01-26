local properties = require("play/properties")

local function load(skin)
    local type = properties.judge_line_type()
    if type == "simple" then
        require("play/parts/judgeline/simple").load(skin)
    elseif type == "glow" then
        require("play/parts/judgeline/glow").load(skin)
    else
        error("Invalid judge line type: " .. tostring(type))
    end
end
return { load = load }
