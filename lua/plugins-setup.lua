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

local status, packer = pcall(require, 'packer')
if not status then
  return
end

return packer.startup(function(use)
  use 'wbthomason/packer.nvim'

  use {'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async'}

  use 'FotiadisM/tabset.nvim' -- set indent each language

  use 'nvim-lua/plenary.nvim' -- lua functions that many plugins use

  use 'akinsho/nvim-bufferline.lua' -- tab appearance

  -- colorscheme
  use {'Shatur/neovim-ayu', as = 'ayu'}
  use {'catppuccin/nvim', as = 'catppuccin'}
  use 'rebelot/kanagawa.nvim'
  use {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    opts = {},
  }

  use 'christoomey/vim-tmux-navigator' -- tmux & split window navigation

  use 'akinsho/toggleterm.nvim' -- toggle terminal

  -- surround
  use {
    'kylechui/nvim-surround',
    branch = 'main',
    config = function()
      require('nvim-surround').setup({})
    end
  }

  use 'inkarkat/vim-ReplaceWithRegister' -- replace with register contents using motion (gr + motion)

  -- commenting with gc
  use {'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup({})
    end
  }

  use 'nvim-tree/nvim-tree.lua' -- file explorer

  use 'kyazdani42/nvim-web-devicons' -- icons

  use 'nvim-lualine/lualine.nvim' -- statusline

  -- fuzzy findings /w telescope
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}
  use {'nvim-telescope/telescope-project.nvim'}
  use {'nvim-telescope/telescope.nvim', branch = '0.1.x'}

  -- autocompletion
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'

  -- snippets
  use 'L3Mon4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use 'rafamadriz/friendly-snippets'

  -- managing & installing lsp server
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use {'nvimdev/lspsaga.nvim', branch = 'main'}
  use 'jose-elias-alvarez/typescript.nvim'
  use 'onsails/lspkind.nvim'

  -- configuring lsp server
  use 'neovim/nvim-lspconfig'

  -- formatting & linting
  use 'jose-elias-alvarez/null-ls.nvim' -- configure formatters & linters
  use 'jayp0521/mason-null-ls.nvim' -- bridges gap b/w mason & null-ls

  -- treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      require('nvim-treesitter.install').update({ with_sync = true })
    end,
  }

  -- auto closing
  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'

  -- git signs plugin
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
      require('scrollbar.handlers.gitsigns').setup()
    end
  }

  -- markdown preview
  use{
    'iamcco/markdown-preview.nvim',
    run = function() vim.fn['mkdp#util#install']() end,
  }

  -- show diagnostics
  use 'folke/trouble.nvim'

  -- toggle lazygit
  use {
    'kdheepak/lazygit.nvim',
    requires = {
      'nvim-telescope/telescope.nvim',
      'nvim-lua/plenary.nvim',
    },
    config = function()
      require('telescope').load_extension('lazygit')
    end,
  }

  -- hop
  use {
    'phaazon/hop.nvim',
    branch = 'v2', -- optional but strongly recommended
  }

  -- neo scroll
  use {'karb94/neoscroll.nvim',
    config = function()
      require('neoscroll').setup({})
    end
  }

  -- scroll bar
  use 'petertriho/nvim-scrollbar'

  -- zenmode
  use 'folke/zen-mode.nvim'

  -- easy action
  use {
    'Weissle/easy-action',
    requires = {
      {
        'kevinhwang91/promise-async',
        module = { 'async' },
      }
    }
  }

  -- session manager
  use {
    'rmagatti/auto-session',
    config = function()
      require('auto-session').setup {
        log_level = 'error',
        auto_session_suppress_dirs = '~/',
      }
    end
  }

  -- chatGPT
  use{
    'jackMort/ChatGPT.nvim',
    config = function()
      require('chatgpt').setup()
    end,
    requires = {
      'MunifTanjim/nui.nvim',
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim'
    }
  }

  -- smart selection
  use 'gcmt/wildfire.vim'

  -- note taking
  use 'gsuuon/note.nvim'

  -- noice
  use{
    "folke/noice.nvim",
    -- config = function()
    -- require("noice").setup({
          -- add any options here
    -- })
    -- end,
    requires = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
      }
  }

  if packer_bootstrap then
    require('packer').sync()
  end
end)
