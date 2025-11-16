-- Create autocommand
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

local utils = require("core.util")

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

-- Auto Save
autocmd({ "InsertLeave", "FocusLost", "BufLeave" }, {
    desc = "Save on Leave",
    pattern = "*",
    callback = function()
        if vim.bo[vim.api.nvim_get_current_buf()].buftype ~= '' then
            return
        end

        vim.notify(vim.fn.expand("%:t"), "info", { title = "Auto Save" })  -- notify filename
        vim.cmd("silent! write")
    end,
})

-- Apply Changes made outside of neovim When focused.
autocmd({ "WinEnter", "FocusGained", "BufEnter" }, {
  pattern = "*",
  command = "checktime",
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

augroup("MarkdownInsertLink", { clear = true })
autocmd("FileType", {
    pattern = "markdown",
    group = "MarkdownInsertLink",
    callback = function()
        local opts = { buffer = true, silent = true }
        vim.keymap.set("v", "p", utils.InsertMarkdownLink, opts)
    end,
})

