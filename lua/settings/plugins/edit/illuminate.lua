return {
  "RRethy/vim-illuminate",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local highlights = {
      IlluminatedWord = { link = "Visual" },
      IlluminatedCurWord = { link = "Visual" },
      IlluminatedWordText = { link = "Visual" },
      IlluminatedWordRead = { link = "Visual" },
      IlluminatedWordWrite = { link = "Visual" },
    }
    for group, value in pairs(highlights) do
      vim.api.nvim_set_hl(0, group, value)
    end
  end,
}
