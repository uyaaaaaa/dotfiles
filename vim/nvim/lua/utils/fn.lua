---@class lazyvim.util.fn
local M = {}

function M.list_contains(list, value)
    for _, v in ipairs(list) do
        if v == value then
            return true
        end
    end

    return false
end

-- remap `gd`
function M.GD()
    local cfile = vim.fn.expand("<cfile>")

    if cfile:match("^https?://") then
        vim.ui.open(cfile)
    else
        Snacks.picker.lsp_definitions()
    end
end

function M.ToggleVirtualText()
    local diagnostic_config = vim.diagnostic.config()

    diagnostic_config.virtual_text = not diagnostic_config.virtual_text
    vim.diagnostic.config(diagnostic_config)
    vim.notify("Diagnostic virtual text: " .. (diagnostic_config.virtual_text and "enabled" or "disabled"), vim.log.levels.INFO)
end

return M
