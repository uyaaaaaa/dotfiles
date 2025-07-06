if !&compatible
    set nocompatible
endif

let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
let s:dein_dir = s:cache_home . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_repo_dir)
    call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif
let &runtimepath = s:dein_repo_dir .",". &runtimepath

let s:toml_file = '~/dotfiles/vim/dein.toml'
if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir)
    call dein#load_toml(s:toml_file)
    call dein#end()
    call dein#save_state()
endif

if has('vim_starting') && dein#check_install()
    call dein#install()
endif

set ambiwidth=double
set autoread
set background=dark
set clipboard=unnamed,autoselect
set cursorline
set encoding=utf-8
set expandtab
set fenc=utf-8
set guioptions+=a
set history=10000
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set nobackup
set noerrorbells
set noswapfile
set number
set relativenumber
set shiftwidth=4
set showmatch matchtime=1
set smartcase
set smartindent
set smarttab
set softtabstop=4
set tabstop=4
set virtualedit=block
set wrapscan

syntax enable

colorscheme habamax

nnoremap <Esc><Esc> :nohlsearch<CR><ESC>
nnoremap j gj
nnoremap k gk

inoremap <silent> jk <ESC>

