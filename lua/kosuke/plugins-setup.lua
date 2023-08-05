local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end
local packer_bootstrap = ensure_packer()

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
  return
end

return packer.startup(function(use)
  use("wbthomason/packer.nvim")

  use("FotiadisM/tabset.nvim") -- set indent each language

  use("nvim-lua/plenary.nvim") -- lua functions that many plugins use

  use("akinsho/nvim-bufferline.lua") -- tab appearance

  use { "catppuccin/nvim", as = "catppuccin" }

  use("christoomey/vim-tmux-navigator") -- tmux & split window navigation

  use("szw/vim-maximizer") -- maximizes and restores current window

  use("akinsho/toggleterm.nvim") -- toggle terminal

  -- essential plugins
  use("tpope/vim-surround") -- add, delete, change surroundings (it's awesome)
  use("inkarkat/vim-ReplaceWithRegister") -- replace with register contents using motion (gr + motion)

  use("numToStr/Comment.nvim") -- commenting with gc

  use("nvim-tree/nvim-tree.lua") -- file explorer

  use("kyazdani42/nvim-web-devicons") -- icons

  use("nvim-lualine/lualine.nvim") -- statusline

  -- fuzzy findings /w telescope
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
  use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" })

  -- autocompletion
  use("hrsh7th/nvim-cmp")
  use("hrsh7th/cmp-nvim-lsp")
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/cmp-path")

  -- snippets
  use("L3Mon4D3/LuaSnip")
  use("saadparwaiz1/cmp_luasnip")
  use("rafamadriz/friendly-snippets")

  -- managing & installing lsp server
  use("williamboman/mason.nvim")
  use("williamboman/mason-lspconfig.nvim")
  use({ "glepnir/lspsaga.nvim", branch = "main" })
  use("jose-elias-alvarez/typescript.nvim")
  use("onsails/lspkind.nvim")

  -- configuring lsp server
  use("neovim/nvim-lspconfig")

  -- formatting & linting
  use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters
  use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls

  -- treesitter
  use({
    "nvim-treesitter/nvim-treesitter",
    run = function()
      require("nvim-treesitter.install").update({ with_sync = true })
    end,
  })

  -- auto closing
  use("windwp/nvim-autopairs")
  use("windwp/nvim-ts-autotag")

  -- git signs plugin
  use("lewis6991/gitsigns.nvim")

  -- markdown preview
  use({
      "iamcco/markdown-preview.nvim",
      run = function() vim.fn["mkdp#util#install"]() end,
  })

  -- use nvim in chrome
  use {
      'glacambre/firenvim',
      run = function() vim.fn['firenvim#install'](0) end
  }

  if packer_bootstrap then
    require("packer").sync()
  end
end)
