" Custom govim settings 
nmap <silent> <buffer> <Leader>h : <C-u>call GOVIMHover()<CR>
call govim#config#Set("CompleteUnimported", 1) " 1 => true

nmap <silent> <buffer> <F2> :execute "GOVIMQuickfixDiagnostics" ^V| cw ^V| if len(getqflist()) > 0 && getwininfo(win_getid())[0].quickfix == 1 ^V| :wincmd p ^V| endif<CR>
imap <silent> <buffer> <F2> <C-O>:execute "GOVIMQuickfixDiagnostics" ^V| cw ^V| if len(getqflist()) > 0 && getwininfo(win_getid())[0].quickfix == 1 ^V| :wincmd p ^V| endif<CR>

