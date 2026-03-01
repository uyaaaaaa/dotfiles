local wezterm = require("wezterm")
local config = wezterm.config_builder()

local keybinds = require("keybinds")
local p = require("utilities.pane")
local t = require("utilities.tab")
local w = require("utilities.window")

----------------------------------------------------
-- Base
----------------------------------------------------
config.automatically_reload_config = false
config.use_ime = true
config.color_scheme = "Night Owl (Gogh)"
config.default_cursor_style = "BlinkingBlock"

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

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
    local colors = t.getTabColors(tab)
    local title = t.getTitle(tab, max_width)
    local process = p.getProcess(tab.active_pane)

    local foreground = colors.foreground
    local background = colors.background
    local edge_foreground = colors.background
    local edge_background = "none"

    return {
        { Background = { Color = edge_background } },
        { Foreground = { Color = process.color } },
        { Text = process.icon .. "  " },
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
    t.setTitle(pane, p.getDirectory(pane))
end)

wezterm.on("update-right-status", function(window, pane)
    local status = w.getRightStatus(window)
    window:set_right_status(status)
end)

----------------------------------------------------
-- Keybinds
----------------------------------------------------
config.disable_default_key_bindings = true
config.leader = { key = "q", mods = "CTRL", timeout_milliseconds = 2000 }
config.keys = keybinds.keys
config.key_tables = keybinds.key_tables

return config
