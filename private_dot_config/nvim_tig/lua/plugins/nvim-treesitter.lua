-- TEMPORARY: testing the "main" branch (full rewrite, requires Neovim 0.12+)
-- to see if it resolves https://github.com/nvim-treesitter/nvim-treesitter/issues/8618
-- without the manual query_predicates.lua compat workaround.
-- "main" does not support lazy-loading, hence lazy = false.
local M = {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        -- List of parsers to ensure are installed
        local parsers_to_install = {
            "bash", "dockerfile", "python", "typescript", "tsx",
            "lua", "vim", "vimdoc", "javascript", "html",
            "terraform", "go", "yaml", "markdown", "markdown_inline"
        }

        local installed = require("nvim-treesitter.config").get_installed("parsers")
        local missing = vim.tbl_filter(function(p)
            return not vim.list_contains(installed, p)
        end, parsers_to_install)

        if #missing > 0 then
            vim.notify("Installing parsers: " .. table.concat(missing, ", "), vim.log.levels.INFO)
            require("nvim-treesitter").install(missing)
        end

        -- Enable highlighting for current and future buffers
        local function start_treesitter()
            local ft = vim.bo.filetype
            local supported = {
                go = true, lua = true, python = true,
                javascript = true, typescript = true,
                javascriptreact = true, typescriptreact = true,
                bash = true, sh = true, html = true,
                terraform = true, vim = true, yaml = true,
                markdown = true
            }

            if supported[ft] and vim.bo.buftype == "" then
                local bufnr = vim.api.nvim_get_current_buf()

                -- Check if parser is actually available before trying to start
                local lang = vim.treesitter.language.get_lang(ft) or ft
                local has_parser = pcall(vim.treesitter.language.add, lang)

                if has_parser then
                    -- Stop any existing highlighter first
                    pcall(vim.treesitter.stop, bufnr)
                    -- Start treesitter
                    pcall(vim.treesitter.start, bufnr)
                end
            end
        end

        -- Start for current buffer with a delay
        vim.defer_fn(start_treesitter, 100)

        -- Start for future buffers
        vim.api.nvim_create_autocmd("FileType", {
            callback = start_treesitter,
        })
    end,
}

return { M }
