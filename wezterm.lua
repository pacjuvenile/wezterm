Wezterm = require("wezterm")
package.path = Wezterm.config_dir .. '/lua/?.lua;' ..
								Wezterm.config_dir .. '/lua/?/init.lua'

return require('custom')
