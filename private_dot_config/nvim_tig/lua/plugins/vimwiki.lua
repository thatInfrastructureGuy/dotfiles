return {
    {
        'vimwiki/vimwiki',
    },
    {
        'michal-h21/vimwiki-sync',
    },
    {
        'michal-h21/vim-zettel',
        config = function()
            vim.cmd [[
                " Markdown - Disable folds
                let g:vim_markdown_folding_disabled = 1
                let g:vimwiki_folding = ''
                let g:vimwiki_tag_format = {'pre': '\(^[ -]*tags\s*: .*\)\@<=', 'pre_mark': '#', 'post_mark': '', 'sep': '>><<'}

                " Set Markdown for VimWiki
                let g:vimwiki_list = [{'path': '~/.config/pkm/',
                                      \ 'index': 'README',
                                      \ 'syntax': 'markdown', 'ext': '.md',
                                      \ 'auto_tags': 1, 'auto_toc': 1,
                                      \ 'links_space_char': '_',
                                      \ 'diary_rel_path': '.',
                                      \ 'list_margin': 0
                                      \ }]
                let g:vimwiki_markdown_link_ext = 1
                let g:vimwiki_use_mouse = 1
                let g:vimwiki_auto_chdir = 1
                let g:vimwiki_listsyms = '✗○◐●✓'
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
                let g:zettel_fzf_command = "rg -L --column --line-number --ignore-case --no-heading --color=always "

                nnoremap <leader>zn :ZettelNew<space>
                nnoremap <leader>zs :ZettelSearch<cr>
                nnoremap <leader>vb :VimwikiBacklinks<cr>
                nnoremap <leader>vh :VimwikiSplitLink<cr>
                nnoremap <leader>vv :VimwikiVSplitLink<cr>
                nnoremap <leader>vt :VimwikiToggleListItem<cr>
                nnoremap <leader>gt :VimwikiRebuildTags!<cr>:VimwikiIndex<cr>:%d<cr>:ZettelGenerateTags<cr>:redraw!<cr>:w<cr>

                let g:sync_taskwarrior = 0
           ]]
        end
    },
}
