local opts = { noremap = true, silent = true }

local keymap = require("vim.keymap")

--Remap space as leader key
keymap.set("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Normal --
-- window navigation
keymap.set("n", "<C-h>", "<C-w>h", opts)
keymap.set("n", "<C-j>", "<C-w>j", opts)
keymap.set("n", "<C-k>", "<C-w>k", opts)
keymap.set("n", "<C-l>", "<C-w>l", opts)
-- yank
keymap.set("n", "<S-y>", "y$", opts)
-- Split window
keymap.set("n", "ss", "<Cmd>split<CR><C-w>w", opts)
keymap.set("n", "sv", "<Cmd>vsplit<CR><C-w>w", opts)
keymap.set("n", "x", '"_x', opts) -- Do not yank with x
keymap.set("n", "<Space>h", "^", opts)
keymap.set("n", "<Space>l", "$", opts)
keymap.set("n", "st", "<Cmd>TodoTelescope<CR>", opts)
-- Copy current buffer path(relative)
keymap.set("n", "<C-c>", "<Cmd>let @+ = expand('%:.')<CR>", opts)

-- Insert --
keymap.set("i", "jk", "<ESC>", opts)
keymap.set("i", ",", ",<Space>", opts) -- insert Space automatically after ","
keymap.set("i", "<C-h>", "<C-w>", opts)

-- Visual --
keymap.set("v", "<C-p>", '"0p', opts)
keymap.set("v", "<Space>h", "^", opts)
keymap.set("v", "<Space>l", "$", opts)

-- Command --
keymap.set("c", "qq", "qa", opts) -- delete all windows
-- completation
keymap.set("c", "<C-j>", "<C-z>", opts)
keymap.set("c", "<C-k>", "<S-tab>", opts)
keymap.set("c", "<Tab>", "<Nop>", opts)
