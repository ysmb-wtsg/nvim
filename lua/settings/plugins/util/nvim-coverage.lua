return {
  "andythigpen/nvim-coverage",
  requires = "nvim-lua/plenary.nvim",
  config = function()
    local coverage = require("coverage")
    coverage.setup({
      auto_reload = true,
    })
    vim.keymap.set("n", "<leader>cl", function()
      coverage.load(true)
    end, { desc = "Toggle coverage report" })
    vim.keymap.set("n", "<leader>ct", function()
      coverage.toggle()
    end, { desc = "Toggle coverage report" })
    vim.keymap.set("n", "<leader>cs", "<cmd>CoverageSummary<CR>", { desc = "Show coverage summary" })
  end,
}
