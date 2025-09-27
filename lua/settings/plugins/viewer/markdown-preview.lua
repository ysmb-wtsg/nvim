return {
  "iamcco/markdown-preview.nvim",
  ft = "markdown",
  keys = {
    { "<leader>pm", "<cmd>MarkdownPreview<CR>", silent = true, desc = "Preview Markdown" },
  },
  config = function()
    vim.fn["mkdp#util#install"]()
  end,
}
