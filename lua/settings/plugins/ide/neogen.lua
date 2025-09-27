return {
  "danymat/neogen",
  config = function()
    require("neogen").setup({ snippet_engine = "luasnip" })
    vim.keymap.set("n", "dc", "<cmd>Neogen<CR>", { desc = "Generate docstring" })
  end,
  version = "*",
}
