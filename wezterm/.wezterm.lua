local wezterm = require("wezterm")

local config = wezterm.config_builder()

-- =============================================================================
-- FONT
-- =============================================================================
config.font = wezterm.font("JetBrainsMono Nerd Font", { weight = "Bold" })
config.font_size = 13

-- =============================================================================
-- PERFORMANCE
-- =============================================================================
config.max_fps = 120
config.automatically_reload_config = true

-- =============================================================================
-- APPEARANCE
-- =============================================================================
-- Catppuccin Mocha theme for consistency across all tools
config.color_scheme = "Catppuccin Mocha"

-- Window styling
config.window_decorations = "RESIZE"
config.window_background_opacity = 0.85
config.macos_window_background_blur = 20
config.default_cursor_style = "BlinkingBar"

-- Disable WezTerm tabs - tmux handles all window management
config.enable_tab_bar = false

config.window_padding = {
	left = 5,
	right = 5,
	top = 10,
	bottom = 5,
}

-- =============================================================================
-- TMUX INTEGRATION
-- =============================================================================
-- Auto-start tmux on launch, attach to existing 'main' session or create new
config.default_prog = { "/opt/homebrew/bin/tmux", "new-session", "-A", "-s", "main" }

-- =============================================================================
-- KEYBINDINGS
-- =============================================================================
-- Minimal keybindings - most interaction happens through tmux
config.keys = {
	-- Cmd+k to clear scrollback (useful for long agent outputs)
	{
		key = "k",
		mods = "CMD",
		action = wezterm.action.ClearScrollback("ScrollbackAndViewport"),
	},
	-- Cmd+n for new WezTerm window (separate tmux session context)
	{
		key = "n",
		mods = "CMD",
		action = wezterm.action.SpawnWindow,
	},
	-- Cmd+w to close current pane (matches macOS convention)
	{
		key = "w",
		mods = "CMD",
		action = wezterm.action.CloseCurrentPane({ confirm = true }),
	},
	-- Fix Cmd+Left/Right for word navigation in terminal
	{
		key = "LeftArrow",
		mods = "CMD",
		action = wezterm.action.SendKey({ key = "Home" }),
	},
	{
		key = "RightArrow",
		mods = "CMD",
		action = wezterm.action.SendKey({ key = "End" }),
	},
	-- Option+Left/Right for word jumping
	{
		key = "LeftArrow",
		mods = "OPT",
		action = wezterm.action.SendKey({ key = "b", mods = "ALT" }),
	},
	{
		key = "RightArrow",
		mods = "OPT",
		action = wezterm.action.SendKey({ key = "f", mods = "ALT" }),
	},
}

return config
