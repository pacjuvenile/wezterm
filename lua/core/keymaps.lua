-- keymap
Config.keys = {
	-- 进入复制模式
	{
		key = "Escape",
		mods = "SHIFT",
		action = Wezterm.action.ActivateCopyMode
	}
}

Config.key_tables = {
	copy_mode = {
		{ key = 'Tab', mods = 'NONE', action = Wezterm.action.CopyMode 'MoveForwardWord' },
		{
			key = 'Tab',
			mods = 'SHIFT',
			action = Wezterm.action.CopyMode 'MoveBackwardWord',
		},
		{
			key = 'Enter',
			mods = 'NONE',
			action = Wezterm.action.CopyMode 'MoveToStartOfNextLine',
		},
		{
			key = 'i',
			mods = 'NONE',
			action = Wezterm.action.Multiple {
				{ CopyMode = 'Close' },
			},
		},
		{
			key = 'Space',
			mods = 'NONE',
			action = Wezterm.action.CopyMode { SetSelectionMode = 'Cell' },
		},
		{
			key = '$',
			mods = 'NONE',
			action = Wezterm.action.CopyMode 'MoveToEndOfLineContent',
		},
		{
			key = '$',
			mods = 'SHIFT',
			action = Wezterm.action.CopyMode 'MoveToEndOfLineContent',
		},
		{ key = ',',   mods = 'NONE', action = Wezterm.action.CopyMode 'JumpReverse' },
		{ key = '0',   mods = 'NONE', action = Wezterm.action.CopyMode 'MoveToStartOfLine' },
		{ key = ';',   mods = 'NONE', action = Wezterm.action.CopyMode 'JumpAgain' },
		{
			key = 'F',
			mods = 'NONE',
			action = Wezterm.action.CopyMode { JumpBackward = { prev_char = false } },
		},
		{
			key = 'F',
			mods = 'SHIFT',
			action = Wezterm.action.CopyMode { JumpBackward = { prev_char = false } },
		},
		{
			key = 'G',
			mods = 'NONE',
			action = Wezterm.action.CopyMode 'MoveToScrollbackBottom',
		},
		{
			key = 'G',
			mods = 'SHIFT',
			action = Wezterm.action.CopyMode 'MoveToScrollbackBottom',
		},
		{ key = 'H', mods = 'NONE', action = Wezterm.action.CopyMode 'MoveToViewportTop' },
		{
			key = 'H',
			mods = 'SHIFT',
			action = Wezterm.action.CopyMode 'MoveToViewportTop',
		},
		{
			key = 'L',
			mods = 'NONE',
			action = Wezterm.action.CopyMode 'MoveToViewportBottom',
		},
		{
			key = 'L',
			mods = 'SHIFT',
			action = Wezterm.action.CopyMode 'MoveToViewportBottom',
		},
		{
			key = 'M',
			mods = 'NONE',
			action = Wezterm.action.CopyMode 'MoveToViewportMiddle',
		},
		{
			key = 'M',
			mods = 'SHIFT',
			action = Wezterm.action.CopyMode 'MoveToViewportMiddle',
		},
		{
			key = 'O',
			mods = 'NONE',
			action = Wezterm.action.CopyMode 'MoveToSelectionOtherEndHoriz',
		},
		{
			key = 'O',
			mods = 'SHIFT',
			action = Wezterm.action.CopyMode 'MoveToSelectionOtherEndHoriz',
		},
		{
			key = 'T',
			mods = 'NONE',
			action = Wezterm.action.CopyMode { JumpBackward = { prev_char = true } },
		},
		{
			key = 'T',
			mods = 'SHIFT',
			action = Wezterm.action.CopyMode { JumpBackward = { prev_char = true } },
		},
		{
			key = 'V',
			mods = 'NONE',
			action = Wezterm.action.CopyMode { SetSelectionMode = 'Line' },
		},
		{
			key = 'V',
			mods = 'SHIFT',
			action = Wezterm.action.CopyMode { SetSelectionMode = 'Line' },
		},
		{
			key = '^',
			mods = 'NONE',
			action = Wezterm.action.CopyMode 'MoveToStartOfLineContent',
		},
		{
			key = '^',
			mods = 'SHIFT',
			action = Wezterm.action.CopyMode 'MoveToStartOfLineContent',
		},
		{ key = 'b', mods = 'NONE', action = Wezterm.action.CopyMode 'MoveBackwardWord' },
		{ key = 'b', mods = 'ALT',  action = Wezterm.action.CopyMode 'MoveBackwardWord' },
		{ key = 'b', mods = 'CTRL', action = Wezterm.action.CopyMode 'PageUp' },
		{
			key = 'c',
			mods = 'CTRL',
			action = Wezterm.action.Multiple {
				{ CopyMode = 'Close' },
			},
		},
		{
			key = 'd',
			mods = 'CTRL',
			action = Wezterm.action.CopyMode { MoveByPage = 0.5 },
		},
		{
			key = 'e',
			mods = 'NONE',
			action = Wezterm.action.CopyMode 'MoveForwardWordEnd',
		},
		{
			key = 'f',
			mods = 'NONE',
			action = Wezterm.action.CopyMode { JumpForward = { prev_char = false } },
		},
		{ key = 'f', mods = 'ALT',  action = Wezterm.action.CopyMode 'MoveForwardWord' },
		{ key = 'f', mods = 'CTRL', action = Wezterm.action.CopyMode 'PageDown' },
		{
			key = 'g',
			mods = 'NONE',
			action = Wezterm.action.CopyMode 'MoveToScrollbackTop',
		},
		{
			key = 'g',
			mods = 'CTRL',
			action = Wezterm.action.Multiple {
				{ CopyMode = 'Close' },
			},
		},
		{ key = 'h', mods = 'NONE', action = Wezterm.action.CopyMode 'MoveLeft' },
		{ key = 'j', mods = 'NONE', action = Wezterm.action.CopyMode 'MoveDown' },
		{ key = 'k', mods = 'NONE', action = Wezterm.action.CopyMode 'MoveUp' },
		{ key = 'l', mods = 'NONE', action = Wezterm.action.CopyMode 'MoveRight' },
		{
			key = 'm',
			mods = 'ALT',
			action = Wezterm.action.CopyMode 'MoveToStartOfLineContent',
		},
		{
			key = 'o',
			mods = 'NONE',
			action = Wezterm.action.CopyMode 'MoveToSelectionOtherEnd',
		},
		{
			key = 'q',
			mods = 'NONE',
			action = Wezterm.action.Multiple {
				{ CopyMode = 'Close' },
			},
		},
		{
			key = 't',
			mods = 'NONE',
			action = Wezterm.action.CopyMode { JumpForward = { prev_char = true } },
		},
		{
			key = 'u',
			mods = 'CTRL',
			action = Wezterm.action.CopyMode { MoveByPage = -0.5 },
		},
		{
			key = 'v',
			mods = 'NONE',
			action = Wezterm.action.CopyMode { SetSelectionMode = 'Cell' },
		},
		{
			key = 'v',
			mods = 'CTRL',
			action = Wezterm.action.CopyMode { SetSelectionMode = 'Block' },
		},
		{ key = 'w',        mods = 'NONE', action = Wezterm.action.CopyMode 'MoveForwardWord' },
		{
			key = 'y',
			mods = 'NONE',
			action = Wezterm.action.Multiple {
				{ CopyTo = 'ClipboardAndPrimarySelection' },
			},
		},
		{ key = 'PageUp',   mods = 'NONE', action = Wezterm.action.CopyMode 'PageUp' },
		{ key = 'PageDown', mods = 'NONE', action = Wezterm.action.CopyMode 'PageDown' },
		{
			key = 'End',
			mods = 'NONE',
			action = Wezterm.action.CopyMode 'MoveToEndOfLineContent',
		},
		{
			key = 'Home',
			mods = 'NONE',
			action = Wezterm.action.CopyMode 'MoveToStartOfLine',
		},
		{ key = 'LeftArrow', mods = 'NONE', action = Wezterm.action.CopyMode 'MoveLeft' },
		{
			key = 'LeftArrow',
			mods = 'ALT',
			action = Wezterm.action.CopyMode 'MoveBackwardWord',
		},
		{
			key = 'RightArrow',
			mods = 'NONE',
			action = Wezterm.action.CopyMode 'MoveRight',
		},
		{
			key = 'RightArrow',
			mods = 'ALT',
			action = Wezterm.action.CopyMode 'MoveForwardWord',
		},
		{ key = 'UpArrow',   mods = 'NONE', action = Wezterm.action.CopyMode 'MoveUp' },
		{ key = 'DownArrow', mods = 'NONE', action = Wezterm.action.CopyMode 'MoveDown' },
	},
}
