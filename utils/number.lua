local merge_all = require("utils.merge_all")
local function number(t)
    local number_size = {
        src_number_newtown = { w = 70, h = 70 },
        src_number_kenney_future = { w = 70, h = 70 },
        src_number_genshin = { w = 50, h = 70 },
        src_number_genshin_monospace_border = { w = 45, h = 70 },
        src_number_genshin_monospace_border_red = { w = 45, h = 70 },
        src_number_dot = { w = 16, h = 19 },
    }
    local number_y = 0
    local size = number_size[t.src]

    local divx = 10
    local divy = 1
    if t.divx then
        divx = t.divx
    end
    if t.divy then
        divy = t.divy
    end
    return merge_all(t, { x = 0, y = number_y, w = size.w * divx, h = size.h * divy })
end

return number
