return {
    -- Render Markdown
    {
        'MeanderingProgrammer/render-markdown.nvim',
        dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
        ---@module 'render-markdown'
        ---@type render.md.UserConfig
        opts = {},
    },
    -- ZK Specific nvim bindings
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
