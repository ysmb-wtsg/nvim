local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { import = "settings.plugins" },
  { import = "settings.plugins.colorscheme" },
  { import = "settings.plugins.edit" },
  { import = "settings.plugins.git" },
  { import = "settings.plugins.ide" },
  { import = "settings.plugins.ui" },
  { import = "settings.plugins.util" },
  { import = "settings.plugins.viewer" },
})
