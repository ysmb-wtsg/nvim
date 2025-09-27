return {
  "ysmb-wtsg/gtd.nvim",
  dependencies = { "MunifTanjim/nui.nvim" },
  keys = { { "<leader>tt", "<cmd>GtdOpen<CR>", desc = "Open GTD Modal" } },
  config = function()
    require("gtd").setup()
  end,
}
