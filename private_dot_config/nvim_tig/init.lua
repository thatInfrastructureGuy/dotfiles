vim.g.mapleader = " "
vim.opt.termguicolors = true

require("config.lazy")

-- Clipboard
-- Instead of vim.opt.clipboard = "unnamedplus", being explicit for clipboard usage
vim.keymap.set({"n", "v", "x"}, '<leader>y', '"+y', { noremap = true, silent = true, desc = 'Yank to clipboard' })
vim.keymap.set({"n", "v", "x"}, '<leader>p', '"+p', { noremap = true, silent = true, desc = 'Paste from clipboard' })

-- Cursor settings
-- This works ghostty's cursor-opacity
vim.api.nvim_set_hl(0, "Cursor", {fg='#303030', bg='#909090'})
vim.opt.guicursor = 'n-v-c:block-Cursor/lCursor,i-ci-ve:ver25-Cursor/lCursor,r-cr:hor20,o:hor50'

-- Already default in neovim
vim.opt.compatible = false
vim.opt.syntax = enable
vim.opt.hlsearch = true
vim.opt.encoding = "utf-8"
vim.opt.ruler = true
vim.opt.hidden = true

-- Although set by default, setting it explicitly breaks Lazy.nvim installer
-- Hence, in lazy we have set {install { missing = false }}
vim.opt.fileencoding = "utf-8"
vim.opt.fileformat = "unix"

-- No swapfile/ No backup file
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false

-- Set line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Set filetype for a particular extension or filename
vim.filetype.add{
	extension = {
		hcl = "terraform", 
	},
}

-- Set Splits
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Set scrolls
vim.opt.scrolloff = 9999
vim.opt.sidescrolloff = 9999

-- Highlight cursor row number and column
vim.opt.cursorline = true
vim.opt.cursorlineopt = "both" -- or "number"
vim.opt.cursorcolumn = true

vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set({"n","v"}, "<space>x", ":.lua<CR>")

-- Open buffer in split screen
vim.keymap.set("n","<leader>s", ":ls<CR>:sbuffer<space>")
vim.keymap.set("n","<leader>v", ":ls<CR>:vertical sbuffer<space>")

-- Inbuild fuzzy search
-- Use :find filename -> press <tab> and <enter>
vim.opt.path = ".,,**"
vim.opt.wildmenu = true


-- Show existing tab with 4 spaces width
vim.opt.tabstop = 4
-- When indenting with '>', use 4 spaces width
vim.opt.shiftwidth = 4
-- Control <tab> and <bs> keys to match tabstop
vim.opt.softtabstop = 4
-- On pressing tab, insert 4 spaces
vim.opt.expandtab = true

-- Make hyphen is part of word. Useful for diw/ciw
-- Should appear after set nocompatible
vim.opt.iskeyword="@,48-57,_,192-255,#,-"

vim.opt.mouse="a"

-- Gopass vim credential leakage fix
-- https://github.com/gopasspw/gopass/blob/master/docs/setup.md#securing-your-editor
vim.cmd([[
" neovim on Linux
autocmd BufNewFile,BufRead /dev/shm/gopass* setlocal noswapfile nobackup noundofile shada=""
" neovim on MacOS
autocmd BufNewFile,BufRead /private/**/gopass** setlocal noswapfile nobackup noundofile shada=""
" vim on Linux
autocmd BufNewFile,BufRead /dev/shm/gopass* setlocal noswapfile nobackup noundofile viminfo=""
" vim on MacOS
autocmd BufNewFile,BufRead /private/**/gopass** setlocal noswapfile nobackup noundofile viminfo=""
]])


-- Navigation
-- HJKL is handled by tmux-vim-navigator

-- Resize window using <leader> arrow keys
vim.keymap.set("n", "<leader><Up>", "<cmd>resize +5<cr>", { desc = "Increase Window Height" })
vim.keymap.set("n", "<leader><Down>", "<cmd>resize -5<cr>", { desc = "Decrease Window Height" })
vim.keymap.set("n", "<leader><Left>", "<cmd>vertical resize -5<cr>", { desc = "Decrease Window Width" })
vim.keymap.set("n", "<leader><Right>", "<cmd>vertical resize +5<cr>", { desc = "Increase Window Width" })

-- Move Lines
vim.keymap.set("n", "<A-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
vim.keymap.set("n", "<A-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
vim.keymap.set("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
vim.keymap.set("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
vim.keymap.set("v", "<A-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
vim.keymap.set("v", "<A-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })

-- buffers
vim.keymap.set("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
vim.keymap.set("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })

--  Page Up/Down
-- ctrl + b to move a page screen back or “up”
-- ctrl + f to move a page screen front or “down”
-- ctrl + u to move a ½ page screen up
-- ctrl + d to move a ½ page screen down

-- NetRW
-- Tree like 
vim.keymap.set('n', '<C-N>', ":Lexplore<CR> :vertical resize 30<CR>", { noremap = true })
-- Ctrl+N to open
-- v -> vertical split
-- o -> open
-- s -> sort
   -- R -> reverse sort
-- % -> create file
-- d -> create directory
-- D -> delete directory or file
-- R -> rename
-- Marks
   -- mf -> mark a file
   -- mt -> mark a directory
   -- :copy or :move on marked files
   -- md -> delete marks on all files
-- Suggestion: By default, govim populates the quickfix window with diagnostics
-- reported by gopls after a period of inactivity, the time period being
-- defined by updatetime (help updatetime). Here we suggest a short updatetime
-- time in order that govim/Vim are more responsive/IDE-like
vim.opt.updatetime = 500

-- Display size for messages
vim.opt.cmdheight = 1

-- Suggestion: turn on auto-indenting. If you want closing parentheses, braces
-- etc to be added, https://github.com/jiangmiao/auto-pairs. In future we might
-- include this by default in govim.
vim.opt.autoindent = true -- default in nvim
vim.opt.smartindent = true

-- Suggestion: define sensible backspace behaviour.
vim.opt.backspace = indent,eol,start
