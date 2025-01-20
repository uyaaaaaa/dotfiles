local opt = vim.opt

opt.encoding = 'utf-8'
opt.fileencoding = 'utf-8'
opt.number = true
opt.relativenumber = false
opt.confirm = true
-- Tab & Indent
opt.tabstop = 4
opt.shiftwidth = 4
opt.shiftround = true
opt.expandtab = true
opt.smartindent = true
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
function Foldtext()
    local line = vim.fn.getline(vim.v.foldstart)
    return string.format("%s", line)
end
opt.foldlevel = 99
opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
opt.foldtext = "v:lua.Foldtext()"
opt.fillchars = {
    fold = " ",
    foldopen = "",
    foldclose = "",
    foldsep = " ",
}
opt.foldcolumn = "1"

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true

-- View
opt.cursorline = true
opt.background = 'dark'
opt.mouse = 'a'
opt.clipboard = 'unnamedplus'

opt.iskeyword:append("-")

