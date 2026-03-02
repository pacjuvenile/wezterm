Config.key_map_preference = 'Mapped'
Config.disable_default_key_bindings = true

-- keymap
Config.keys = {
	-- 重载配置
	{
		key = 'R',
		mods = 'CTRL|ALT|SHIFT',
		action = Wezterm.action.ReloadConfiguration
	},
	-- 进入复制模式
	{
		key = 'y',
		mods = 'CTRL|ALT',
		action = Wezterm.action.ActivateCopyMode
	},
	-- 进入搜索模式
	{
		key = 'f',
		mods = 'CTRL|ALT',
		action = Wezterm.action.Search({ CaseSensitiveString = "" })
	},
	-- 进入选择模式
	{
		key = 's',
		mods = 'CTRL|ALT',
		action = Wezterm.action.QuickSelect
	},
	-- 终端内粘贴
	{
		key = 'p',
		mods = 'CTRL|ALT',
		action = Wezterm.action.PasteFrom('Clipboard')
	},
	-- 插入Unicode字符
	{
		key = 'u',
		mods = 'CTRL|ALT',
		action = Wezterm.action.CharSelect
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
	-- 面板调整
	{
		key = 'r',
		mods = 'CTRL|ALT',
		action = Wezterm.action.SplitVertical({ domain = 'CurrentPaneDomain' })
	},
	{
		key = 'd',
		mods = 'CTRL|ALT',
		action = Wezterm.action.SplitHorizontal({ domain = 'CurrentPaneDomain' })
	},
	{
		key = 'h',
		mods = 'CTRL|ALT',
		action = Wezterm.action.ActivatePaneDirection('Left')
	},
	{
		key = 'j',
		mods = 'CTRL|ALT',
		action = Wezterm.action.ActivatePaneDirection('Down')
	},
	{
		key = 'k',
		mods = 'CTRL|ALT',
		action = Wezterm.action.ActivatePaneDirection('Up')
	},
	{
		key = 'l',
		mods = 'CTRL|ALT',
		action = Wezterm.action.ActivatePaneDirection('Right')
	},
	-- 标签页
	{
		key = 't',
		mods = 'CTRL|ALT',
		action = Wezterm.action.SpawnTab('CurrentPaneDomain')
	},
	{
		key = 'w',
		mods = 'CTRL|ALT',
		action = Wezterm.action.CloseCurrentTab({ confirm = true })
	},
	{
		key = '1',
		mods = 'CTRL|ALT',
		action = Wezterm.action.ActivateTab(0)
	},
	{
		key = '2',
		mods = 'CTRL|ALT',
		action = Wezterm.action.ActivateTab(1)
	},
	{
		key = '3',
		mods = 'CTRL|ALT',
		action = Wezterm.action.ActivateTab(2)
	},
	{
		key = '4',
		mods = 'CTRL|ALT',
		action = Wezterm.action.ActivateTab(3)
	},
	{
		key = '5',
		mods = 'CTRL|ALT',
		action = Wezterm.action.ActivateTab(4)
	},
	{
		key = '6',
		mods = 'CTRL|ALT',
		action = Wezterm.action.ActivateTab(5)
	},
	{
		key = '7',
		mods = 'CTRL|ALT',
		action = Wezterm.action.ActivateTab(6)
	},
	{
		key = '8',
		mods = 'CTRL|ALT',
		action = Wezterm.action.ActivateTab(7)
	},
	{
		key = '9',
		mods = 'CTRL|ALT',
		action = Wezterm.action.ActivateTab(8)
	},
	{
		key = '0',
		mods = 'CTRL|ALT',
		action = Wezterm.action.ActivateTab(-1)
	},
	{
		key = 'n',
		mods = 'CTRL|ALT',
		action = Wezterm.action.ActivateTabRelative(1)
	},
	{
		key = 'p',
		mods = 'CTRL|ALT',
		action = Wezterm.action.ActivateTabRelative(-1)
	},
	{
		key = 'H',
		mods = 'CTRL|ALT|SHIFT',
		action = Wezterm.action.MoveTabRelative(-1)
	},
	{
		key = 'L',
		mods = 'CTRL|ALT|SHIFT',
		action = Wezterm.action.MoveTabRelative(1)
	},
}

Config.key_tables = {
	copy_mode = {
		-- quit
		{
			key = 'Escape',
			mods = 'NONE',
			action = Wezterm.action.CopyMode 'Close'
		},
		{
			key = 'q',
			mods = 'NONE',
			action = Wezterm.action.CopyMode 'Close'
		},
		-- navigation
		{
			key = 'h',
			mods = "NONE",
			action = Wezterm.action.CopyMode 'MoveLeft'
		},
		{
			key = 'j',
			mods = "NONE",
			action = Wezterm.action.CopyMode 'MoveDown'
		},
		{
			key = 'k',
			mods = "NONE",
			action = Wezterm.action.CopyMode 'MoveUp'
		},
		{
			key = 'l',
			mods = "NONE",
			action = Wezterm.action.CopyMode 'MoveRight'
		},
		{
			key = 'w',
			mods = 'NONE',
			action = Wezterm.action.CopyMode 'MoveForwardWord'
		},
		{
			key = 'e',
			mods = 'NONE',
			action = Wezterm.action.CopyMode 'MoveForwardWordEnd'
		},
		{
			key = 'b',
			mods = 'NONE',
			action = Wezterm.action.CopyMode 'MoveBackwardWord'
		},
		{
			key = '0',
			mods = 'NONE',
			action = Wezterm.action.CopyMode 'MoveToStartOfLine'
		},
		{
			key = '^',
			mods = 'SHIFT',
			action = Wezterm.action.CopyMode 'MoveToStartOfLineContent'
		},
		{
			key = '$',
			mods = 'SHIFT',
			action = Wezterm.action.CopyMode 'MoveToEndOfLineContent'
		},
		{
			key = "g",
			mods = 'NONE',
			action = Wezterm.action.CopyMode 'MoveToScrollbackTop'
		},
		{
			key = 'G',
			mods = 'SHIFT',
			action = Wezterm.action.CopyMode 'MoveToScrollbackBottom'
		},
		{
			key = 'd',
			mods = 'CTRL',
			action = Wezterm.action.CopyMode { MoveByPage = 0.5 }
		},
		{
			key = 'u',
			mods = 'CTRL',
			action = Wezterm.action.CopyMode { MoveByPage = -0.5 }
		},
		{
			key = 'f',
			mods = 'NONE',
			action = Wezterm.action.CopyMode { JumpForward = { prev_char = false } }
		},
		{
			key = 'F',
			mods = 'SHIFT',
			action = Wezterm.action.CopyMode { JumpBackward = { prev_char = false } }
		},
		{
			key = 't',
			mods = 'NONE',
			action = Wezterm.action.CopyMode { JumpForward = { prev_char = true } }
		},
		{
			key = 'T',
			mods = 'SHIFT',
			action = Wezterm.action.CopyMode { JumpBackward = { prev_char = true } }
		},
		{
			key = ';',
			mods = 'NONE',
			action = Wezterm.action.CopyMode 'JumpAgain'
		},
		{
			key = ',',
			mods = 'NONE',
			action = Wezterm.action.CopyMode 'JumpReverse'
		},
		-- selection
		{
			key = 'v',
			mods = 'NONE',
			action = Wezterm.action.CopyMode { SetSelectionMode = 'Cell' }
		},
		{
			key = 'V',
			mods = 'SHIFT',
			action = Wezterm.action.CopyMode { SetSelectionMode = 'Line' }
		},
		{
			key = 'v',
			mods = 'CTRL',
			action = Wezterm.action.CopyMode { SetSelectionMode = 'Block' }
		},
		-- yank
		{
			key = 'y',
			mods = 'NONE',
			action = Wezterm.action.Multiple {
				{ CopyTo = 'Clipboard' },
				{ CopyMode = 'Close' }
			}
		}
	}
}
