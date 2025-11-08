local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Esc
keymap.set("i", "jk", "<Esc>", opts)

-- NORMAL MODE --
keymap.set("n", "j", "gj", opts)
keymap.set("n", "k", "gk", opts)
-- execute command
keymap.set("n", "<leader><CR>", ":.!sh<CR>", opts)
-- launch IDE
keymap.set("n", "<leader><leader>", function() require("core.util").LaunchExternalEditor() end, opts)
-- Split
keymap.set("n", "sv", ":split<Return><C-w>w", opts)
keymap.set("n", "ss", ":vsplit<Return><C-w>w", opts)
-- Move active pane
keymap.set("n", "<C-h>", "<C-w>h", opts)
keymap.set("n", "<C-l>", "<C-w>l", opts)
-- -- Move current line
keymap.set("n", "<C-j>", "<Cmd>move+{v:count1}<CR>=l", opts)
keymap.set("n", "<C-k>", "<Cmd>move-1-{v:count1}<CR>=l", opts)
-- Copy current line
keymap.set("n", "<leader>j", "<Cmd>copy.<CR>", opts)
keymap.set("n", "<leader>k", "<Cmd>copy-1<CR>", opts)
-- Move inside line
keymap.set("n", "<leader>h", "^", opts)
keymap.set("n", "<leader>l", "$", opts)
-- Move cursor
keymap.set("n", "gh", "<S-H>", opts)
keymap.set("n", "gm", "<S-m>", opts)
keymap.set("n", "gl", "<S-l>", opts)
-- Yank to last
keymap.set("n", "Y", "y$", opts)
-- Resize window
keymap.set("n", "<C-.>", "<C-w>2>", opts)
keymap.set("n", "<C-,>", "<C-w>2<", opts)

-- Do not yank with x,c
keymap.set("n", "x", '"_x', opts)
keymap.set("n", "c", '"_c', opts)
keymap.set("n", "C", '"_C', opts)
keymap.set("n", "ciw", '"_ciw', opts)
keymap.set("n", "cw", '"_cw', opts)
keymap.set("n", "ce", '"_ce', opts)
-- Copy active buffer path(relative)
keymap.set("n", "<C-c>", "<Cmd>let @+ = expand('%:.')<CR>", opts)
-- Jump By Lsp
keymap.set("n", "gd", function() require("core.util").GD() end, opts)
keymap.set("n", "gr", function() Snacks.picker.lsp_references() end, opts)
-- Replace current word in buffer
keymap.set("n", "#", function()
    vim.api.nvim_feedkeys(":%s/" .. vim.fn.expand("<cword>") .. "//g", "n", false)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Left><Left>", true, true, true), "n", false)
end, opts)
-- Escape hlslens
keymap.set({ "n", "i", "v" }, "<Esc>", "<Cmd>noh<CR>", opts)
-- Increment / Decrement
keymap.set("n", "+", "<C-a>", opts)
keymap.set("n", "-", "<C-x>", opts)
-- Toggle csv format
keymap.set("n", "<C-CR>", function() require("core.util").ToggleCsvFormat() end, opts)
-- Adjust indent when pasting
keymap.set("n", "p", "]p", opts)
keymap.set("n", "P", "]P", opts)

-- INSERT MODE --
-- Delete character
keymap.set("i", "<C-d>", "<Del>", opts)
-- Emacs like keybindings
keymap.set("i", "<C-f>", "<Right>", opts)
keymap.set("i", "<C-b>", "<Left>", opts)
keymap.set("i", "<C-p>", "<Up>", opts)
keymap.set("i", "<C-n>", "<Down>", opts)

-- VISUAL MODE --
-- Move selected line
keymap.set("v", "<C-j>", ":move'>+1<CR>gv=gv", opts)
keymap.set("v", "<C-k>", ":move'<-2<CR>gv=gv", opts)
-- Copy selected line
keymap.set("v", "<leader>j", ":copy'<-1<CR>gv", opts)
keymap.set("v", "<leader>k", ":copy'>+0<CR>gv", opts)
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
keymap.set("c", "<C-p>", "<Up>")
keymap.set("c", "<C-n>", "<PageDown>")

-- TERMINAL MODE
keymap.set("t", "<leader>q", "<C-\\><C-n>", opts)
