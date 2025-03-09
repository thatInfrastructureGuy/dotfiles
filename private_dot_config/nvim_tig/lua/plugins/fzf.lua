local M = {
  "ibhagwan/fzf-lua",
  dependencies = { "echasnovski/mini.icons" },
  -- dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    grep = {
      rg_opts = "-L --column --ignore-case --stats --line-number --no-heading --color=always --hidden --smart-case -g '!{**/node_modules/*,**/.git/*,vendor}' --max-columns=4096 -e",
    }
  },
  config = function(_, opts)
    require("fzf-lua").setup(opts)
  end,
}

return { M }
