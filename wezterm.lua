local M = {}
local wezterm = require("wezterm")

-- font
M.font = wezterm.font_with_fallback({
    "Maple Mono NF",
    "Maple Mono NF CN"
})
M.font_size = 12.0
M.line_height = 1.2

-- color scheme
M.color_scheme = "Catppuccin Macchiato" -- Catppuccin Latte/Frappe/Macchiato/Mocha

-- startup
M.default_gui_startup_args = { "start", "--position", "130,110" }
M.default_prog = { "wsl" }
-- M.default_gui_startup_args = { "start", "--position", "130,110" }

-- appearance
-- window
M.initial_cols = 120
M.initial_rows = 27
M.window_decorations = "RESIZE"
M.adjust_window_size_when_changing_font_size = false
M.show_new_tab_button_in_tab_bar = false
M.hide_tab_bar_if_only_one_tab = true
M.use_fancy_tab_bar = false
M.window_padding = {
  left = 10,
  right = 0,
  top = 10,
  bottom = 0,
}

-- opacity
M.window_background_opacity = 0.85
M.text_background_opacity = 0.85

-- keyboard
M.keys = {
    -- 进入复制模式
    {
        key = "Escape",
        mods = "SHIFT",
        action = wezterm.action.ActivateCopyMode
    }
}

M.key_tables = {
    copy_mode = {
        { key = 'Tab', mods = 'NONE', action = wezterm.action.CopyMode 'MoveForwardWord' },
        {
            key = 'Tab',
            mods = 'SHIFT',
            action = wezterm.action.CopyMode 'MoveBackwardWord',
        },
        {
            key = 'Enter',
            mods = 'NONE',
            action = wezterm.action.CopyMode 'MoveToStartOfNextLine',
        },
        {
            key = 'i',
            mods = 'NONE',
            action = wezterm.action.Multiple {
                { CopyMode = 'Close' },
            },
        },
        {
            key = 'Space',
            mods = 'NONE',
            action = wezterm.action.CopyMode { SetSelectionMode = 'Cell' },
        },
        {
            key = '$',
            mods = 'NONE',
            action = wezterm.action.CopyMode 'MoveToEndOfLineContent',
        },
        {
            key = '$',
            mods = 'SHIFT',
            action = wezterm.action.CopyMode 'MoveToEndOfLineContent',
        },
        { key = ',',   mods = 'NONE', action = wezterm.action.CopyMode 'JumpReverse' },
        { key = '0',   mods = 'NONE', action = wezterm.action.CopyMode 'MoveToStartOfLine' },
        { key = ';',   mods = 'NONE', action = wezterm.action.CopyMode 'JumpAgain' },
        {
            key = 'F',
            mods = 'NONE',
            action = wezterm.action.CopyMode { JumpBackward = { prev_char = false } },
        },
        {
            key = 'F',
            mods = 'SHIFT',
            action = wezterm.action.CopyMode { JumpBackward = { prev_char = false } },
        },
        {
            key = 'G',
            mods = 'NONE',
            action = wezterm.action.CopyMode 'MoveToScrollbackBottom',
        },
        {
            key = 'G',
            mods = 'SHIFT',
            action = wezterm.action.CopyMode 'MoveToScrollbackBottom',
        },
        { key = 'H', mods = 'NONE', action = wezterm.action.CopyMode 'MoveToViewportTop' },
        {
            key = 'H',
            mods = 'SHIFT',
            action = wezterm.action.CopyMode 'MoveToViewportTop',
        },
        {
            key = 'L',
            mods = 'NONE',
            action = wezterm.action.CopyMode 'MoveToViewportBottom',
        },
        {
            key = 'L',
            mods = 'SHIFT',
            action = wezterm.action.CopyMode 'MoveToViewportBottom',
        },
        {
            key = 'M',
            mods = 'NONE',
            action = wezterm.action.CopyMode 'MoveToViewportMiddle',
        },
        {
            key = 'M',
            mods = 'SHIFT',
            action = wezterm.action.CopyMode 'MoveToViewportMiddle',
        },
        {
            key = 'O',
            mods = 'NONE',
            action = wezterm.action.CopyMode 'MoveToSelectionOtherEndHoriz',
        },
        {
            key = 'O',
            mods = 'SHIFT',
            action = wezterm.action.CopyMode 'MoveToSelectionOtherEndHoriz',
        },
        {
            key = 'T',
            mods = 'NONE',
            action = wezterm.action.CopyMode { JumpBackward = { prev_char = true } },
        },
        {
            key = 'T',
            mods = 'SHIFT',
            action = wezterm.action.CopyMode { JumpBackward = { prev_char = true } },
        },
        {
            key = 'V',
            mods = 'NONE',
            action = wezterm.action.CopyMode { SetSelectionMode = 'Line' },
        },
        {
            key = 'V',
            mods = 'SHIFT',
            action = wezterm.action.CopyMode { SetSelectionMode = 'Line' },
        },
        {
            key = '^',
            mods = 'NONE',
            action = wezterm.action.CopyMode 'MoveToStartOfLineContent',
        },
        {
            key = '^',
            mods = 'SHIFT',
            action = wezterm.action.CopyMode 'MoveToStartOfLineContent',
        },
        { key = 'b', mods = 'NONE', action = wezterm.action.CopyMode 'MoveBackwardWord' },
        { key = 'b', mods = 'ALT',  action = wezterm.action.CopyMode 'MoveBackwardWord' },
        { key = 'b', mods = 'CTRL', action = wezterm.action.CopyMode 'PageUp' },
        {
            key = 'c',
            mods = 'CTRL',
            action = wezterm.action.Multiple {
                { CopyMode = 'Close' },
            },
        },
        {
            key = 'd',
            mods = 'CTRL',
            action = wezterm.action.CopyMode { MoveByPage = 0.5 },
        },
        {
            key = 'e',
            mods = 'NONE',
            action = wezterm.action.CopyMode 'MoveForwardWordEnd',
        },
        {
            key = 'f',
            mods = 'NONE',
            action = wezterm.action.CopyMode { JumpForward = { prev_char = false } },
        },
        { key = 'f', mods = 'ALT',  action = wezterm.action.CopyMode 'MoveForwardWord' },
        { key = 'f', mods = 'CTRL', action = wezterm.action.CopyMode 'PageDown' },
        {
            key = 'g',
            mods = 'NONE',
            action = wezterm.action.CopyMode 'MoveToScrollbackTop',
        },
        {
            key = 'g',
            mods = 'CTRL',
            action = wezterm.action.Multiple {
                { CopyMode = 'Close' },
            },
        },
        { key = 'h', mods = 'NONE', action = wezterm.action.CopyMode 'MoveLeft' },
        { key = 'j', mods = 'NONE', action = wezterm.action.CopyMode 'MoveDown' },
        { key = 'k', mods = 'NONE', action = wezterm.action.CopyMode 'MoveUp' },
        { key = 'l', mods = 'NONE', action = wezterm.action.CopyMode 'MoveRight' },
        {
            key = 'm',
            mods = 'ALT',
            action = wezterm.action.CopyMode 'MoveToStartOfLineContent',
        },
        {
            key = 'o',
            mods = 'NONE',
            action = wezterm.action.CopyMode 'MoveToSelectionOtherEnd',
        },
        {
            key = 'q',
            mods = 'NONE',
            action = wezterm.action.Multiple {
                { CopyMode = 'Close' },
            },
        },
        {
            key = 't',
            mods = 'NONE',
            action = wezterm.action.CopyMode { JumpForward = { prev_char = true } },
        },
        {
            key = 'u',
            mods = 'CTRL',
            action = wezterm.action.CopyMode { MoveByPage = -0.5 },
        },
        {
            key = 'v',
            mods = 'NONE',
            action = wezterm.action.CopyMode { SetSelectionMode = 'Cell' },
        },
        {
            key = 'v',
            mods = 'CTRL',
            action = wezterm.action.CopyMode { SetSelectionMode = 'Block' },
        },
        { key = 'w',        mods = 'NONE', action = wezterm.action.CopyMode 'MoveForwardWord' },
        {
            key = 'y',
            mods = 'NONE',
            action = wezterm.action.Multiple {
                { CopyTo = 'ClipboardAndPrimarySelection' },
            },
        },
        { key = 'PageUp',   mods = 'NONE', action = wezterm.action.CopyMode 'PageUp' },
        { key = 'PageDown', mods = 'NONE', action = wezterm.action.CopyMode 'PageDown' },
        {
            key = 'End',
            mods = 'NONE',
            action = wezterm.action.CopyMode 'MoveToEndOfLineContent',
        },
        {
            key = 'Home',
            mods = 'NONE',
            action = wezterm.action.CopyMode 'MoveToStartOfLine',
        },
        { key = 'LeftArrow', mods = 'NONE', action = wezterm.action.CopyMode 'MoveLeft' },
        {
            key = 'LeftArrow',
            mods = 'ALT',
            action = wezterm.action.CopyMode 'MoveBackwardWord',
        },
        {
            key = 'RightArrow',
            mods = 'NONE',
            action = wezterm.action.CopyMode 'MoveRight',
        },
        {
            key = 'RightArrow',
            mods = 'ALT',
            action = wezterm.action.CopyMode 'MoveForwardWord',
        },
        { key = 'UpArrow',   mods = 'NONE', action = wezterm.action.CopyMode 'MoveUp' },
        { key = 'DownArrow', mods = 'NONE', action = wezterm.action.CopyMode 'MoveDown' },
    },
}

return M
