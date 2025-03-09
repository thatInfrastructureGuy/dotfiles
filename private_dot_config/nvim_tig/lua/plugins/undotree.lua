return {
  "mbbill/undotree",
  event = "VeryLazy",
  config = function()
    vim.keymap.set("n", "<leader>u", "<cmd>UndotreeToggle<CR>", { desc = "Undo Tree" })
  end,
}

