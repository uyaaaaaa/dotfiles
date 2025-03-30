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
    local cfile = vim.fn.expand("<cfile>")

    if cfile:match("^https?://") then
        vim.ui.open(cfile)
    else
        Snacks.picker.lsp_definitions()
    end
end

function M.OpenMarkdownHelp()
    local buf = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_buf_set_option(buf, "filetype", "markdown")

    local lines = vim.fn.readfile(vim.fn.expand("~/.config/nvim/doc/keymaps.md"))
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)

    local width = math.floor(vim.o.columns * 0.8)
    local height = math.floor(vim.o.lines * 0.8)
    local row = math.floor((vim.o.lines - height) / 2)
    local col = math.floor((vim.o.columns - width) / 2)

    vim.api.nvim_open_win(buf, true, {
        relative = "editor",
        row = row,
        col = col,
        width = width,
        height = height,
        style = "minimal",
        border = "rounded",
    })
end

return M
