local append_all = require("utils/append_all")

local skin = { source = {}, image = {} }
append_all(skin.source, { { id = "src_text_nirmala_ui_bold", path = "common/text/nirmala_ui_bold_text.png" } })

local w = 36
local h = 33

append_all(skin.image, {
    { id = "text_pgreat_nirmala_ui_bold",      src = "src_text_nirmala_ui_bold", x = 0, y = 0,     w = w, h = h, },
    { id = "text_great_nirmala_ui_bold",       src = "src_text_nirmala_ui_bold", x = 0, y = h,     w = w, h = h, },
    { id = "text_good_nirmala_ui_bold",        src = "src_text_nirmala_ui_bold", x = 0, y = h * 2, w = w, h = h, },
    { id = "text_bad_nirmala_ui_bold",         src = "src_text_nirmala_ui_bold", x = 0, y = h * 3, w = w, h = h, },
    { id = "text_poor_nirmala_ui_bold",        src = "src_text_nirmala_ui_bold", x = 0, y = h * 4, w = w, h = h, },
    { id = "text_miss_nirmala_ui_bold",        src = "src_text_nirmala_ui_bold", x = 0, y = h * 5, w = w, h = h, },
    { id = "text_combo_break_nirmala_ui_bold", src = "src_text_nirmala_ui_bold", x = 0, y = h * 6, w = w, h = h, },
    { id = "text_miss_count_nirmala_ui_bold",  src = "src_text_nirmala_ui_bold", x = 0, y = h * 7, w = w, h = h, },
})

return skin
