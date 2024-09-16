local opts = { noremap = true, silent = true }

local keymap = require("vim.keymap")

--Remap space as leader key
keymap.set("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Normal --
-- window navigation
keymap.set("n", "<C-h>", "<C-w>h", opts)
keymap.set("n", "<C-l>", "<C-w>l", opts)
-- Split window
keymap.set("n", "ss", "<Cmd>vsplit<CR><C-w>w", opts)
-- Yank to last
keymap.set("n", "Y", "y$", opts)
-- Do not yank with x
keymap.set("n", "x", '"_x', opts)
-- Change to UPPER_CASE
keymap.set("n", "<C-g><C-u>", "bgUl", { desc = "Change First Character To Upper Case" })
keymap.set("n", "<C-g><C-k>", "gUiw", { desc = "Change Word To Upper Case" })
-- Move inside line
keymap.set("n", "<Space>h", "^", opts)
keymap.set("n", "<Space>l", "$", opts)
-- Search Todo
keymap.set("n", "st", "<Cmd>TodoTelescope<CR>", opts)
-- Copy current buffer path(relative)
keymap.set("n", "<C-c>", "<Cmd>let @+ = expand('%:.')<CR>", opts)
-- Move current line
keymap.set("n", "<C-j>", "<Cmd>move+{v:count1}<CR>=l", opts)
keymap.set("n", "<C-k>", "<Cmd>move-1-{v:count1}<CR>=l", opts)
-- Copy current line
keymap.set("n", "<Space>j", "<Cmd>copy.<CR>", opts)
keymap.set("n", "<Space>k", "<Cmd>copy-1<CR>", opts)
-- Move inside buffer
keymap.set("n", "gh", "H", opts)
keymap.set("n", "gm", "M", opts)
keymap.set("n", "gl", "L", opts)

-- Insert --
keymap.set("i", "jk", "<ESC>", opts)
keymap.set("i", ",", ",<Space>", opts) -- insert Space automatically after ","
-- Delete word
keymap.set("i", "<C-d>", "<C-w>", opts)
-- Delete character
keymap.set("i", "<C-h>", "<BS>", opts)
keymap.set("i", "<C-l>", "<Del>", opts)
-- Insert new line
keymap.set("i", "<C-j>", "<End><CR>", opts)
keymap.set("i", "<C-k><C-o>", "<Home><CR><Up>", opts)

-- Visual --
keymap.set("v", "hl", "<ESC>", opts)
keymap.set("v", "<C-p>", '"0p', opts)
keymap.set("v", "<Space>h", "^", opts)
keymap.set("v", "<Space>l", "$", opts)
keymap.set("v", "p", "P", opts)
-- Move selected line
keymap.set("v", "<C-j>", ":move'>+1<CR>gv=gv", opts)
keymap.set("v", "<C-k>", ":move'<-2<CR>gv=gv", opts)
-- Copy selected line
keymap.set("v", "<Space>j", ":copy'<-1<CR>gv", opts)
keymap.set("v", "<Space>k", ":copy'>+0<CR>gv", opts)

-- Command --
keymap.set("c", "qq", "qa", opts) -- delete all windows
-- Completation
keymap.set("c", "<C-j>", "<C-z>", opts)
keymap.set("c", "<C-k>", "<S-tab>", opts)
keymap.set("c", "<Tab>", "<Nop>", opts)
