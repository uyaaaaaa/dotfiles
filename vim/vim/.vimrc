if !&compatible
    set nocompatible
endif

" cursor memory
augroup vimrcEx
  au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
  \ exe "normal g`\"" | endif
augroup END

let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
let s:dein_dir = s:cache_home . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_repo_dir)
    call system('gijt clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif
let &runtimepath = s:dein_repo_dir .",". &runtimepath

let s:toml_file = '~/dotfiles/vim/vim/dein.toml'
if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir)
    call dein#load_toml(s:toml_file)
    call dein#end()
    call dein#save_state()
endif

if has('vim_starting') && dein#check_install()
    call dein#install()
endif

" fern
let g:fern#renderer = 'nerdfont'
let g:fern#default_hidden = 1
let g:fern#renderer#nerdfont#indent_markers = 1

" airline
let g:airline_theme = 'tomorrow'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" highlight yank
let g:highlightedyank_highlight_duration = 150

" auto close tag
let g:closetag_filenames = '*.html,*.vue,*.jsx,*.tsx'

" cursor style
let &t_SI .= "\e[5 q"
let &t_EI .= "\e[1 q"

set ambiwidth=double
set autoread
set background=light
set clipboard=unnamed,autoselect
set cursorline
set display=lastline
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
set pumheight=20
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

colorscheme shine

" NORMAL MODE
nnoremap <Esc><Esc> :nohlsearch<CR><ESC>
nnoremap j gj
nnoremap k gk
nnoremap Y y$
nnoremap + <C-a>
nnoremap - <C-x>
nnoremap <C-.> <C-w>2>
nnoremap <C-,> <C-w>2<
nnoremap <silent> <C-n> :Fern . -reveal=% -drawer -toggle -width=55<CR>
nnoremap <silent> <C-h> <C-w>h
nnoremap <silent> <C-l> <C-w>l
nnoremap <silent> <C-j> :move+{v:count1}<CR>=l
nnoremap <silent> <C-k> :move-1-{v:count1}<CR>=l

" INSERT MODE
inoremap <silent> jk <ESC>

" VISUAL MODE
vnoremap <silent> <C-j> :move'>+1<CR>gv=gv
vnoremap <silent> <C-k> :move'<-2<CR>gv=gv

