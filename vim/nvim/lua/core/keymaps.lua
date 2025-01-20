local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Esc
keymap.set("i", "jk", "<Esc>", opts)

-- NORMAL MODE --
-- Split
keymap.set("n", "sv", ":split<Return><C-w>w", opts)
keymap.set("n", "ss", ":vsplit<Return><C-w>w", opts)
-- Move active pane
keymap.set("n", "<C-h>", "<C-w>h", opts)
keymap.set("n", "<C-l>", "<C-w>l", opts)
-- Close pane
-- keymap.set("n", "<C-w>", ":close<CR>", opts)
-- Move current line
keymap.set("n", "<C-j>", "<Cmd>move+{v:count1}<CR>=l", opts)
keymap.set("n", "<C-k>", "<Cmd>move-1-{v:count1}<CR>=l", opts)
-- Copy current line
keymap.set("n", "<Space>j", "<Cmd>copy.<CR>", opts)
keymap.set("n", "<Space>k", "<Cmd>copy-1<CR>", opts)
-- Move inside line
keymap.set("n", "<Space>h", "^", opts)
keymap.set("n", "<Space>l", "$", opts)
-- Move cursor
keymap.set("n", "gh", "<S-H>", opts)
keymap.set("n", "gm", "<S-m>", opts)
keymap.set("n", "gl", "<S-l>", opts)
-- Copy current buffer path(relative)
keymap.set("n", "<C-c>", "<Cmd>let @+ = expand('%:.')<CR>", opts)
-- Yank to last
keymap.set("n", "Y", "y$", opts)
-- Do not yank with x,c
keymap.set("n", "x", '"_x', opts)
keymap.set("n", "c", '"_c', opts)
keymap.set("n", "C", '"_C', opts)
keymap.set("n", "ciw", '"_ciw', opts)
keymap.set("n", "cw", '"_cw', opts)
keymap.set("n", "ce", '"_ce', opts)
-- Fold
keymap.set("n", "<CR>", "za", opts)

-- INSERT MODE --
-- Emacs like commands
keymap.set("i", "<C-f>", "<Right>", opts)
keymap.set("i", "<C-b>", "<Left>", opts)
-- Delete character
keymap.set("i", "<C-l>", "<Del>", opts)

-- VISUAL MODE --
-- Move selected line
keymap.set("v", "<C-j>", ":move'>+1<CR>gv=gv", opts)
keymap.set("v", "<C-k>", ":move'<-2<CR>gv=gv", opts)
-- Copy selected line
keymap.set("v", "<Space>j", ":copy'<-1<CR>gv", opts)
keymap.set("v", "<Space>k", ":copy'>+0<CR>gv", opts)
-- Select inside line
keymap.set("v", "<Space>h", "^", opts)
keymap.set("v", "<Space>l", "$", opts)
