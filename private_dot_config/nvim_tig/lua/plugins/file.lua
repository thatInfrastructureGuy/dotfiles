local M = {
    'stevearc/oil.nvim',
    -- Optional dependencies
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    keys = {
        { "-", "<CMD>Oil<CR>", desc = "Open parent directory" },
    },
    opts = {
        default_file_explorer = true,
        view_options = {
            show_hidden = false,
        },
        preview = {
            border = "rounded",
            update_on_cursor_moved = true,
        },
        keymaps = {
            ["g?"] = "actions.show_help",
            ["<CR>"] = "actions.select",
            ["<C-v>"] = "actions.select_vsplit",
            ["<C-h>"] = "actions.select_split",
            ["<C-p>"] = "actions.preview",  -- Use Ctrl-p to toggle preview
            ["-"] = "actions.parent",
            ["_"] = "actions.open_cwd",
            ["q"] = "actions.close",
        },
    },
}

return { M }
