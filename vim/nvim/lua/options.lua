local opt = vim.opt

opt.encoding = 'utf-8'
opt.fileencoding = 'utf-8'
opt.number = true
opt.relativenumber = false
opt.confirm = true
opt.clipboard = 'unnamedplus'
-- Tab & Indent
opt.tabstop = 4
opt.shiftwidth = 4
opt.shiftround = true
opt.expandtab = true
opt.autoindent = true  -- apply indent for new line
opt.laststatus = 3
opt.linebreak = true
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }
opt.sidescrolloff = 8
opt.splitright = true
opt.timeoutlen = vim.g.vscode and 1000 or 300
opt.undofile = true
opt.undolevels = 10000
opt.wrap = false

-- Fold
opt.fillchars = {
    foldopen = "",
    foldclose = "",
    fold = " ",
    foldsep = " ",
    diff = "╱",
    eob = " ",
}
_G.fcs = opt.fillchars:get()
opt.foldlevel = 99
opt.foldcolumn = "1"
opt.smoothscroll = true
opt.foldexpr = "v:lua.require'utils.ui'.foldexpr()"
opt.foldmethod = "expr"
opt.foldtext = ""

-- statuscol
opt.signcolumn = 'yes'
opt.statuscolumn = "%!v:lua.require'snacks.statuscolumn'.get()"

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true

-- View
opt.cursorline = true
opt.termguicolors = true
opt.background = 'dark'
opt.mouse = 'a'
opt.pumblend = 20  -- popup window

-- completion
opt.completeopt = { "menu", "menuone", "noselect" }

-- tabline (Over Neotree)
opt.showtabline = 2

opt.iskeyword:append("-")
opt.wildignore:append({ "*/node_modules/*" })
