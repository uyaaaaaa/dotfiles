local opt = vim.opt

opt.encoding = 'utf-8'
opt.fileencoding = 'utf-8'
opt.number = true
opt.relativenumber = false

-- Tab & Indent
opt.tabstop = 4
opt.shiftwidth = 4
opt.shiftround = true
opt.expandtab = true
opt.smartindent = true
opt.autoindent = true  -- apply indent for new line

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

