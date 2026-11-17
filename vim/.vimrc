set nocompatible
set termguicolors
set number
set clipboard=unnamedplus
set wrap
set noexpandtab
set shiftwidth=2
set tabstop=4

set hlsearch
set cursorline
set ignorecase
set smartcase

set background=dark
set laststatus=2
colorscheme one
syntax on

set list

set lcs+=space:·
set lcs-=eol:$
set lcs+=tab:\|\ 

let g:lightline = {
      \ 'colorscheme': 'one',
      \ }
