-- Create autocommand
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- Remove whitespace on save
autocmd("BufWritePre", {
    pattern = "*",
    command = ":%s/\\s\\+$//e",
})
-- Open Markdown with Close All Fold
autocmd({ "BufNewFile", "BufRead" }, {
    pattern = "*.md",
    group = augroup("Start_with_close_fold", { clear = true }),
    command = "normal! zM",
})
-- Set Color
autocmd("BufEnter", {
    group = augroup("Colorscheme of Fold and Cursor", { clear = true }),
    once = true,
    callback = function()
        vim.cmd("highlight Folded gui=italic")
        vim.cmd("highlight Cursor guifg=black guibg=#B4DC00")
    end,
})
-- -- Format when save files.
-- autocmd("BufWrite", {
--     group = augroup("Save with format", { clear = true }),
--     desc = "Save with format",
--     command = ":lua vim.lsp.buf.format()",
-- })
-- Hover Lsp Document
autocmd("CursorHold", {
    group = augroup("Hover Doc", { clear = true }),
    desc = "Hover Doc",
    command = ":Lspsaga hover_doc",
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
