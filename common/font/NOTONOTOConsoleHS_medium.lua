--- NOTONOTO Console HS Medium
local load_font = require("utils/load_font")

load_font.download_font(
    "https://github.com/yuru7/NOTONOTO/releases/download/v0.0.3/NOTONOTO_HS_v0.0.3.zip",
    "notonoto_console_hs_medium.ttf",
    "NOTONOTO_HS_v0.0.3/NOTONOTOConsole_HS/NOTONOTOConsoleHS-Medium.ttf"
)

local skin = { font = {} }

table.insert(skin.font,
    { id = "font_notonoto_console_hs_medium", path = "download/fonts/notonoto_console_hs_medium.ttf" })
return {
    skin = skin,
    id = "font_notonoto_console_hs_medium"
}
