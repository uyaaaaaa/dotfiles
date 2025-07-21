-- Create autocommand
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- Highlight on yank
autocmd("TextYankPost", {
    group = augroup("highlight_yank", { clear = true }),
    desc = "Highlight Yank",
    callback = function()
        (vim.hl or vim.highlight).on_yank()
    end,
})
-- Open with cursor focusing on the line at last time
autocmd("BufRead", {
    group = augroup("last_row", { clear = true }),
    desc = "Open last row of buffer",
    callback = function()
        if vim.fn.line("'\"") > 0 and vim.fn.line("'\"") <= vim.fn.line("$") then
            vim.cmd('normal g`"')
        end
    end,
})

-- Set tab width to 2 for TypeScript files
autocmd("FileType", {
    pattern = {
        "javascript",
        "javascript.jsx",
        "javascriptreact",
        "typescript",
        "typescript.tsx",
        "typescriptreact",
        "yaml",
    },
    callback = function()
        vim.bo.shiftwidth = 2
        vim.bo.softtabstop = 2
        vim.bo.tabstop = 2
    end,
})

