Config.key_map_preference = 'Mapped'
Config.disable_default_key_bindings = true

-- keymap
Config.keys = {
	-- 基础快捷键
	-- 终端内粘贴
	{
		key = 'v',
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
	-- 插入Unicode字符
	{
		key = 'u',
		mods = 'CTRL|ALT',
		action = Wezterm.action.CharSelect
	},

	-- 窗格快捷键
	-- 新建/删除窗格
	{
		key = 'v',
		mods = 'CTRL|ALT',
		action = Wezterm.action_callback(function(window, pane)
			local u = pane:get_current_working_dir()
			local cwd = nil
			if type(u) == "table" then
				cwd = u.file_path or u.path
			elseif type(u) == "string" then
				cwd = (u:gsub("^file://[^/]*", ""))
			end
			Wezterm.log_info("u=" .. tostring(u) .. " cwd=" .. tostring(cwd))
			window:perform_action(
				Wezterm.action.SplitPane({
					direction = "Right",
					size = { Percent = 50 },
					command = {
						domain = "CurrentPaneDomain",
						cwd = cwd,
					},
				}),
				pane
			)
		end)
	},
	{
		key = 'h',
		mods = 'CTRL|ALT',
		action = Wezterm.action.SplitVertical({ domain = 'CurrentPaneDomain' })
	},
	{
		key = 'x',
		mods = 'CTRL|ALT',
		action = Wezterm.action.CloseCurrentPane { confirm = false }
	},
	-- 切换窗格焦点
	{
		key = 'a',
		mods = 'CTRL|ALT',
		action = Wezterm.action.PaneSelect {
			alphabet = 'asdfghjkl',
			mode = 'Activate'
		}
	},
	-- 移动窗格位置
	{
		key = 's',
		mods = 'CTRL|ALT',
		action = Wezterm.action.PaneSelect {
			alphabet = 'asdfghjkl',
			mode = 'SwapWithActive'
		}
	},
	-- 调整窗格尺寸
	{
		key = 'H',
		mods = 'CTRL|ALT|SHIFT',
		action = Wezterm.action.AdjustPaneSize({ "Left", 1 })
	},
	{
		key = 'J',
		mods = 'CTRL|ALT|SHIFT',
		action = Wezterm.action.AdjustPaneSize({ "Down", 1 })
	},
	{
		key = 'K',
		mods = 'CTRL|ALT|SHIFT',
		action = Wezterm.action.AdjustPaneSize({ "Up", 1 })
	},
	{
		key = 'L',
		mods = 'CTRL|ALT|SHIFT',
		action = Wezterm.action.AdjustPaneSize({ "Right", 1 })
	},
	{
		key = 'F',
		mods = 'CTRL|ALT|SHIFT',
		action = Wezterm.action.TogglePaneZoomState
	},

	-- 标签页快捷键
	-- 标签页新建/删除
	{
		key = 't',
		mods = 'CTRL|ALT',
		action = Wezterm.action.SpawnTab('CurrentPaneDomain')
	},
	{
		key = 'w',
		mods = 'CTRL|ALT',
		action = Wezterm.action.CloseCurrentTab({ confirm = false })
	},
	-- 标签页切换
	{
		key = 'p',
		mods = 'CTRL|ALT',
		action = Wezterm.action.ActivateTabRelative(-1)
	},
	{
		key = 'n',
		mods = 'CTRL|ALT',
		action = Wezterm.action.ActivateTabRelative(1)
	},
	{
		key = 'f',
		mods = 'CTRL|ALT',
		action = Wezterm.action.ShowTabNavigator
	},
	-- 标签页移动
	{
		key = 'P',
		mods = 'CTRL|ALT|SHIFT',
		action = Wezterm.action.MoveTabRelative(-1)
	},
	{
		key = 'N',
		mods = 'CTRL|ALT|SHIFT',
		action = Wezterm.action.MoveTabRelative(1)
	},
	-- 标签页重命名
	{
		key = 'r',
		mods = 'CTRL|ALT',
		action = Wezterm.action.PromptInputLine {
			description = 'Rename tab title',
			action = Wezterm.action_callback(function(window, _, line)
				if line then
					window:active_tab():set_title(line)
				end
			end),
		},
	},

	-- 检索快捷键
	-- 快速复制
	{
		key = 'y',
		mods = 'CTRL|ALT',
		action = Wezterm.action.QuickSelect
	},
	-- 进入搜索模式
	{
		key = '/',
		mods = 'CTRL|ALT',
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
				Wezterm.action.ActivateCopyMode,
				Wezterm.action.CopyMode { SetSelectionMode = 'Cell' }
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
