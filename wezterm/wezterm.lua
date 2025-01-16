local wezterm = require("wezterm")
local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- update
config.check_for_updates = true
config.check_for_updates_interval_seconds = 86400

config.window_background_opacity = 0.68
config.macos_window_background_blur = 60

config.color_scheme = "ayu"

config.font = wezterm.font("JetBrains Mono", { weight = "Medium", stretch = "Normal", style = "Normal" })
config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }
config.font_size = 11
config.use_ime = true
config.window_padding = {
	left = 10,
	right = 10,
	top = 8,
	bottom = 8,
}

-- default open wsl if exec by windows
if wezterm.target_triple == "x86_64-pc-windows-msvc" then
	-- open in wsl
	config.default_prog = { "wsl.exe", "--cd", "/home/uedayasuto" }
	-- open wezterm window with max size
	local mux = wezterm.mux
	wezterm.on("gui-startup", function(cmd)
		local tab, pane, window = mux.spawn_window(cmd or {})
		window:gui_window():maximize()
	end)
else
	config.native_macos_fullscreen_mode = false
end

-- tab setting
config.window_decorations = "RESIZE"
config.window_frame = {
	inactive_titlebar_bg = "none",
	active_titlebar_bg = "none",
}
config.window_background_gradient = {
	colors = { "#000000" },
}
config.show_new_tab_button_in_tab_bar = false
config.show_close_tab_button_in_tabs = false
config.colors = {
	tab_bar = {
		inactive_tab_edge = "none",
	},
}

local SOLID_LEFT_ARROW = wezterm.nerdfonts.ple_lower_right_triangle
local SOLID_RIGHT_ARROW = wezterm.nerdfonts.ple_upper_left_triangle

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	local background = "#5c6d74"
	local foreground = "#FFFFFF"
	local edge_background = "none"

	if tab.is_active then
		background = "#483d8b"
		foreground = "#FFFFFF"
	end
	local edge_foreground = background

	local title = "   " .. wezterm.truncate_right(tab.active_pane.title, max_width - 1) .. "   "

	return {
		{ Background = { Color = edge_background } },
		{ Foreground = { Color = edge_foreground } },
		{ Text = SOLID_LEFT_ARROW },
		{ Background = { Color = background } },
		{ Foreground = { Color = foreground } },
		{ Text = title },
		{ Background = { Color = edge_background } },
		{ Foreground = { Color = edge_foreground } },
		{ Text = SOLID_RIGHT_ARROW },
	}
end)

config.disable_default_key_bindings = true

-- keymaps
local act = wezterm.action
config.keys = {
	-- activate copy mode
	{ key = "x", mods = "CTRL", action = act.ActivateCopyMode },
	-- set full screen
	{ key = "f", mods = "SHIFT|META", action = act.ToggleFullScreen },
	-- open new tab
	{ key = "t", mods = "CTRL|SHIFT", action = act.SpawnTab("DefaultDomain") },
	-- activate tab
	{ key = "{", mods = "CTRL|SHIFT", action = act.ActivateTabRelative(-1) },
	{ key = "}", mods = "CTRL|SHIFT", action = act.ActivateTabRelative(1) },
	-- close tab
	{ key = "w", mods = "CTRL|SHIFT", action = act.CloseCurrentTab({ confirm = false }) },
	-- open new pane
	{ key = "n", mods = "CTRL", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "n", mods = "CTRL|SHIFT", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
	-- activate pane
	{ key = "h", mods = "CTRL|SHIFT", action = act.ActivatePaneDirection("Left") },
	{ key = "l", mods = "CTRL|SHIFT", action = act.ActivatePaneDirection("Right") },
	{ key = "k", mods = "CTRL|SHIFT", action = act.ActivatePaneDirection("Up") },
	{ key = "j", mods = "CTRL|SHIFT", action = act.ActivatePaneDirection("Down") },
	-- font size
	{ key = "+", mods = "CTRL|SHIFT", action = act.IncreaseFontSize },
	{ key = "-", mods = "CTRL", action = act.DecreaseFontSize },
	-- copy from clipboard
	{ key = "v", mods = "CTRL", action = act.PasteFrom("Clipboard") },
	-- delete word
	{ key = "Backspace", mods = "CTRL", action = act.SendKey({
		key = "w",
		mods = "CTRL",
	}) },
	-- quick select mode
	{ key = "f", mods = "CTRL|SHIFT", action = wezterm.action.QuickSelect },
}

return config
