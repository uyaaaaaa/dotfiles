---@class lazyvim.util.ui
local M = {}

-- set diagnostic icons
local icons = require("utils.icons")
vim.diagnostic.config({
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = icons.error_icon,
            [vim.diagnostic.severity.WARN] = icons.warn_icon,
            [vim.diagnostic.severity.INFO] = icons.info_icon,
            [vim.diagnostic.severity.HINT] = icons.hint_icon,
        },
    },
})

-- optimized treesitter foldexpr for Neovim >= 0.10.0
function M.foldexpr()
    local buf = vim.api.nvim_get_current_buf()
    if vim.b[buf].ts_folds == nil then
        if vim.bo[buf].filetype == "" then
            return "0"
        end
        if vim.bo[buf].filetype:find("dashboard") then
            vim.b[buf].ts_folds = false
        else
            vim.b[buf].ts_folds = pcall(vim.treesitter.get_parser, buf)
        end
    end
    return vim.b[buf].ts_folds and vim.treesitter.foldexpr() or "0"
end

-- set statuscolumn with fold
function M.get_statuscol()
    local lnum = vim.v.lnum
    local fold = " "

	if vim.fn.foldlevel(lnum) > vim.fn.foldlevel(lnum - 1) then
        fold = vim.fn.foldclosed(lnum) == -1 and fcs.foldopen or fcs.foldclose
    end

	return " %T%=%l %s" .. fold .. " "
end

return M
