local wezterm = require("wezterm")

local M = {}

local MODES = {
    ["copy_mode"]   = { icon = wezterm.nerdfonts.fa_copy,                color = "Yellow" },
    ["search_mode"] = { icon = wezterm.nerdfonts.fa_search,              color = "Green" },
    ["resize_pane"] = { icon = wezterm.nerdfonts.md_move_resize_variant, color = "Blue" },
}

function M.getRightStatus(window)
    local name = window:active_key_table()

    if not name then
        return ""
    end

    local mode = MODES[name]

    return wezterm.format({
        { Attribute = { Intensity = "Bold" } },
        { Foreground = { AnsiColor = mode.color } },
        { Text = "  " .. mode.icon .. "  " .. name:upper() .. "  " },
    })
end

return M
