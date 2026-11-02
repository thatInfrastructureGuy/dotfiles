local M = {
    "neovim/nvim-lspconfig",
    ft = { "go", "lua", "python", "javascript", "typescript", "javascriptreact", "typescriptreact", "terraform" },
    dependencies = {
        {
            "folke/lazydev.nvim",
            ft = "lua", -- only load on lua files
            opts = {
                library = {
                    -- See the configuration section for more details
                    -- Load luvit types when the `vim.uv` word is found
                    { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                },
            },
        },
        {
            'saghen/blink.cmp',
        },
    },
    config = function()
        -- Use modern vim.lsp.config API (Neovim 0.11+)
        -- Configure LSP servers
        vim.lsp.config.gopls = {
            settings = {
                gopls = {
                    gofumpt = true,              -- stricter gofmt
                    staticcheck = true,          -- staticcheck diagnostics (bug/simplify/perf hints)
                    vulncheck = "Imports",       -- flag calls to known-vulnerable dependencies
                    analyses = {
                        unusedparams = true,
                        unusedwrite = true,
                        nilness = true,
                        shadow = true,
                    },
                    hints = {                    -- inlay hints
                        compositeLiteralFields = true,
                        parameterNames = true,
                        assignVariableTypes = true,
                        functionTypeParameters = true,
                    },
                },
            },
        }
        vim.lsp.config.golangci_lint_ls = {}
        vim.lsp.config.lua_ls = {}
        vim.lsp.config.pyright = {}
        vim.lsp.config.ts_ls = {}
        vim.lsp.config.terraformls = {
            cmd = { "terraform-ls", "serve" },
        }

        -- Helper function to enable LSP for current buffer
        local function enable_lsp_for_filetype()
            local ft = vim.bo.filetype

            if ft == "go" then
                vim.lsp.enable("gopls")
                vim.lsp.enable("golangci_lint_ls")
            elseif ft == "lua" then
                vim.lsp.enable("lua_ls")
            elseif ft == "python" then
                vim.lsp.enable("pyright")
            elseif ft == "javascript" or ft == "typescript" or ft == "javascriptreact" or ft == "typescriptreact" then
                vim.lsp.enable("ts_ls")
            elseif ft == "terraform" then
                vim.lsp.enable("terraformls")
            end
        end

        -- Enable LSP for the current buffer (in case plugin loaded on FileType)
        enable_lsp_for_filetype()

        -- Enable LSP for future buffers
        vim.api.nvim_create_autocmd("FileType", {
            pattern = { "go", "lua", "python", "javascript", "typescript", "javascriptreact", "typescriptreact", "terraform" },
            callback = enable_lsp_for_filetype,
        })

        -- Format on save (gopls formats + fixes imports)
        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(args)
                local client = vim.lsp.get_client_by_id(args.data.client_id)
                if client and client:supports_method("textDocument/formatting") then
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        buffer = args.buf,
                        callback = function()
                            vim.lsp.buf.format({ bufnr = args.buf })
                        end,
                    })
                end
            end,
        })
    end,
}

return { M }
