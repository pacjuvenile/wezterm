-- reload
Config.automatically_reload_config = false

-- font
Config.font = Wezterm.font_with_fallback({
	"Maple Mono NF",
	"Maple Mono NF CN"
})
Config.font_size = 12.0
Config.line_height = 1.2

-- color scheme
Config.color_scheme = "Catppuccin Macchiato" -- Catppuccin Latte/Frappe/Macchiato/Mocha

-- startup
Config.default_gui_startup_args = { "start", "--position", "130,110" }
Config.default_prog = { "wsl" }

-- appearance
-- window
Config.initial_cols = 120
Config.initial_rows = 27
Config.window_decorations = "RESIZE"
Config.adjust_window_size_when_changing_font_size = false
Config.show_new_tab_button_in_tab_bar = false
Config.hide_tab_bar_if_only_one_tab = true
Config.use_fancy_tab_bar = false
Config.window_padding = {
	left = 10,
	right = 0,
	top = 10,
	bottom = 0,
}

-- opacity
Config.window_background_opacity = 0.85
Config.text_background_opacity = 0.85
