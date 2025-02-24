-- vim.opt.background: 
   -- It does not set the background to dark.
   -- It tells vim the background is dark.

return { 
    {
        -- Supports multiple colorschemes:
        -- Dark: nightfox duskfox nordfox terafox carbonfox
        -- Light: dayfox dawnfox 
        "EdenEast/nightfox.nvim",
        name = "nightfox",
        enabled = false,
        priority = 1000,
        config = function()
            vim.cmd.colorscheme "carbonfox"
        end,
    },
    {
        "nyoom-engineering/oxocarbon.nvim",
        name = "oxocarbon", -- inspired by IBM Carbon.
        enabled = true,
        priority = 1000,
        config = function()
            vim.opt.background = "dark" -- light or dark
            vim.cmd.colorscheme "oxocarbon"
        end,
    },
    {
        "bluz71/vim-moonfly-colors",
        name = "moonfly",
        enabled = false,
        priority = 1000,
        config = function()
            vim.opt.background = "dark" -- light or dark
            vim.cmd([[colorscheme moonfly]])
        end,
    },
    {
        "scottmckendry/cyberdream.nvim",
        name = "cyberdream",
        enabled = false,
        priority = 1000,
        config = function()
            --vim.opt.background = "dark" -- light or dark
            vim.cmd("colorscheme cyberdream")
        end,
    },
}
