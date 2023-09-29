local status, tabset = pcall(require, "tabset")
if not status then
  return
end

tabset.setup({
  defaults = {
    tabwidth = 4,
    expandtab = true
  },
  languages = {
    {
      filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact", "lua", "json", "yaml" },
      config = {
        tabwidth = 2
      }
    },
    {
      filetypes = { "markdown"},
      config = {
        tabwidth = 1
      }
    }
  }
})
