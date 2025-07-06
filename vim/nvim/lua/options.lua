local opt = vim.opt

opt.encoding = "utf-8"
opt.fileencoding = "utf-8"
opt.number = true
opt.relativenumber = false
opt.confirm = true
opt.clipboard = "unnamedplus"
opt.updatetime = 1000
-- Tab & Indent
opt.tabstop = 4
opt.shiftwidth = 4
opt.shiftround = true
opt.expandtab = true
opt.autoindent = true -- apply indent for new line
opt.laststatus = 3
opt.linebreak = true
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }
opt.sidescrolloff = 8
opt.splitright = true
opt.timeoutlen = vim.g.vscode and 1000 or 300
opt.undofile = true
opt.undolevels = 10000
opt.wrap = false
opt.pumheight = 20

-- Fold
opt.fillchars = {
    foldopen = "",
    foldclose = "",
    fold = " ",
    foldsep = " ",
    diff = "╱",
    eob = " ",
}
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldenable = true
opt.foldcolumn = "1"
opt.foldtext = ""

-- Swapfile
opt.swapfile = false

-- statuscol
opt.signcolumn = "yes"
opt.statuscolumn = "%!v:lua.require'snacks.statuscolumn'.get()"

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true

-- View
opt.cursorline = true
opt.termguicolors = true
opt.background = "dark"
opt.mouse = "a"
opt.pumblend = 20 -- popup window

-- completion
opt.completeopt = { "menu", "menuone", "noselect" }

opt.iskeyword:append("-")
opt.wildignore:append({ "*/node_modules/*" })
