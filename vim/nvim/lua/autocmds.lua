-- Create autocommand
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- Remove whitespace on save
autocmd("BufWritePre", {
    pattern = "*",
    command = ":%s/\\s\\+$//e",
})
-- Open neovim with Neotree
autocmd("BufEnter", {
    group = augroup("Neotree_start_directory", { clear = true } ),
    desc = "Start NeoTree with directory",
    once = true,
    callback = function()
        if package.loaded["neo-tree"] then
            return
        else
            local stats = vim.uv.fs_stat(vim.fn.argv(0))
            if stats and stats.type == "directory" then
                require("neo-tree")
            end
        end
    end,
})
-- Open Markdown with Close All Fold
autocmd("BufRead", {
    pattern = "*.md",
    group = augroup("Start_with_close_fold", { clear = true } ),
    command = "normal! zM"
})
-- Set Color Of Folded Text
autocmd("BufEnter", {
    group = augroup("Folded_colorscheme", { clear = true } ),
    once = true,
    command = "highlight Folded gui=italic"
})
-- Disable 'statuscolumn' in NeoTree
autocmd("BufEnter", {
    group = augroup("disable_statuscolumn", { clear = true } ),
    desc = "Disable Statuscolumn",
    callback = function()
        if vim.bo.filetype == 'neo-tree' then
            vim.wo.statuscolumn = ""
        end
    end,
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
            vim.cmd("normal g`\"")
        end
    end,
})

