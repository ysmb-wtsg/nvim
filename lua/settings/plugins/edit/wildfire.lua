return {
  "sustech-data/wildfire.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("wildfire").setup()
  end,
}
