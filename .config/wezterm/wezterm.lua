local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.font = wezterm.font('JetBrains Mono')

config.color_scheme = 'Sonokai (Gogh)'
config.window_background_opacity = 0.9

return config
