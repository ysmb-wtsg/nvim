return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("todo-comments").setup()
    vim.keymap.set("n", "<leader>ft", ":TodoTelescope keywords=TODO<CR>", { desc = "Telescope TODO" })
  end,
}
