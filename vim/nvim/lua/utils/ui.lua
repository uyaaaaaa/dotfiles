---@class lazyvim.util.ui
local M = {}

local fcs = _G.fcs

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

	return "%s%=%T%l " .. fold .. "  "
end

return M
