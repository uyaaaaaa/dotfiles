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
keymap.set("n", "Y", "y$", opts)
-- Split window
keymap.set("n", "sv", "<Cmd>split<CR><C-w>w", opts)
keymap.set("n", "ss", "<Cmd>vsplit<CR><C-w>w", opts)
keymap.set("n", "x", '"_x', opts) -- Do not yank with x
keymap.set("n", "<Space>h", "^", opts)
keymap.set("n", "<Space>l", "$", opts)
keymap.set("n", "st", "<Cmd>TodoTelescope<CR>", opts)
-- Copy current buffer path(relative)
keymap.set("n", "<C-c>", "<Cmd>let @+ = expand('%:.')<CR>", opts)
-- move current line
keymap.set("n", "<C-j>", "<Cmd>move+{v:count1}<CR>=l", opts)
keymap.set("n", "<C-k>", "<Cmd>move-1-{v:count1}<CR>=l", opts)
-- copy current line
keymap.set("n", "<Space>j", "<Cmd>copy.<CR>", opts)
keymap.set("n", "<Space>k", "<Cmd>copy-1<CR>", opts)

-- Insert --
keymap.set("i", "jk", "<ESC>", opts)
keymap.set("i", ",", ",<Space>", opts) -- insert Space automatically after ","
keymap.set("i", "<C-h>", "<C-w>", opts)

-- Visual --
keymap.set("v", "<C-p>", '"0p', opts)
keymap.set("v", "<Space>h", "^", opts)
keymap.set("v", "<Space>l", "$", opts)
keymap.set("v", "p", "P", opts)
keymap.set("v", "hl", "<ESC>", opts)
-- move selected line
keymap.set("v", "<C-j>", ":move'>+1<CR>gv=gv", opts)
keymap.set("v", "<C-k>", ":move'<-2<CR>gv=gv", opts)
-- copy selected line
keymap.set("v", "<Space>j", ":copy'<-1<CR>gv", opts)
keymap.set("v", "<Space>k", ":copy'>+0<CR>gv", opts)

-- Command --
keymap.set("c", "qq", "qa", opts) -- delete all windows
-- completation
keymap.set("c", "<C-j>", "<C-z>", opts)
keymap.set("c", "<C-k>", "<S-tab>", opts)
keymap.set("c", "<Tab>", "<Nop>", opts)
