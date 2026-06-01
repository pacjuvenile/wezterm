-- reload
Config.automatically_reload_config = false

-- font
local emoji_font = "Noto Color Emoji"

if Wezterm.target_triple:find("apple") then
	emoji_font = "Apple Color Emoji"
elseif Wezterm.target_triple:find("windows") then
	emoji_font = "Segoe UI Emoji"
end

Config.font = Wezterm.font_with_fallback({
	"Maple Mono NF",
	{ family = emoji_font, assume_emoji_presentation = true },
	"Maple Mono NF CN"
})
Config.font_size = 11.5
Config.line_height = 1.2

-- color scheme
Config.color_scheme = "Catppuccin Macchiato" -- Catppuccin Latte/Frappe/Macchiato/Mocha

-- startup
Config.default_gui_startup_args = { "start", "--position", "130,110" }
Config.default_domain = 'WSL:NixOS'
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
Config.text_background_opacity = 1.0
