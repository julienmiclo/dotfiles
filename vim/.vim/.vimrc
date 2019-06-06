syntax on
color dracula
set autoindent
set backspace=indent,eol,start
set hidden
set hlsearch
set laststatus=2
set noshowmode
set mouse=a
set noundofile
set wildmenu
set autochdir
set noswapfile
set clipboard=unnameplus
set nocompatible
filetype plugin on
set encoding=utf-8


set path=.,**
nnoremap <leader>f :find *
nnoremap <leader>s :sfind *
nnoremap <leader>v :vert sfind *
nnoremap <leader>t :tabfind *

autocmd BufWritePre * %s/\s\+$//e
autocmd BufWritePost .config.h,.config.def.h !sudo make install
autocmd BufWritePost ~/.Xresources,~/.Xdefaults !xrdb %

