let mapleader = (' ')
set nocompatible
syntax enable
filetype plugin indent on
set backspace=indent,eol,start

"Line Numbers
set nu
set rnu

"Set highlighted search
set hlsearch

" Navigating the split screens
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Inbuilt fuzzy search
set path+=**
set wildmenu 

" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
" Set ruler
set ruler

autocmd BufNewFile * silent! 0r `pwd`/%:e.skeleton
