local M = { 
    'echasnovski/mini.statusline', 
    version = '*',
    config = function()
        local statusline = require("mini.statusline")
        statusline.setup()
    end,
}

return { M }
