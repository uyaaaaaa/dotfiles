local wezterm = require("wezterm")

local M = {}

local function getBackgroundColor(tab)
    if tab.is_active then
        return "#8733F5"
    end

    return "#5C6D74"
end

function M.getTabColors(tab)
    return {
        background = getBackgroundColor(tab),
        foreground = "#FFFFFF",
    }
end

-- Cache for tab title(key: pane_id, value: title)
local c_tab_titles = {}

function M.setTitle(pane, title)
    c_tab_titles[pane:pane_id()] = title
end

function M.getTitle(tab, max_width)
    local title = c_tab_titles[tab.active_pane.pane_id] or tab.active_pane.title

    return wezterm.truncate_right(title, max_width - 1)
end

return M
