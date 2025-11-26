DotcLUI = {}

-- Base
DotcLUI.text = require("DotcLUI.ui.init_ui").text.new
DotcLUI.color = require("DotcLUI.utils.init_utils").color
DotcLUI.style_from_file = require("DotcLUI.utils.init_utils").style.from_file
DotcLUI.set_font = require("DotcLUI.utils.font").set_all
DotcLUI.button = require("DotcLUI.ui.button").new

-- Other
DotcLUI.API = {
    latest_size = require("DotcLUI.utils.font").latest_size,
    names_fonts = require("DotcLUI.utils.font").names_fonts,
    latest_font = require("DotcLUI.utils.font").latest_font,
    size_font_only = require("DotcLUI.utils.font").set_size,
    font_only = require("DotcLUI.utils.font").set_font,
    has_global_style = require("DotcLUI.utils.init_utils").style.get_ssff,
    debug_text = require("DotcLUI.ui.init_ui").text.der
}

return DotcLUI