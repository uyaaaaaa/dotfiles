local wezterm = require("wezterm")
local act = wezterm.action

return {
  keys = {
    { key = "d", mods = "SUPER", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
    { key = "d", mods = "SHIFT|SUPER", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
    { key = "w", mods = "SUPER", action = act({ CloseCurrentPane = { confirm = true } }) },
    { key = "[", mods = "SUPER", action = act.ActivatePaneDirection("Prev") },
    { key = "]", mods = "SUPER", action = act.ActivatePaneDirection("Next") },
  }
}
