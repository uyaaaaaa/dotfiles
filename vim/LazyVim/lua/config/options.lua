local opt = vim.opt

opt.relativenumber = false -- Relative line numbers

-- search settings
opt.ignorecase = true
opt.smartcase = true

opt.tabstop = 4
opt.expandtab = true
opt.shiftwidth = 4
opt.smartindent = true
opt.shiftround = true

opt.iskeyword:append("-")

-- LSP config
vim.g.lazyvim_php_lsp = "intelephense"
