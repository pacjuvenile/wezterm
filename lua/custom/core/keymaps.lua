Config.key_map_preference = 'Mapped'
Config.disable_default_key_bindings = true
Config.disable_default_mouse_bindings = true

-- keymap
Config.keys = {
	-- 重载配置
	{
		key = 'r',
		mods = 'CTRL|ALT',
		action = Wezterm.action.ReloadConfiguration
	},
	-- 粘贴
	{
		key = 'p',
		mods = 'CTRL|ALT',
		action = Wezterm.action.PasteFrom('Clipboard')
	},
	-- 字体调整
	{
		key = '=',
		mods = 'CTRL|ALT',
		action = Wezterm.action.IncreaseFontSize
	},
	{
		key = '-',
		mods = 'CTRL|ALT',
		action = Wezterm.action.DecreaseFontSize
	},
	{
		key = '0',
		mods = 'CTRL|ALT',
		action = Wezterm.action.ResetFontSize
	},
	-- 快速复制
	{
		key = 'y',
		mods = 'CTRL|ALT',
		action = Wezterm.action.QuickSelect
	}
}

Config.key_tables = {
	copy_mode = {}
}

Config.mouse_bindings = {
	-- 光标滑动
	{
		event = { Down = { streak = 1, button = { WheelUp = 1 } } },
		mods = 'NONE',
		alt_screen = false,
		action = Wezterm.action.ScrollByCurrentEventWheelDelta
	},
	{
		event = { Down = { streak = 1, button = { WheelDown = 1 } } },
		mods = 'NONE',
		alt_screen = false,
		action = Wezterm.action.ScrollByCurrentEventWheelDelta
	},
	-- 左键拖拽选区
	{
		event = { Down = { streak = 1, button = 'Left' } },
		mods = 'NONE',
		action = Wezterm.action.SelectTextAtMouseCursor('Cell')
	},
	{
		event = { Drag = { streak = 1, button = 'Left' } },
		mods = 'NONE',
		action = Wezterm.action.ExtendSelectionToMouseCursor('Cell')
	},
	{
		event = { Up = { streak = 1, button = 'Left' } },
		mods = 'NONE',
		action = Wezterm.action.ExtendSelectionToMouseCursor('Cell')
	},
	-- 右键复制
	{
		event = { Down = { streak = 1, button = 'Right' } },
		mods = 'NONE',
		action = Wezterm.action.Multiple {
			Wezterm.action.CompleteSelection('Clipboard'),
			Wezterm.action.ClearSelection
		}
	}
}
