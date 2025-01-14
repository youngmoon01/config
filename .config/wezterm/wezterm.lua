local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.font = wezterm.font("JetBrains Mono")

config.color_scheme = "OneDark (base16)"

return config
