local wezterm = require "wezterm"
local config = wezterm.config_builder()

----------------------------------------------------
-- Base
----------------------------------------------------
config.automatically_reload_config = true
config.use_ime = true
config.font_size = 14.0
config.color_scheme = 'Palenight (Gogh)'
config.window_background_opacity = 0.75
config.macos_window_background_blur = 15

----------------------------------------------------
-- Tab
----------------------------------------------------
config.window_decorations = "TITLE|RESIZE"
config.show_tabs_in_tab_bar = true
config.hide_tab_bar_if_only_one_tab = false
config.use_fancy_tab_bar = true
config.show_new_tab_button_in_tab_bar = false
config.show_close_tab_button_in_tabs = false
config.window_frame = { inactive_titlebar_bg = "none", active_titlebar_bg = "none" }
config.window_background_gradient = { colors = { "#000000" } }
config.colors = { tab_bar = { inactive_tab_edge = "none" } }

local SOLID_LEFT_ARROW = wezterm.nerdfonts.ple_lower_right_triangle
local SOLID_RIGHT_ARROW = wezterm.nerdfonts.ple_upper_left_triangle

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
  local background = "#5c6d74"
  local foreground = "#FFFFFF"
  local edge_background = "none"
  if tab.is_active then
    background = "#8733f5"
    foreground = "#FFFFFF"
  end
  local edge_foreground = background
  local title_string = tab.active_pane.title
  local title = "   " .. wezterm.truncate_right(title_string, max_width - 1) .. "   "

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

config.window_close_confirmation = "NeverPrompt"
config.skip_close_confirmation_for_processes_named = {
  "bash",
  "sh",
  "zsh",
  "fish",
  "tmux",
  "nu",
  "cmd.exe",
  "pwsh.exe",
  "powershell.exe",
}

----------------------------------------------------
-- keybinds
----------------------------------------------------
config.disable_default_key_bindings = false
config.keys = require("keybinds").keys
config.key_tables = require("keybinds").key_tables
config.leader = { key = "q", mods = "CTRL", timeout_milliseconds = 2000 }

return config
