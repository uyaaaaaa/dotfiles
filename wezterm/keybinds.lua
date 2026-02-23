local wezterm = require("wezterm")
local act = wezterm.action

return {
  keys = {
    { key = "d", mods = "SUPER", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
    { key = "d", mods = "SHIFT|SUPER", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
    { key = "w", mods = "SUPER", action = act({ CloseCurrentPane = { confirm = false } }) },
    { key = "[", mods = "SUPER", action = act.ActivatePaneDirection("Prev") },
    { key = "]", mods = "SUPER", action = act.ActivatePaneDirection("Next") },
    { key = "p", mods = "SUPER", action = act.ActivateCommandPalette },
    { key = "Enter", mods = "SUPER", action = act.ToggleFullScreen },
    {
      key = "LeftArrow",
      mods = "META",
      action = act.SendKey { key = "b", mods = "META" },
    },
    {
      key = "RightArrow",
      mods = "META",
      action = act.SendKey { key = "f", mods = "META" },
    },
  }
}
