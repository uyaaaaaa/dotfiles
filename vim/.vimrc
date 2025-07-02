set ambiwidth=double
set autoread
set clipboard=unnamed,autoselect
set background=dark
set cursorline
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
set shiftwidth=4
set showmatch matchtime=1
set smartcase
set smartindent
set softtabstop=4
set tabstop=4
set virtualedit=block
set wrapscan

syntax enable

colorscheme retrobox

nnoremap <Esc><Esc> :nohlsearch<CR><ESC>
nnoremap j gj
nnoremap k gk

inoremap <silent> jk <ESC>
