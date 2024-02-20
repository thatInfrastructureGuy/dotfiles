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

"let g:go_metalinter_autosave = 1
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck', 'golangci-lint']

let g:go_auto_sameids = 1

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <Leader>c :update<CR><Plug>(go-coverage-toggle)
autocmd FileType go nmap <leader>t :update<CR><Plug>(go-test)
autocmd FileType go nmap <leader>b :update<CR>:<C-u>call <SID>build_go_files()<CR>
autocmd FileType go imap <Leader>c <Esc>:update<CR><Plug>(go-coverage-toggle)
autocmd FileType go imap <leader>t <Esc>:update<CR><Plug>(go-test)
autocmd FileType go imap <leader>b <Esc>:update<CR>:<C-u>call <SID>build_go_files()<CR>

autocmd FileType go inoremap <buffer> . .<C-x><C-o>
