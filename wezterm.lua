Wezterm = require("wezterm")
package.path = package.path .. ';' .. Wezterm.config_dir .. '/lua/?.lua'

Config = Wezterm.config_builder()
require('core.options')
require('core.keymaps')

return Config
