local M = {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",  -- Just update existing parsers on plugin update
    event = { "BufReadPost", "BufNewFile" },
    config = function()
        -- Add treesitter runtime path
        local treesitter_path = vim.fn.stdpath("data") .. "/lazy/nvim-treesitter"
        vim.opt.runtimepath:append(treesitter_path .. "/runtime")

        -- List of parsers to ensure are installed
        local parsers_to_install = {
            "bash", "dockerfile", "python", "typescript", "tsx",
            "lua", "vim", "vimdoc", "javascript", "html",
            "terraform", "go", "yaml"
        }

        -- Install missing parsers asynchronously (only once per session)
        local install_attempted = false
        vim.schedule(function()
            if not install_attempted then
                install_attempted = true
                for _, parser in ipairs(parsers_to_install) do
                    -- Check if parser is installed
                    local parser_path = treesitter_path .. "/parser/" .. parser .. ".so"
                    if vim.fn.filereadable(parser_path) == 0 then
                        vim.notify("Installing " .. parser .. " parser...", vim.log.levels.INFO)
                        vim.cmd("TSInstall " .. parser)
                    end
                end
            end
        end)

        -- Enable highlighting for current and future buffers
        local function start_treesitter()
            local ft = vim.bo.filetype
            local supported = {
                go = true, lua = true, python = true,
                javascript = true, typescript = true,
                javascriptreact = true, typescriptreact = true,
                bash = true, sh = true, html = true,
                terraform = true, vim = true, yaml = true
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
