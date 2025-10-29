-- Setup abbreviations
vim.cmd([[
    "Insert mode
    iabbrev ymd <C-R>=strftime("%Y%m%d")<CR>
    iabbrev ymd- <C-R>=strftime("%Y-%m-%d")<CR>
    iabbrev ymd_ <C-R>=strftime("%Y%m%d_")<CR>

    "Command mode
    cabbrev <expr> w] (getcmdtype() ==# ":" && getcmdline() ==# "w]") ? "w" : "w]"
    cabbrev <expr> w (getcmdtype() ==# ":" && getcmdline() ==# "'<,'>w") ? "\<C-u>w" : "w"
    cnoreabbrev <expr> s getcmdtype() .. getcmdline() ==# ':s' ? [getchar(), ''][1] .. "%s///g<Left><Left>" : 's'
]])
