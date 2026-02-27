local wezterm = require "wezterm"
local config = wezterm.config_builder()

----------------------------------------------------
-- Base
----------------------------------------------------
config.automatically_reload_config = false
config.use_ime = true
config.color_scheme = "Night Owl (Gogh)"
config.default_cursor_style = "BlinkingBlock"
config.default_cwd = "/Volumes/casesensitive/work"

----------------------------------------------------
-- Font
----------------------------------------------------
config.font = wezterm.font_with_fallback({
  { family = "JetBrainsMonoNL Nerd Font" },
  { family = "HackGen Console NF" },
})
config.font_size = 14.0
config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }

----------------------------------------------------
-- Window
----------------------------------------------------
config.window_background_opacity = 0.75
config.macos_window_background_blur = 15
config.window_decorations = "TITLE|RESIZE"
config.window_frame = { font_size = 14.0, inactive_titlebar_bg = "none", active_titlebar_bg = "none" }
config.window_background_gradient = { colors = { "#000000" } }

----------------------------------------------------
-- Tab
----------------------------------------------------
config.show_tabs_in_tab_bar = true
config.hide_tab_bar_if_only_one_tab = false
config.use_fancy_tab_bar = true
config.show_new_tab_button_in_tab_bar = false
config.show_close_tab_button_in_tabs = false
config.colors = { tab_bar = { inactive_tab_edge = "none" } }
config.tab_max_width = 40

local SOLID_LEFT_ARROW = wezterm.nerdfonts.ple_left_half_circle_thick
local SOLID_RIGHT_ARROW = wezterm.nerdfonts.ple_right_half_circle_thick

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
  local processes = {
    ["nvim"] = { icon = wezterm.nerdfonts.custom_neovim, color = "#5FB950" },
    ["vim"] = { icon = wezterm.nerdfonts.custom_vim, color = "#6666CC" },
    ["node"] = { icon = wezterm.nerdfonts.fa_node_js, color = "#84BA64" },
    ["python"] = { icon = wezterm.nerdfonts.fa_python, color = "#75A8D3" },
    ["zsh"] = { icon = wezterm.nerdfonts.dev_terminal, color = "#4D5156" },
    ["bash"] = { icon = wezterm.nerdfonts.dev_terminal, color = "#4D5156" },
    ["git"] = { icon = wezterm.nerdfonts.fa_git_alt, color = "#D7834F" },
    ["lazygit"] = { icon = wezterm.nerdfonts.fa_git_alt, color = "#D7834F" },
    ["docker"] = { icon = wezterm.nerdfonts.fa_docker, color = "#2560FF" },
    ["claude"] = { icon = wezterm.nerdfonts.fa_robot, color = "#B46102" },
    ["gemini"] = { icon = wezterm.nerdfonts.fa_robot, color = "#2560FF" },
  }
  local raw_process_name = tab.active_pane.foreground_process_name:gsub("(.*[/\\])(.*)", "%2")
  local process = processes[raw_process_name]
  local title = wezterm.truncate_right(g_tab_titles[tab.active_pane.pane_id] or tab.active_pane.title, max_width - 1)

  return {
    { Background = { Color = edge_background } },
    { Foreground = { Color = process.color } },
    { Text = (process.icon or wezterm.nerdfonts.fa_desktop) .. "  " },
    { Background = { Color = edge_background } },
    { Foreground = { Color = edge_foreground } },
    { Text = SOLID_LEFT_ARROW },
    { Background = { Color = background } },
    { Foreground = { Color = foreground } },
    { Text = " " .. title .. " " },
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
  local modes = {
    ["copy_mode"]   = { icon = wezterm.nerdfonts.fa_copy,                color = "Yellow" },
    ["search_mode"] = { icon = wezterm.nerdfonts.fa_search,              color = "Green" },
    ["resize_pane"] = { icon = wezterm.nerdfonts.md_move_resize_variant, color = "Blue" },
  }

  local name = window:active_key_table()
  local status = ""
  local mode = modes[name]

  if name then
    status = wezterm.format({
      { Attribute = { Intensity = "Bold" } },
      { Foreground = { AnsiColor = mode.color } },
      { Text = "  " .. mode.icon .. "  " .. name:upper() .. "  " },
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
