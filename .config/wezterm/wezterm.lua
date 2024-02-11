local wezterm = require("wezterm")

local is_windows = wezterm.target_triple == "x86_64-pc-windows-msvc"

return {
	color_scheme = "Catppuccin Mocha",
	font = wezterm.font("FiraCode Nerd Font", { weight = 400 }),
	-- Font size in windows looks bigger to me
	font_size = is_windows and 13.0 or 15.0,
	window_background_opacity = 0.92,
	macos_window_background_blur = 30,
	enable_tab_bar = false,
	default_cursor_style = "BlinkingUnderline",
	cursor_blink_rate = 600,

	-- window_background_image_hsb = {
	-- 	brightness = 0.01,
	-- 	hue = 1.0,
	-- 	saturation = 0.3,
	-- },

	-- Arch wsl as default domain on windows
	default_domain = is_windows and "WSL:Arch" or nil,

	keys = {
		{
			key = "f",
			mods = "CTRL",
			action = wezterm.action.ToggleFullScreen,
		},
	},
	mouse_bindings = {
		-- Ctrl-click to open links
		{
			event = { Up = { streak = 1, button = "Left" } },
			mods = "CTRL",
			action = wezterm.action.OpenLinkAtMouseCursor,
		},
	},
}
