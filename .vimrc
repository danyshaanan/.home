
" type `:help <option>` to view vi's help text about that option

set nocompatible
syntax on
set number

filetype on
filetype plugin on
filetype indent on

set autoread
set encoding=utf-8
set fileencoding=utf-8

set backspace=indent,eol,start

set fileformat=unix
set fileformats=unix,dos
set viminfo='100,f1
set lazyredraw

set nobackup
set writebackup
set noswapfile

set incsearch
set hlsearch

set scrolloff=3

set expandtab
" set autoindent
" set smartindent
set tabstop=2
set softtabstop=2
set smarttab
set shiftwidth=2
set shiftround

"map <Up> k
"map <Down> j
"map <Left> h
"map <Right> l
"map <Home> 0
"map <End> $
"map <PageUp> 30k
"map <PageDown> 31j

autocmd Filetype gitcommit setlocal spell

" spell checking colors

hi clear SpellLocal
hi SpellLocal cterm=underline
hi clear SpellBad
hi SpellBad ctermbg=White ctermfg=Black
