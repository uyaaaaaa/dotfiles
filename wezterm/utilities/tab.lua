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

return M
