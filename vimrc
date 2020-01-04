let mapleader = (' ')
syntax enable
filetype plugin indent on

"Line Numbers
set nu
set rnu

"Set Splits
set splitbelow
set splitright

"Set terminal window size
set termwinsize=10x0

"Set highlighted search
set hlsearch

" Navigating the split screens
" Normal Mode
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"Terminal Mode
tnoremap <C-J> <C-W><C-J>
tnoremap <C-K> <C-W><C-K>
tnoremap <C-L> <C-W><C-L>
tnoremap <C-H> <C-W><C-H>

"Visual Mode
vnoremap <c-j> <c-w><c-j>
vnoremap <c-k> <c-w><c-k>
vnoremap <c-l> <c-w><c-l>
vnoremap <c-h> <c-w><c-h>

"Insert Mode
inoremap <C-J> <C-W><C-J>
inoremap <C-K> <C-W><C-K>
inoremap <C-L> <C-W><C-L>
inoremap <C-H> <C-W><C-H>

" Navigating tabs
" Normal Mode
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
nnoremap <C-Down> :tabprevious<CR>
nnoremap <C-Up> :tabnext<CR>

"Terminal Mode
tnoremap <C-Left> :tabprevious<CR>
tnoremap <C-Right> :tabnext<CR>
tnoremap <C-Down> :tabprevious<CR>
tnoremap <C-Up> :tabnext<CR>

"Visual Mode
vnoremap <C-Left> :tabprevious<CR>
vnoremap <C-Right> :tabnext<CR>
vnoremap <C-Down> :tabprevious<CR>
vnoremap <C-Up> :tabnext<CR>

"Insert Mode
inoremap <C-Left> :tabprevious<CR>
inoremap <C-Right> :tabnext<CR>
inoremap <C-Down> :tabprevious<CR>
inoremap <C-Up> :tabnext<CR>

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
setlocal fileformat=unix
" Set hidden to switch between buffers without saving. Useful to run :wall
set hidden

" This file represents the minimal .vimrc needed to work with govim.
"
" We also include a number of suggested settings that we think the majority of
" users will like/prefer.

set nocompatible
set nobackup
set nowritebackup
set noswapfile

filetype plugin on

set mouse=a

" To get hover working in the terminal we need to set ttymouse. See
"
" :help ttymouse
"
" for the appropriate setting for your terminal. Note that despite the
" automated tests using xterm as the terminal, a setting of ttymouse=xterm
" does not work correctly beyond a certain column number (citation needed)
" hence we use ttymouse=sgr
set ttymouse=sgr

" Suggestion: By default, govim populates the quickfix window with diagnostics
" reported by gopls after a period of inactivity, the time period being
" defined by updatetime (help updatetime). Here we suggest a short updatetime
" time in order that govim/Vim are more responsive/IDE-like
set updatetime=500

" Suggestion: To make govim/Vim more responsive/IDE-like, we suggest a short
" balloondelay
set balloondelay=250

" Suggestion: Turn on the sign column so you can see error marks on lines
" where there are quickfix errors. Some users who already show line number
" might prefer to instead have the signs shown in the number column; in which
" case set signcolumn=number
set signcolumn=number

" template file creation
autocmd BufNewFile * silent! 0r `pwd`/%:e.skeleton

" Suggestion: turn on auto-indenting. If you want closing parentheses, braces
" etc to be added, https://github.com/jiangmiao/auto-pairs. In future we might
" include this by default in govim.
set autoindent
set smartindent
filetype indent on

" Suggestion: define sensible backspace behaviour. See :help backspace for
" more details
"set backspace=2 // for vim < 5.4
set backspace=indent,eol,start

" Suggestion: show info for completion candidates in a popup menu
if has("patch-8.1.1904")
  set completeopt+=popup
  set completepopup=align:menu,border:off,highlight:Pmenu
endif

"curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin()
" Golang Plugin
Plug 'fatih/vim-go'

" Session Management Plugins
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }

" Prettify
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'

" Search
Plug 'kien/ctrlp.vim'

"Git Plugins
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Note Taking
Plug 'xolox/vim-notes'
call plug#end()

" Toggle NerdTree
map <C-n> :NERDTreeToggle<CR>
" NerdTree bug: Remove ^G from view
let g:NERDTreeNodeDelimiter = "\u00a0"

"Vim Session Manager
:let g:session_command_aliases = 1
:let g:session_autosave = 'no'

" Notes Directory
:let g:notes_directories = ['~/code/notes/', '~/code/personal/notes']

"Tmux StatusLine
":Tmuxline airline
":TmuxlineSnapshot ~/.vim/statusline.theme