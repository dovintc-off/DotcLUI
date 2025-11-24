DotcLUI = {}

DotcLUI.text = require("DotcLUI.ui.init_ui").text.new
DotcLUI.der = require("DotcLUI.ui.init_ui").text.der

DotcLUI.color = require("DotcLUI.utils.init_utils").color
DotcLUI.set = require("DotcLUI.utils.init_utils").font.set
DotcLUI.style_from_file = require("DotcLUI.utils.init_utils").style.from_file
DotcLUI.get_style_from_file = require("DotcLUI.utils.init_utils").style.get_ssff

return DotcLUI