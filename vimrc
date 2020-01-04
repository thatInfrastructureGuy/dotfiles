let mapleader = (' ')
syntax enable
filetype plugin indent on

" Line Numbers
set nu
set rnu

" Set Splits
set splitbelow
set splitright

" Set terminal window size
set termwinsize=10x0

" Set highlighted search
set hlsearch

" Change how vim represents characters on the screen
set encoding=utf-8

" Set the encoding of files written
set fileencoding=utf-8


" Navigating the split screens
" Normal Mode
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Terminal Mode
tnoremap <C-J> <C-W><C-J>
tnoremap <C-K> <C-W><C-K>
tnoremap <C-L> <C-W><C-L>
tnoremap <C-H> <C-W><C-H>

" Visual Mode
vnoremap <c-j> <c-w><c-j>
vnoremap <c-k> <c-w><c-k>
vnoremap <c-l> <c-w><c-l>
vnoremap <c-h> <c-w><c-h>

" Insert Mode
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

" Terminal Mode
tnoremap <C-Left> :tabprevious<CR>
tnoremap <C-Right> :tabnext<CR>
tnoremap <C-Down> :tabprevious<CR>
tnoremap <C-Up> :tabnext<CR>

" Visual Mode
vnoremap <C-Left> :tabprevious<CR>
vnoremap <C-Right> :tabnext<CR>
vnoremap <C-Down> :tabprevious<CR>
vnoremap <C-Up> :tabnext<CR>

" Insert Mode
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

" control <tab> and <bs> keys to match tabstop
set softtabstop=4

" On pressing tab, insert 4 spaces
set expandtab

" Set ruler
set ruler

" Set line endings in unix format
set fileformat=unix

" Set hidden to switch between buffers without saving. Useful to run :wall
set hidden

" This file represents the minimal .vimrc needed to work with govim.
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

" Better display for messages
set cmdheight=2

" don't give |ins-completion-menu| messages.
set shortmess+=c

" Maintain undo history between sessions
set undofile
set undodir=~/.vim/undodir

" template file creation
autocmd BufNewFile * silent! 0r `pwd`/%:e.skeleton

" Suggestion: turn on auto-indenting. If you want closing parentheses, braces
" etc to be added, https://github.com/jiangmiao/auto-pairs. In future we might
" include this by default in govim.
set autoindent
set smartindent
filetype indent on

" Suggestion: define sensible backspace behaviour.
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
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

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

" Autocomplete prompt whenever you press the dot (.)
set completeopt+=menuone,noselect,noinsert
au filetype go inoremap <buffer> . .<C-x><C-o>

"Tmux StatusLine
":Tmuxline airline
":TmuxlineSnapshot ~/.vim/statusline.theme

" ctrl-p
let g:ctrlp_regexp = 1
let g:ctrlp_working_path_mode = 'r'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
let g:netrw_dirhistmax=0
let g:netrw_liststyle=3

" Vim-Go settings
" Run goimports along gofmt on each save
let g:go_fmt_command = "goimports"
" Automatically get signature/type info for object under cursor
let g:go_auto_type_info = 1

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_generate_tags = 1

let g:go_metalinter_autosave = 1
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
