---@class lazyvim.util.ui
local M = {}

-- set diagnostic icons
local icons = require("utils.icons")
vim.diagnostic.config({
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = icons.error,
            [vim.diagnostic.severity.WARN] = icons.warn,
            [vim.diagnostic.severity.INFO] = icons.info,
            [vim.diagnostic.severity.HINT] = icons.hint,
        },
    },
})

-- remap `gd`
function M.GD()
    local line = vim.fn.getline(".")
    local col = vim.fn.col(".")

    for url in line:gmatch("%b()") do
        url = url:sub(2, -2)
        local start_pos = line:find(url, 1, true)
        local end_pos = start_pos + #url

        if col >= start_pos and col <= end_pos then
            local cut_url = url:match("^(https?://[^%s]+)") or url

            if cut_url:match("^https?://") then
                vim.fn.jobstart({ "xdg-open", url }, { detach = true })
                return
            end
        end
    end

    Snacks.picker.lsp_definitions()
end

return M
