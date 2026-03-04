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
	-- 命令面板
	{
		key = 'P',
		mods = 'CTRL|ALT|SHIFT',
		action = Wezterm.action.ActivateCommandPalette
	},
	-- 终端内粘贴
	{
		key = 'v',
		mods = 'CTRL|SHIFT',
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

	-- 进入复制模式
	{
		key = 'y',
		mods = 'CTRL|ALT',
		action = Wezterm.action.ActivateCopyMode
	},
	-- 面板尺寸调整
	{
		key = 'h',
		mods = 'CTRL|ALT',
		action = Wezterm.action.AdjustPaneSize({ "Left", 1 })
	},
	{
		key = 'j',
		mods = 'CTRL|ALT',
		action = Wezterm.action.AdjustPaneSize({ "Down", 1 })
	},
	{
		key = 'k',
		mods = 'CTRL|ALT',
		action = Wezterm.action.AdjustPaneSize({ "Up", 1 })
	},
	{
		key = 'l',
		mods = 'CTRL|ALT',
		action = Wezterm.action.AdjustPaneSize({ "Right", 1 })
	},
	{
		key = 'f',
		mods = 'CTRL|ALT',
			action = Wezterm.action.TogglePaneZoomState
	},

	-- 进入窗格模式
	{
		key = 'w',
		mods = 'CTRL|ALT',
		action = Wezterm.action.ActivateKeyTable {
			name = 'window_mode',
			one_shot = true,
			until_unknown = true
		}
	},

	-- 进入标签页模式
	{
		key = 't',
		mods = 'CTRL|ALT',
		action = Wezterm.action.ActivateKeyTable {
			name = 'tab_mode',
			one_shot = true,
			until_unknown = true
		}
	},
}

Config.key_tables = {
	-- 复制模式键位
	copy_mode = {
		-- quit
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
		},
		-- 进入选择模式
		{
			key = 'f',
			mods = 'NONE',
			action = Wezterm.action.QuickSelect
		},
		-- 进入搜索模式
		{
			key = '/',
			mods = 'NONE',
			action = Wezterm.action.Search({ CaseSensitiveString = "" })
		},
	},

	-- 搜索模式键位
	search_mode = {
		{
			key = 'q',
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
			key = 'n',
			mods = 'NONE',
			action = Wezterm.action.CopyMode 'NextMatch'
		},
		{
			key = 'p',
			mods = 'NONE',
			action = Wezterm.action.CopyMode 'PriorMatch'
		},
		{
			key = 'r',
			mods = 'CTRL',
			action = Wezterm.action.CopyMode 'CycleMatchType'
		},
	},

	-- 面板模式键位
	window_mode = {
		{
			key = 'r',
			mods = 'NONE',
			action = Wezterm.action.SplitHorizontal({ domain = 'CurrentPaneDomain' })
		},
		{
			key = 'd',
			mods = 'NONE',
			action = Wezterm.action.SplitVertical({ domain = 'CurrentPaneDomain' })
		},
		{
			key = 'x',
			mods ='NONE',
			action = Wezterm.action.CloseCurrentPane { confirm = false }
		},
		{
			key = 'f',
			mods = 'NONE',
			action = Wezterm.action.PaneSelect {
				alphabet = 'asdfghjklzxcvbnmqwertyuiop',
				mode = 'Activate'
			}
		},
		{
			key = 'h',
			mods = 'NONE',
			action = Wezterm.action.ActivatePaneDirection('Left')
		},
		{
			key = 'j',
			mods = 'NONE',
			action = Wezterm.action.ActivatePaneDirection('Down')
		},
		{
			key = 'k',
			mods = 'NONE',
			action = Wezterm.action.ActivatePaneDirection('Up')
		},
		{
			key = 'l',
			mods = 'NONE',
			action = Wezterm.action.ActivatePaneDirection('Right')
		},
	},

	-- 标签页模式键位
	tab_mode = {
		{
			key = 't',
			mods = 'NONE',
			action = Wezterm.action.SpawnTab('CurrentPaneDomain')
		},
		{
			key = 'w',
			mods = 'NONE',
			action = Wezterm.action.CloseCurrentTab({ confirm = false })
		},
		{
			key = 'f',
			mods = 'NONE',
			action = Wezterm.action.ShowTabNavigator
		},
		{
			key = 'p',
			mods = 'NONE',
			action = Wezterm.action.ActivateTabRelative(-1)
		},
		{
			key = 'n',
			mods = 'NONE',
			action = Wezterm.action.ActivateTabRelative(1)
		},
		{
			key = 'LeftArrow',
			mods = 'NONE',
			action = Wezterm.action.MoveTabRelative(-1)
		},
		{
			key = 'RightArrow',
			mods = 'NONE',
			action = Wezterm.action.MoveTabRelative(1)
		},
		{
			key = 'r',
			mods = 'NONE',
			action = Wezterm.action.PromptInputLine {
				description = 'Rename tab title',
				action = Wezterm.action_callback(function(window, _, line)
					if line then
						window:active_tab():set_title(line)
					end
				end),
			},
		}
	}
}
