local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.font = wezterm.font("JetBrainsMono Nerd Font", { weight = "Bold" })
config.font_size = 16

config.max_fps = 120
config.automatically_reload_config = true
config.enable_tab_bar = false
config.window_decorations = "RESIZE"

config.window_background_opacity = 0.75
config.macos_window_background_blur = 20
config.default_cursor_style = "BlinkingBar"

config.color_scheme = "GitHub Dark"

config.window_padding = {
	left = 5,
	right = 0,
	top = 30,
	bottom = 0,
}

return config
