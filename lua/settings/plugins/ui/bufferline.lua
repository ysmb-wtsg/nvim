return {
  "akinsho/nvim-bufferline.lua",
  dependencies = "nvim-tree/nvim-web-devicons",
  lazy = false,
  keys = {
    { "tp", "<cmd>BufferLinePick<CR>", desc = "Pick tab" },
  },
  opts = {
    options = {
      separator_style = "slant",
      custom_filter = function(buf_number)
        if vim.bo[buf_number].filetype ~= "NvimTree" and vim.bo[buf_number].filetype ~= "toggleterm" then
          return true
        end
        return false
      end,
      offsets = {
        {
          filetype = "NvimTree",
          text = "📂NvimTree",
          highlight = "Directory",
        },
      },
      mode = "tabs",
      indicator = {
        style = "none",
      },
      show_buffer_close_icons = false,
      show_close_icon = false,
      diagnostics = "nvim_lsp",
      diagnostics_indicator = function(count, level)
        local icon = level:match("error") and " " or " "
        return " " .. icon .. count
      end,
    },
  },
}
