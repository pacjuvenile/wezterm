local M = {}
local wezterm = require("wezterm")

-- font 
M.font = wezterm.font_with_fallback({
    "Maple Mono NF",
    "Maple Mono NF CN"
})
M.font_size = 12.0
M.line_height = 1.2

-- color scheme
M.color_scheme = "Catppuccin Macchiato" -- Catppuccin Latte/Frappe/Macchiato/Mocha   

-- appearance
-- window
M.default_gui_startup_args = { "start", "--position", "110,110" }
M.initial_cols = 120
M.initial_rows = 25
M.window_decorations = "RESIZE"
M.adjust_window_size_when_changing_font_size = false
M.show_new_tab_button_in_tab_bar = false
M.use_fancy_tab_bar = false

-- opacity
M.window_background_opacity = 0.9
M.text_background_opacity = 0.9

return M
