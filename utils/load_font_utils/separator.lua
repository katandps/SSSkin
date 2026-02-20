local is_windows = require("utils/load_font_utils/is_windows")
return is_windows() and "\\" or "/"
