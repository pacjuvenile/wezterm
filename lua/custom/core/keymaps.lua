Config.key_map_preference = 'Mapped'
Config.disable_default_key_bindings = true
Config.disable_default_mouse_bindings = true

-- keymap
Config.keys = {
	-- 基础快捷键
	{
		key = 'V',
		mods = 'CTRL|SHIFT',
		action = Wezterm.action.PasteFrom('Clipboard')
	},
	-- 重载配置
	{
		key = 'R',
		mods = 'CTRL|ALT|SHIFT',
		action = Wezterm.action.ReloadConfiguration
	},
	-- 调试信息
	{
		key = 'D',
		mods = 'CTRL|ALT|SHIFT',
		action = Wezterm.action.ShowDebugOverlay
	},
	-- 字体调整
	{
		key = '+',
		mods = 'CTRL|ALT|SHIFT',
		action = Wezterm.action.IncreaseFontSize
	},
	{
		key = '-',
		mods = 'CTRL|ALT',
		action = Wezterm.action.DecreaseFontSize
	},
	{
		key = '=',
		mods = 'CTRL|ALT',
		action = Wezterm.action.ResetFontSize
	},

	-- 检索快捷键
	-- 快速复制
	{
		key = 'Y',
		mods = 'CTRL|ALT|SHIFT',
		action = Wezterm.action.QuickSelect
	},
	-- 进入搜索模式
	{
		key = '?',
		mods = 'CTRL|ALT|SHIFT',
		action = Wezterm.action.Search({ CaseSensitiveString = "" })
	},
}

Config.key_tables = {
	copy_mode = {},
	-- 搜索模式键位
	search_mode = {
		{
			key = 'Escape',
			mods = 'NONE',
			action = Wezterm.action.Multiple {
				Wezterm.action.CopyMode 'ClearPattern',
				Wezterm.action.CopyMode 'Close'
			}
		},
		{
			key = 'Enter',
			mods = 'NONE',
			action = Wezterm.action.CopyMode 'NextMatch'
		},
		{
			key = 'Enter',
			mods = 'SHIFT',
			action = Wezterm.action.CopyMode 'PriorMatch'
		},
		{
			key = 't',
			mods = 'CTRL',
			action = Wezterm.action.CopyMode 'CycleMatchType'
		}
	}
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
