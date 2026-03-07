local wezterm = require("wezterm")

local M = {}

local MODES = {
    ["copy_mode"]   = { icon = wezterm.nerdfonts.fa_copy,                color = "Yellow" },
    ["search_mode"] = { icon = wezterm.nerdfonts.fa_search,              color = "Green" },
    ["resize_pane"] = { icon = wezterm.nerdfonts.md_move_resize_variant, color = "Blue" },
}

function M.getRightStatus(window)
    local name = window:active_key_table()
    local elements = {}

    if name then
        local mode = MODES[name]
        table.insert(elements, { Attribute = { Intensity = "Bold" } })
        table.insert(elements, { Foreground = { AnsiColor = mode.color } })
        table.insert(elements, { Background = { Color = "none" } })
        table.insert(elements, { Text = "  " .. mode.icon .. "  " .. name:upper() .. "  " })
        table.insert(elements, { Foreground = { Color = "#666666" } })
        table.insert(elements, { Text = " | " })
    end

    table.insert(elements, { Foreground = { Color = "#cccccc" } })
    table.insert(elements, { Background = { Color = "none" } })
    table.insert(elements, { Text = " " .. wezterm.strftime("󰃭   %a. %b %d  󱑎  %H:%M") .. "    " })

    return wezterm.format(elements)
end

return M
