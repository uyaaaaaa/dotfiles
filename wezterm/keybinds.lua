local wezterm = require("wezterm")
local act = wezterm.action

return {
  keys = {
    { key = "c",     mods = "SUPER",       action = act.CopyTo("Clipboard") },
    { key = "v",     mods = "SUPER",       action = act.PasteFrom("Clipboard") },
    { key = "n",     mods = "SUPER",       action = act.SpawnWindow },
    { key = "r",     mods = "SUPER",       action = act.ReloadConfiguration },
    { key = "d",     mods = "SUPER",       action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
    { key = "d",     mods = "SHIFT|SUPER", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
    { key = "w",     mods = "SUPER",       action = act.CloseCurrentPane({ confirm = false }) },
    { key = "q",     mods = "SUPER",       action = act.QuitApplication },
    { key = "t",     mods = "SUPER",       action = act.SpawnTab("CurrentPaneDomain")},
    { key = "p",     mods = "SUPER",       action = act.ActivateCommandPalette },
    { key = "[",     mods = "SUPER",       action = act.ActivatePaneDirection("Prev") },
    { key = "[",     mods = "SHIFT|SUPER", action = act.ActivateTabRelative(-1) },
    { key = "]",     mods = "SUPER",       action = act.ActivatePaneDirection("Next") },
    { key = "]",     mods = "SHIFT|SUPER", action = act.ActivateTabRelative(1) },
    { key = "0",     mods = "SUPER",       action = act.ResetFontSize },
    { key = "=",     mods = "SUPER",       action = act.IncreaseFontSize },
    { key = "-",     mods = "SUPER",       action = act.DecreaseFontSize },
    { key = "Enter", mods = "SUPER",       action = act.ToggleFullScreen },
    { key = "l",     mods = "SUPER",       action = act.SendKey({ key = "l", mods = "SHIFT|CTRL" }) },
    { key = "x",     mods = "LEADER",      action = act.ActivateCopyMode },
    { key = "f",     mods = "LEADER",      action = act.Search("CurrentSelectionOrEmptyString") },
    { key = "r",     mods = "LEADER",      action = act.ActivateKeyTable({ name =  "resize_pane", one_shot = false }) },
    { key = "Space", mods = "LEADER",      action = act.QuickSelect },
    {
      key = "LeftArrow",
      mods = "META",
      action = act.SendKey({ key = "b", mods = "META" }),
    },
    {
      key = "RightArrow",
      mods = "META",
      action = act.SendKey({ key = "f", mods = "META" }),
    },
  },
  key_tables = {
    resize_pane = {
      { key = "Escape", mods = "NONE", action = act.PopKeyTable },
      { key = "h",          action = act.AdjustPaneSize({ "Left", 1 }) },
      { key = "l",          action = act.AdjustPaneSize({ "Right", 1 }) },
      { key = "k",          action = act.AdjustPaneSize({ "Up", 1 }) },
      { key = "j",          action = act.AdjustPaneSize({ "Down", 1 }) },
      { key = "LeftArrow",  action = act.AdjustPaneSize({ "Left", 1 }) },
      { key = "RightArrow", action = act.AdjustPaneSize({ "Right", 1 }) },
      { key = "UpArrow",    action = act.AdjustPaneSize({ "Up", 1 }) },
      { key = "DownArrow",  action = act.AdjustPaneSize({ "Down", 1 }) },
    },
    search_mode = {
      {
        key = "Escape",
        mods = "NONE",
        action = act.Multiple({
          act.CopyMode("ClearPattern"),
          act.CopyMode("Close"),
        }),
      },
      {
        key = "c",
        mods = "CTRL",
        action = act.Multiple({
          act.CopyMode("ClearPattern"),
          act.CopyMode("Close"),
        }),
      },
    },
  }
}
