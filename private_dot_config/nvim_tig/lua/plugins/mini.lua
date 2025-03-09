return {
    {
        'echasnovski/mini.nvim',
        enabled = true,
        version = false,
        config = function()
            require("mini.statusline").setup()
            require("mini.surround").setup()
            require("mini.git").setup()
            require("mini.diff").setup({
                view = {
                    style = vim.go.number and 'number' or 'sign',
                    signs = { add = '+', change = '~', delete = '-' },
                },
            })
            require("mini.icons").setup()
            require("mini.animate").setup()
            require("mini.indentscope").setup()
        end,
    },
}

--  mappings = {
--     add = 'sa', -- Add surrounding in Normal and Visual modes
--     delete = 'sd', -- Delete surrounding
--     find = 'sf', -- Find surrounding (to the right)
--     find_left = 'sF', -- Find surrounding (to the left)
--     highlight = 'sh', -- Highlight surrounding
--     replace = 'sr', -- Replace surrounding
--     update_n_lines = 'sn', -- Update `n_lines`
--
--     suffix_last = 'l', -- Suffix to search with "prev" method
--     suffix_next = 'n', -- Suffix to search with "next" method
--  },
