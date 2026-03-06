Config.key_map_preference = 'Mapped'
Config.disable_default_key_bindings = true

-- keymap
Config.keys = {
	-- 基础快捷键
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
			key = 'r',
			mods = 'CTRL',
			action = Wezterm.action.CopyMode 'CycleMatchType'
		},
	}
}
