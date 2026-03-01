Config.key_map_preference = 'Mapped'

-- keymap
Config.keys = {
	-- 进入复制模式
	{
		key = 'y',
		mods = 'CTRL',
		action = Wezterm.action.ActivateCopyMode
	},
	-- 终端内粘贴
	{
		key = 'p',
		mods = 'ALT|SHIFT',
		action = Wezterm.action.PasteFrom('Clipboard')
	}
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
				{ CopyTo = 'ClipboardAndPrimarySelection' },
				{ CopyMode = 'Close' }
			}
		}
	}
}
