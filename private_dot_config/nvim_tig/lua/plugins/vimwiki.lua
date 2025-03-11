return {
    {
        'vimwiki/vimwiki',
        enabled = false,
    },
    {
        'michal-h21/vimwiki-sync',
        enabled = false,
    },
    {
        'michal-h21/vim-zettel',
        enabled = false,
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
    {
        "zk-org/zk-nvim",
        config = function()
            require("zk").setup({
                -- Can be "telescope", "fzf", "fzf_lua", "minipick", "snacks_picker",
                -- or select" (`vim.ui.select`). It's recommended to use "telescope",
                -- "fzf", "fzf_lua", "minipick", or "snacks_picker".
                picker = "fzf_lua",

                lsp = {
                    -- `config` is passed to `vim.lsp.start_client(config)`
                    config = {
                        cmd = { "zk", "lsp" },
                        name = "zk",
                        -- on_attach = ...
                        -- etc, see `:h vim.lsp.start_client()`
                    },

                    -- automatically attach buffers in a zk notebook that match the given filetypes
                    auto_attach = {
                        enabled = true,
                        filetypes = { "markdown" },
                    },
                },
            })
        end
    },
}
