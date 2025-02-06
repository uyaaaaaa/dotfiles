-- Create autocommand
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- Remove whitespace on save
autocmd("BufWritePre", {
    pattern = "*",
    command = ":%s/\\s\\+$//e",
})
-- Open Markdown with Close All Fold
autocmd("BufRead", {
    pattern = "*.md",
    group = augroup("Start_with_close_fold", { clear = true } ),
    command = "normal! zM"
})
-- Set Color
autocmd("BufEnter", {
    group = augroup("Colorscheme of Fold and Cursor", { clear = true } ),
    once = true,
    callback = function()
        vim.cmd("highlight Folded gui=italic")
        vim.cmd("highlight Cursor guifg=black guibg=#B4DC00")
    end,
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

