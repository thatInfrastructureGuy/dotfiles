local M = {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ':TSUpdate',
    config = function()
        require('nvim-treesitter').install({
            "bash",
            "dockerfile",
            "python",
            "typescript",
			"lua", 
			"vim",
			"vimdoc",
			"javascript", 
			"html", 
			"terraform", 
			"go",
        })

        vim.api.nvim_create_autocmd("FileType", {
            callback = function()
              pcall(vim.treesitter.start)
            end,
        })

    end
}

return { M }
