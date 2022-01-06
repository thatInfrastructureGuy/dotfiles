let mapleader = (',')
syntax enable
filetype plugin indent on

" Line Numbers
set number
set relativenumber

" Set Splits
set splitbelow
set splitright

" Get contents of all vim registers use ':registers'

" Set terminal window size
set termwinsize=10x0

" Set highlighted search
set hlsearch

" Change how vim represents characters on the screen
set encoding=utf-8

" Set the encoding of files written
set fileencoding=utf-8

" See context when scrolling up/down right/left
" set scrolloff=9999
" set sidescrolloff=9999

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

" Move lines up down with Alt+k and Alt+j 
" Linux bindings
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Mac bindings
nnoremap â :m .+1<CR>==
nnoremap Ë :m .-2<CR>==
inoremap â <Esc>:m .+1<CR>==gi
inoremap Ë <Esc>:m .-2<CR>==gi
vnoremap â :m '>+1<CR>gv=gv
vnoremap Ë :m '<-2<CR>gv=gv

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
set signcolumn=yes

" Better display for messages
set cmdheight=2

" don't give |ins-completion-menu| messages.
set shortmess+=c

" Maintain undo history between sessions
set undofile
set undodir=~/.vim/undodir

" Suggestion: turn on auto-indenting. If you want closing parentheses, braces
" etc to be added, https://github.com/jiangmiao/auto-pairs. In future we might
" include this by default in govim.
set autoindent
set smartindent

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

" General Syntax Highlighting
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }

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

" Change surronding paranthesis/brackets/tags etc
Plug 'tpope/vim-surround'

"Git Plugins
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Markdown
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

" Vim Wiki
Plug 'vimwiki/vimwiki'
Plug 'michal-h21/vimwiki-sync'
Plug 'mattn/calendar-vim'

" Zettlekasten builds on vimwiki
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'michal-h21/vim-zettel'

" Add License
Plug 'antoyo/vim-licenses'

" Custom Colors
Plug 'bluz71/vim-moonfly-colors'
Plug 'fatih/molokai'

" Undo Tree
Plug 'mbbill/undotree'

"Comment Toggle
Plug 'preservim/nerdcommenter'

"Interact with tmux
Plug 'preservim/vimux'

"Jsonnet
Plug 'google/vim-jsonnet'
call plug#end()

" Markdown - Disable folds
let g:vim_markdown_folding_disabled = 1

" Set Markdown for VimWiki
let g:vimwiki_list = [{'path': '~/code/notes/',
                      \ 'syntax': 'markdown', 'ext': '.md',
                      \ 'auto_tags': 1, 'auto_toc': 1,
                      \ 'links_space_char': '_'
                      \ }]
let g:vimwiki_use_mouse = 1
let g:vimwiki_auto_chdir = 1
autocmd FileType vimwiki setlocal syntax=markdown

" Diary
command! Diary VimwikiDiaryIndex
augroup vimwikigroup
    autocmd!
    " automatically update links on read diary
    autocmd BufRead,BufNewFile diary.md VimwikiDiaryGenerateLinks
augroup end

" vim-zettel
let g:zettel_format = "%y%m%d-%H%M-%file_no-%title"
let g:zettel_options = [{"front_matter" : [["tags", ""], ["citations", ""]], "template" :  "~/code/dotfiles/vim/zettel.tpl"}]
let g:zettel_fzf_command = "rg --column --line-number --ignore-case "
     \ "--no-heading --color=always "
nnoremap <leader>zn :ZettelNew<space>
nnoremap <leader>vt :VimwikiSearchTags<space>
nnoremap <leader>vs :VimwikiSearch<space>
nnoremap <leader>zs :ZettelSearch<cr>
nnoremap <leader>bl :VimwikiBacklinks<cr>
nnoremap <leader>gt :VimwikiRebuildTags!<cr>:VimwikiIndex<cr>:%d<cr>:ZettelGenerateTags<cr>:w<cr>

" See https://github.com/michal-h21/vimwiki-sync#taskwiki-support
let g:sync_taskwarrior = 0

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

" UndoTree Toggle
nnoremap <leader>u :UndotreeToggle<cr>
if has("persistent_undo")
    set undodir=$HOME."/.undodir"
    set undofile
endif

" Custom Colors Settings
set termguicolors
let g:rehash256 = 1
let g:molokai_original = 1
colorscheme molokai

augroup file_type
    autocmd!
    autocmd BufRead,BufNewFile *.go setfiletype go
    autocmd BufRead,BufNewFile *.proto setfiletype proto
    " template file creation
    autocmd BufNewFile * silent! 0r `pwd`/%:e.skeleton
augroup END

" LicenseFile
"command! License call InsertLicense('licenseFile')
let g:licenses_copyright_holders_name = 'Kulkarni, Ashish <thatInfrastructureGuy@gmail.com>'
let g:licenses_authors_name='Ashish Kulkarni'

" Toggle NerdTree
map <C-n> :NERDTreeToggle<CR>
" NerdTree bug: Remove ^G from view
let g:NERDTreeNodeDelimiter = "\u00a0"

"Vim Session Manager
:let g:session_command_aliases = 1
:let g:session_autosave = 'no'

" Autocomplete prompt whenever you press the dot (.)
set completeopt+=menuone,noselect,noinsert

let g:netrw_dirhistmax=0
let g:netrw_liststyle=3

" FzF mapping
nnoremap <C-f> :Files<Cr>
nnoremap <C-g> :Rg<Cr>

" Vim encrypt text blocks with gpg.
" gpg.conf is pointing to default "self" recipient
xnoremap <leader>e :!gpg --encrypt --armor --recipient thatInfrastructureGuy@gmail.com<CR>
xnoremap <leader>d :!gpg -dq<CR><bar>:redraw!<CR> 
