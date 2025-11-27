return {
  "lmantw/themify.nvim",
  lazy = false,
  priority = 999,
  config = function()
    require("themify").setup({
      { "Shatur/neovim-ayu",       branch = "master" },
      "folke/tokyonight.nvim",
      "catppuccin/nvim",
      { "tiagovla/tokyodark.nvim", branch = "master" },
      {
        "ricardoraposo/nightwolf.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
      },
      { "rebelot/kanagawa.nvim" }
    })
    vim.keymap.set("n", "<leader>fc", "<cmd>Themify<CR>", { silent = true, desc = "Select colorscheme" })
  end,
}
