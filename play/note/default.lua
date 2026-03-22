--- ノートのスキン定義

local geometry = require("play/geometry").build()
local append_all = require("utils/append_all")
local property = require("play/properties")

local OFFSETS = require("play/consts").OFFSETS

local skin = { source = {}, image = {}, destination = {} }

local function note_path(note_type)
    if note_type == property.PROPERTY.NOTE_TYPE_OCEAN then
        return "play/note/ocean.png"
    elseif note_type == property.PROPERTY.NOTE_TYPE_TROPICAL then
        return "play/note/tropical.png"
    else
        return "play/note/default.png"
    end
end

append_all(skin.source, {
    { id = "src_green1dot", path = "play/note/green1dot.png" },
    { id = "src_notes",     path = note_path(property.note_type()) },
})

append_all(skin.image, {
    { id = "note_w",          src = "src_notes",     x = 0,   y = 0,   w = 60,  h = 24 },
    { id = "note_b",          src = "src_notes",     x = 60,  y = 0,   w = 48,  h = 24 },
    { id = "note_s",          src = "src_notes",     x = 108, y = 0,   w = 108, h = 24 },

    { id = "note_lnstart_w",  src = "src_notes",     x = 0,   y = 24,  w = 60,  h = 24 },
    { id = "note_lnstart_b",  src = "src_notes",     x = 60,  y = 24,  w = 48,  h = 24 },
    { id = "note_lnstart_s",  src = "src_notes",     x = 108, y = 24,  w = 108, h = 24 },

    { id = "note_lnend_w",    src = "src_notes",     x = 0,   y = 96,  w = 60,  h = 24 },
    { id = "note_lnend_b",    src = "src_notes",     x = 60,  y = 96,  w = 48,  h = 24 },
    { id = "note_lnend_s",    src = "src_notes",     x = 108, y = 96,  w = 108, h = 24 },

    { id = "note_lnbody_w",   src = "src_notes",     x = 0,   y = 48,  w = 60,  h = 24 },
    { id = "note_lnbody_b",   src = "src_notes",     x = 60,  y = 48,  w = 48,  h = 24 },
    { id = "note_lnbody_s",   src = "src_notes",     x = 108, y = 48,  w = 108, h = 24 },

    { id = "note_lnactive_w", src = "src_notes",     x = 0,   y = 72,  w = 60,  h = 24 },
    { id = "note_lnactive_b", src = "src_notes",     x = 60,  y = 72,  w = 48,  h = 24 },
    { id = "note_lnactive_s", src = "src_notes",     x = 108, y = 72,  w = 108, h = 24 },

    { id = "note_mine_w",     src = "src_notes",     x = 0,   y = 120, w = 60,  h = 24 },
    { id = "note_mine_b",     src = "src_notes",     x = 60,  y = 120, w = 48,  h = 24 },
    { id = "note_mine_s",     src = "src_notes",     x = 108, y = 120, w = 108, h = 24 },

    { id = "section_line",    src = "src_green1dot", x = 0,   y = 0,   w = 1,   h = 1 },
})

local lane_x_positions = geometry.lane_x_positions

skin.note = {
    id = "notes",
    note = { "note_w", "note_b", "note_w", "note_b", "note_w", "note_b", "note_w", "note_s" },
    lnend = { "note_lnend_w", "note_lnend_b", "note_lnend_w", "note_lnend_b", "note_lnend_w", "note_lnend_b", "note_lnend_w", "note_lnend_s" },
    lnstart = { "note_lnstart_w", "note_lnstart_b", "note_lnstart_w", "note_lnstart_b", "note_lnstart_w", "note_lnstart_b", "note_lnstart_w", "note_lnstart_s" },
    lnbody = { "note_lnbody_w", "note_lnbody_b", "note_lnbody_w", "note_lnbody_b", "note_lnbody_w", "note_lnbody_b", "note_lnbody_w", "note_lnbody_s" },
    lnactive = { "note_lnactive_w", "note_lnactive_b", "note_lnactive_w", "note_lnactive_b", "note_lnactive_w", "note_lnactive_b", "note_lnactive_w", "note_lnactive_s" },
    hcnend = { "note_lnend_w", "note_lnend_b", "note_lnend_w", "note_lnend_b", "note_lnend_w", "note_lnend_b", "note_lnend_w", "note_lnend_s" },
    hcnstart = { "note_lnstart_w", "note_lnstart_b", "note_lnstart_w", "note_lnstart_b", "note_lnstart_w", "note_lnstart_b", "note_lnstart_w", "note_lnstart_s" },
    hcnbody = { "note_lnbody_w", "note_lnbody_b", "note_lnbody_w", "note_lnbody_b", "note_lnbody_w", "note_lnbody_b", "note_lnbody_w", "note_lnbody_s" },
    hcnactive = { "note_lnactive_w", "note_lnactive_b", "note_lnactive_w", "note_lnactive_b", "note_lnactive_w", "note_lnactive_b", "note_lnactive_w", "note_lnactive_s" },
    hcndamage = { "note_lnbody_w", "note_lnbody_b", "note_lnbody_w", "note_lnbody_b", "note_lnbody_w", "note_lnbody_b", "note_lnbody_w", "note_lnbody_s" },
    hcnreactive = { "note_lnactive_w", "note_lnactive_b", "note_lnactive_w", "note_lnactive_b", "note_lnactive_w", "note_lnactive_b", "note_lnactive_w", "note_lnactive_s" },
    mine = { "note_mine_w", "note_mine_b", "note_mine_w", "note_mine_b", "note_mine_w", "note_mine_b", "note_mine_w", "note_mine_s" },

    hidden = {},
    processed = {},
    size = {},
    dst = {
        -- key 1
        { x = geometry.lane_left_margin + lane_x_positions[1], y = geometry.lane_under_margin, w = geometry.lane_white_key_width, h = geometry.lane_height },
        -- key 2
        { x = geometry.lane_left_margin + lane_x_positions[2], y = geometry.lane_under_margin, w = geometry.lane_black_key_width, h = geometry.lane_height },
        -- key 3
        { x = geometry.lane_left_margin + lane_x_positions[3], y = geometry.lane_under_margin, w = geometry.lane_white_key_width, h = geometry.lane_height },
        -- key 4
        { x = geometry.lane_left_margin + lane_x_positions[4], y = geometry.lane_under_margin, w = geometry.lane_black_key_width, h = geometry.lane_height },
        -- key 5
        { x = geometry.lane_left_margin + lane_x_positions[5], y = geometry.lane_under_margin, w = geometry.lane_white_key_width, h = geometry.lane_height },
        -- key 6
        { x = geometry.lane_left_margin + lane_x_positions[6], y = geometry.lane_under_margin, w = geometry.lane_black_key_width, h = geometry.lane_height },
        -- key 7
        { x = geometry.lane_left_margin + lane_x_positions[7], y = geometry.lane_under_margin, w = geometry.lane_white_key_width, h = geometry.lane_height },
        -- scratch
        { x = geometry.lane_left_margin + lane_x_positions[8], y = geometry.lane_under_margin, w = geometry.lane_scratch_width,   h = geometry.lane_height },
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
table.insert(skin.destination, { id = "notes", offset = OFFSETS.OFFSET_NOTES_1P })
return skin
