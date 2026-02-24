local wezterm = require "wezterm"
local config = wezterm.config_builder()

----------------------------------------------------
-- Base
----------------------------------------------------
config.automatically_reload_config = false
config.use_ime = true
config.font = wezterm.font("JetBrainsMono Nerd Font Propo", { weight = "ExtraLight" })
config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }
config.font_size = 14.0
config.color_scheme = "Oxocarbon Dark (Gogh)"
config.window_background_opacity = 0.75
config.macos_window_background_blur = 15
config.default_cwd = "/Volumes/casesensitive/work"

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
config.tab_max_width = 40

local SOLID_LEFT_ARROW = wezterm.nerdfonts.ple_lower_right_triangle
local SOLID_RIGHT_ARROW = wezterm.nerdfonts.ple_upper_left_triangle

-- Cache for tab title(key: pane_id, value: title)
local g_tab_titles = {}

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
  local background = "#5c6d74"
  local foreground = "#FFFFFF"
  local edge_background = "none"
  if tab.is_active then
    background = "#8733f5"
    foreground = "#FFFFFF"
  end
  local edge_foreground = background
  local process_icons = {
    ["nvim"] = wezterm.nerdfonts.custom_neovim,
    ["vim"] = wezterm.nerdfonts.custom_vim,
    ["node"] = wezterm.nerdfonts.fa_node_js,
    ["python"] = wezterm.nerdfonts.fa_python,
    ["zsh"] = wezterm.nerdfonts.dev_terminal,
    ["bash"] = wezterm.nerdfonts.dev_terminal,
    ["git"] = wezterm.nerdfonts.fa_git_alt,
    ["lazygit"] = wezterm.nerdfonts.fa_git_alt,
    ["docker"] = wezterm.nerdfonts.fa_docker,
  }
  local raw_process_name = tab.active_pane.foreground_process_name:gsub("(.*[/\\])(.*)", "%2")
  local icon = process_icons[raw_process_name] or wezterm.nerdfonts.fa_desktop

  local title = icon .. "  " .. wezterm.truncate_right(g_tab_titles[tab.active_pane.pane_id] or tab.active_pane.title, max_width - 1)

  return {
    { Background = { Color = edge_background } },
    { Foreground = { Color = edge_foreground } },
    { Text = SOLID_LEFT_ARROW },
    { Background = { Color = background } },
    { Foreground = { Color = foreground } },
    { Text = "   " .. title .. "   " },
    { Background = { Color = edge_background } },
    { Foreground = { Color = edge_foreground } },
    { Text = SOLID_RIGHT_ARROW },
  }
end)

wezterm.on("update-status", function(window, pane)
  local cwd = pane:get_current_working_dir()
  local dir = ""

  if cwd then
    dir = cwd.file_path

    if dir == wezterm.home_dir then
      dir = "~"
    else
      dir = dir:gsub("/$", ""):match("([^/]+)$") or "/"
    end

    g_tab_titles[pane:pane_id()] = dir
  end
end)

wezterm.on("update-right-status", function(window, pane)
  local name = window:active_key_table()
  local status = ""

  local mode_icons = {
    ["copy_mode"] = wezterm.nerdfonts.fa_copy,
    ["resize_pane"] = wezterm.nerdfonts.md_move_resize_variant,
  }

  if name then
    status = wezterm.format({
      { Attribute = { Intensity = "Bold" } },
      { Foreground = { AnsiColor = "Red" } },
      { Text = "  " .. mode_icons[name] .. "  " .. name:upper() .. "  " },
    })
  end

  window:set_right_status(status)
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
config.disable_default_key_bindings = true
config.keys = require("keybinds").keys
config.key_tables = require("keybinds").key_tables
config.leader = { key = "q", mods = "CTRL", timeout_milliseconds = 2000 }

return config
