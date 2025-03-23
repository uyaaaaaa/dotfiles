-- Create autocommand
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- Remove whitespace on save
autocmd("BufWritePre", {
    pattern = "*",
    command = ":%s/\\s\\+$//e",
})
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
