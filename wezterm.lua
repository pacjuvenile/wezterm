Wezterm = require("wezterm")
package.path = Wezterm.config_dir .. '/lua/?.lua;' .. Wezterm.config_dir .. '/lua/?/init.lua;' .. package.path

return require('custom')
