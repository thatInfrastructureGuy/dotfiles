vim.g.mapleader = " "
vim.opt.termguicolors = true

require("config.lazy")
require("config.autocmds")

-- Clipboard
-- Instead of vim.opt.clipboard = "unnamedplus", being explicit for clipboard usage
vim.keymap.set({ "n", "v", "x" }, '<leader>y', '"+y', { noremap = true, silent = true, desc = 'Yank to clipboard' })
vim.keymap.set({ "n", "v", "x" }, '<leader>p', '"+p', { noremap = true, silent = true, desc = 'Paste from clipboard' })

-- Cursor settings
-- This should be first set in ghostty's cursor-opacity
vim.opt.guicursor = 'n-v-c:block-Cursor/lCursor,i-ci-ve:ver25-Cursor/lCursor,r-cr:hor20,o:hor50'
--vim.api.nvim_set_hl(0, "Cursor", {fg='#303030', bg='#909090'})

-- Already default in neovim
vim.opt.compatible = false
vim.opt.syntax = "enable"
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
vim.filetype.add {
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

vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>") -- current file
vim.keymap.set({ "n", "v" }, "<space>x", ":.lua<CR>")       -- current line

-- Open buffer in split screen
vim.keymap.set("n", "<leader>bs", ":ls<CR>:sbuffer<space>")
vim.keymap.set("n", "<leader>bv", ":ls<CR>:vertical sbuffer<space>")

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
vim.opt.iskeyword = "@,48-57,_,192-255,#,-"

vim.opt.mouse = "a"

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

-- NOTE: DO NOT USE <S-j> or <S-k> since they have inbuilt use cases.
-- <S-j> move next line up
-- <S-k> in manpages, go to definition

-- Buffers
vim.keymap.set("n", "<leader>k", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
vim.keymap.set("n", "<leader>j", "<cmd>bnext<cr>", { desc = "Next Buffer" })

-- Tabs
vim.keymap.set("n", "<leader>h", "<cmd>tabprevious<CR>", { noremap = true, silent = true, desc = "Prev Tab" })
vim.keymap.set("n", "<leader>l", "<cmd>tabnext<CR>", { noremap = true, silent = true, desc = "Next Tab" })

--  Page Up/Down
-- ctrl + b to move a page screen back or “up”
-- ctrl + f to move a page screen front or “down”
-- ctrl + u to move a ½ page screen up
-- ctrl + d to move a ½ page screen down

-- Disable NetRW in Lazy. Instead use Oil
vim.keymap.set("n", "-", "<CMD>Oil --preview<CR>", { desc = "Open parent directory" })

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
vim.opt.updatetime  = 500

-- Display size for messages
vim.opt.cmdheight   = 1

-- Suggestion: turn on auto-indenting. If you want closing parentheses, braces
-- etc to be added, https://github.com/jiangmiao/auto-pairs. In future we might
-- include this by default in govim.
vim.opt.autoindent  = true -- default in nvim
vim.opt.smartindent = true

-- Suggestion: define sensible backspace behaviour.
vim.opt.backspace   = indent, eol, start

-- Maintain undo history between sessions
vim.opt.undofile    = true
vim.opt.undodir     = vim.fn.stdpath("data") .. "/undodir"

-- Opening multiple files
-- $ vim file1.txt file2.txt -- buffers
-- $ vim -o file1.txt file2.txt -- horizontal splits
-- $ vim -O file1.txt file2.txt -- vertical splits
-- $ vim -p file1.txt file2.txt -- tabs
--
-- Operations on multiple files
-- :windo (all windows in the current tab)
-- :bufdo (all buffers, i.e. all those listed with the :ls command)
-- :argdo (all files in argument list)
-- :cdo (all files listed in the quickfix list)
-- :tabdo (all tabs)
--
--  Eg: `:tabdo %s/pattern/replace/gc`


-- FzF mapping
vim.keymap.set("n", "<leader>ff", function() require("fzf-lua").files() end, { silent = true, desc = 'Fzf File Search' })
vim.keymap.set("n", "<leader>fg", require("fzf-lua").live_grep, { silent = true, desc = 'Fzf Word Search' })
vim.keymap.set("n", "<leader>fb", function() require("fzf-lua").resume() end,
	{ silent = true, desc = 'Fzf Resume Search' })

-- complete names with path: files or directories -- no preview
vim.keymap.set(
	{ "n", "v", "i" }, "<C-x><C-d>",
	function() require("fzf-lua").complete_path() end,
	{ silent = true, desc = "Fuzzy complete path" }
)

-- complete names with path: files only with preview
vim.keymap.set({ "i" }, "<C-x><C-f>",
	function()
		require("fzf-lua").complete_file({
			cmd = "rg --files",
			winopts = { preview = { hidden = false } },
		})
	end,
	{ silent = true, desc = "Fuzzy complete file" }
)

-- Vim encrypt text blocks with gpg.
-- gpg.conf is pointing to default "self" recipient
vim.keymap.set({ "n", "v" }, '<leader>e', ':!gpg --encrypt --yes --always-trust --armor <CR>',
	{ noremap = true, silent = true, desc = 'GPG Encrypt' })
vim.keymap.set({ "v" }, '<leader>d', ":!gpg -dq<CR>", { noremap = true, desc = 'GPG Decrypt' })
vim.keymap.set({ "n" }, '<leader>d', ":%!gpg -dq<CR>", { noremap = true, desc = 'GPG Decrypt' })
-- vim.cmd([[
-- xnoremap <leader>e :!gpg --encrypt --armor --recipient thatInfrastructureGuy@gmail.com<CR>
-- xnoremap <leader>d :!gpg -dq<CR>
-- ]])


-- To enable global statusline use laststatus = 3
-- https://www.youtube.com/watch?v=jH5PNvJIa6o
vim.opt.laststatus = 2

-- https://www.reddit.com/r/neovim/comments/1dtcplk/winseparator_and_vertsplit/
vim.api.nvim_set_hl(0, 'WinSeparator', { fg = '#ffaaff', bg = 'None' })

-- https://www.youtube.com/watch?v=ooTcnx066Do
vim.api.nvim_create_autocmd('TermOpen', {
	group = vim.api.nvim_create_augroup('TERMOPEN', { clear = true }),
	callback = function()
		vim.opt.number = false
		vim.opt.relativenumber = false
	end,
})

local job_id = 0
vim.keymap.set(
	"n",
	'<leader>to',
	function()
		vim.cmd.vnew()
		vim.cmd.term()
		vim.cmd.wincmd("J")
		vim.api.nvim_win_set_height(0, 10)
		job_id = vim.bo.channel
	end,
	{ desc = "Terminal Open" }
)

vim.keymap.set(
	"n",
	'<leader>tc',
	function()
		vim.fn.chansend(job_id, { "clear && go test -v ./...\r\n" })
	end,
	{ desc = "Terminal Command" }
)

vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], { noremap = true, silent = true })

vim.diagnostic.config({
    --virtual_lines = true,
    virtual_text = true,
    severity_sort = true,
    underline = true,

})

-- Enable LSPs
vim.lsp.enable({
    "gopls",
    "lua_ls"
})

-- LSP jump to func definition
vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('UserLspConfig', {}),
	callback = function(ev)
		vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = ev.buf })
	end,
})
