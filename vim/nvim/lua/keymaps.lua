local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Esc
keymap.set("i", "jk", "<Esc>:w<CR>", opts)

-- NORMAL MODE --
-- Split
keymap.set("n", "sv", ":split<Return><C-w>w", opts)
keymap.set("n", "ss", ":vsplit<Return><C-w>w", opts)
-- Move active pane
keymap.set("n", "<C-h>", "<C-w>h", opts)
keymap.set("n", "<C-l>", "<C-w>l", opts)
keymap.set("n", "<C-j>", "<C-w>j", opts)
keymap.set("n", "<C-k>", "<C-w>k", opts)
-- Close tab
keymap.set("n", "<C-w><C-t>", "<Cmd>tabclose<CR>", opts)
-- Copy current path(relative)
keymap.set("n", "<C-c>", "<Cmd>let @+ = expand('%:.')<CR>", opts)

-- Move current line
keymap.set("n", "J", "<Cmd>move+{v:count1}<CR>=l", opts)
keymap.set("n", "K", "<Cmd>move-1-{v:count1}<CR>=l", opts)
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
-- Decrement
keymap.set("n", "<C-f>", "<C-x>", opts)
-- Copy current buffer path(relative)
keymap.set("n", "<C-c>", "<Cmd>let @+ = expand('%:.')<CR>", opts)
-- Indent
keymap.set("n", ">", ">>", opts)
keymap.set("n", "<", "<<", opts)
-- Open help window
keymap.set("n", "g?", function() require("utils.fn").OpenMarkdownHelp() end, opts)
-- Jump By Lsp
keymap.set("n", "gd", function() require("utils.fn").GD() end, opts)
keymap.set("n", "gr", function() Snacks.picker.lsp_references() end, opts)
-- Replace current word in buffer
keymap.set("n", "#", function()
    vim.api.nvim_feedkeys(":%s/" .. vim.fn.expand("<cword>") .. "//g", "n", false)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Left><Left>", true, true, true), "n", false)
end, opts)
-- Toggle virtual text
keymap.set("n", "<leader>td", function() require("utils.fn").ToggleVirtualText() end, { desc = "Toggle Diagnostic Virtual Text" })
-- Escape hlslens
keymap.set({ "n", "i", "v" }, "<Esc>", "<Cmd>noh<CR>", opts)

-- INSERT MODE --
-- Emacs like commands
keymap.set("i", "<C-f>", "<Right>", opts)
keymap.set("i", "<C-b>", "<Left>", opts)
keymap.set("i", "<C-j>", "<Down>", opts)
keymap.set("i", "<C-k>", "<Up>", opts)
-- Delete character
keymap.set("i", "<C-d>", "<Del>", opts)

-- VISUAL MODE --
-- Move selected line
keymap.set("v", "J", ":move'>+1<CR>gv=gv", opts)
keymap.set("v", "K", ":move'<-2<CR>gv=gv", opts)
-- Copy selected line
keymap.set("v", "<Space>j", ":copy'<-1<CR>gv", opts)
keymap.set("v", "<Space>k", ":copy'>+0<CR>gv", opts)
-- Select inside line
keymap.set("v", "<Space>h", "^", opts)
keymap.set("v", "<Space>l", "$", opts)
-- Not Overwrite register when paste in visual mode
keymap.set("v", "p", "P", opts)
-- Indent
keymap.set("v", ">", ">gv", opts)
keymap.set("v", "<", "<gv", opts)

-- COMMAND MODE --
-- Select command history
keymap.set("c", "<C-j>", "<PageDown>")
keymap.set("c", "<C-k>", "<Up>")

-- TERMINAL MODE
keymap.set("t", "<leader>q", "<C-\\><C-n>", opts)
