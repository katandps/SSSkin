local geometry = require("play/geometry").build()
local append_all = require("utils/append_all")


local function load(skin)
    append_all(skin.source, {
        { id = "src_note_w",    path = "play/note/note1.png" },
        { id = "src_note_b",    path = "play/note/note2.png" },
        { id = "src_note_s",    path = "play/note/notes.png" },
        { id = "src_green1dot", path = "play/note/green1dot.png" },
    })

    append_all(skin.image, {
        { id = "note_w",       src = "src_note_w",    x = 0, y = 0, w = 60,  h = 24 },
        { id = "note_b",       src = "src_note_b",    x = 0, y = 0, w = 48,  h = 24 },
        { id = "note_s",       src = "src_note_s",    x = 0, y = 0, w = 108, h = 24 },
        { id = "section_line", src = "src_green1dot", x = 0, y = 0, w = 1,   h = 1 },
    })

    local lane_x_positions = geometry.lane_x_positions

    skin.note = {
        id = "notes",
        note = { "note_w", "note_b", "note_w", "note_b", "note_w", "note_b", "note_w", "note_s" },
        lnend = { "note_w", "note_b", "note_w", "note_b", "note_w", "note_b", "note_w", "note_s" },
        lnstart = { "note_w", "note_b", "note_w", "note_b", "note_w", "note_b", "note_w", "note_s" },
        lnbody = { "note_w", "note_b", "note_w", "note_b", "note_w", "note_b", "note_w", "note_s" },
        lnactive = { "note_w", "note_b", "note_w", "note_b", "note_w", "note_b", "note_w", "note_s" },
        hcnend = { "note_w", "note_b", "note_w", "note_b", "note_w", "note_b", "note_w", "note_s" },
        hcnstart = { "note_w", "note_b", "note_w", "note_b", "note_w", "note_b", "note_w", "note_s" },
        hcnbody = { "note_w", "note_b", "note_w", "note_b", "note_w", "note_b", "note_w", "note_s" },
        hcnactive = { "note_w", "note_b", "note_w", "note_b", "note_w", "note_b", "note_w", "note_s" },
        hcndamage = { "note_w", "note_b", "note_w", "note_b", "note_w", "note_b", "note_w", "note_s" },
        hcnreactive = { "note_w", "note_b", "note_w", "note_b", "note_w", "note_b", "note_w", "note_s" },
        mine = { "note_w", "note_b", "note_w", "note_b", "note_w", "note_b", "note_w", "note_s" },

        hidden = {},
        processed = {},
        size = {},
        dst = {
            -- key 1
            { x = geometry.lane_left_margin + lane_x_positions[1], y = geometry.lane_under_margin - 14, w = geometry.lane_white_key_width, h = geometry.lane_height },
            -- key 2
            { x = geometry.lane_left_margin + lane_x_positions[2], y = geometry.lane_under_margin - 14, w = geometry.lane_black_key_width, h = geometry.lane_height },
            -- key 3
            { x = geometry.lane_left_margin + lane_x_positions[3], y = geometry.lane_under_margin - 14, w = geometry.lane_white_key_width, h = geometry.lane_height },
            -- key 4
            { x = geometry.lane_left_margin + lane_x_positions[4], y = geometry.lane_under_margin - 14, w = geometry.lane_black_key_width, h = geometry.lane_height },
            -- key 5
            { x = geometry.lane_left_margin + lane_x_positions[5], y = geometry.lane_under_margin - 14, w = geometry.lane_white_key_width, h = geometry.lane_height },
            -- key 6
            { x = geometry.lane_left_margin + lane_x_positions[6], y = geometry.lane_under_margin - 14, w = geometry.lane_black_key_width, h = geometry.lane_height },
            -- key 7
            { x = geometry.lane_left_margin + lane_x_positions[7], y = geometry.lane_under_margin - 14, w = geometry.lane_white_key_width, h = geometry.lane_height },
            -- scratch
            { x = geometry.lane_left_margin + lane_x_positions[8], y = geometry.lane_under_margin - 14, w = geometry.lane_scratch_width,   h = geometry.lane_height },
        },
        -- 小節線
        group = {
            {
                id = "section_line",
                offset = 3,
                dst = {
                    { x = geometry.lane_left_margin, y = geometry.lane_under_margin, w = geometry.lane_width, h = 2, r = 128, g = 128, b = 128 }
                }
            }
        },
        time = {
            {
                id = "section_line",
                offset = 3,
                dst = {
                    { x = geometry.lane_left_margin, y = geometry.lane_under_margin, w = geometry.lane_width, h = 2, r = 64, g = 192, b = 192 }
                }
            }
        },
        bpm = {
            {
                id = "section_line",
                offset = 3,
                dst = {
                    { x = geometry.lane_left_margin, y = geometry.lane_under_margin, w = geometry.lane_width, h = 2, r = 0, g = 192, b = 0 }
                }
            }
        },
        stop = {
            {
                id = "section_line",
                offset = 3,
                dst = {
                    { x = geometry.lane_left_margin, y = geometry.lane_under_margin, w = geometry.lane_width, h = 2, r = 192, g = 192, b = 0 }
                }
            }
        }
    }
    table.insert(skin.destination, { id = "notes" })
end
return { load = load }
