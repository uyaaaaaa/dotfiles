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

-- Open Neotree at first
autocmd("BufEnter", {
    group = vim.api.nvim_create_augroup("Neotree_start_directory", { clear = true }),
    desc = "Start Neo-tree with directory",
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

