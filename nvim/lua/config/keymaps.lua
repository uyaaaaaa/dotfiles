local opts = { noremap = true, silent = true }

--local keymap = vim.keymap
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Normal --
-- window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
-- yank
keymap("n", "<S-y>", "y$", opts)
-- New tab
keymap("n", "te", ":tabedit", opts)
keymap("n", "gn", ":tabnew<Return>", opts)
-- Split window
keymap("n", "ss", ":split<Return><C-w>w", opts)
keymap("n", "sv", ":vsplit<Return><C-w>w", opts)
keymap("n", "x", '"_x', opts) -- Do not yank with x
keymap("n", "<Space>h", "^", opts)
keymap("n", "<Space>l", "$", opts)

-- Insert --
keymap("i", "jk", "<ESC>", opts)
keymap("i", ",", ",<Space>", opts) -- insert Space automatically after ","

-- Visual --
keymap("v", "<C-p>", '"0p', opts)

-- Command --
keymap("c", "qq", "qa", opts) -- delete all windows
