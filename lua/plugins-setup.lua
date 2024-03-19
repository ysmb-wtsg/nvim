local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
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
	-- packageManager
	use("wbthomason/packer.nvim")

	-- colorScheme
	use({ "Shatur/neovim-ayu", as = "ayu" })
	use({ "catppuccin/nvim", as = "catppuccin" })
	use("rebelot/kanagawa.nvim")
	use({
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	})
	use("olivercederborg/poimandres.nvim")

	-- LSP
	use("neovim/nvim-lspconfig")
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use("jayp0521/mason-null-ls.nvim")
	use("nvimtools/none-ls.nvim")
	use({ "nvimdev/lspsaga.nvim", branch = "main" })
	use("folke/trouble.nvim")

	-- completion
	use("hrsh7th/nvim-cmp")
	use("onsails/lspkind.nvim")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")

	-- snippet
	use("L3Mon4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")
	use("rafamadriz/friendly-snippets")

	-- ui
	use("nvim-tree/nvim-tree.lua")
	use("kyazdani42/nvim-web-devicons")
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
	})
	use("akinsho/nvim-bufferline.lua")
	use("nvim-lualine/lualine.nvim")
	use({
		"karb94/neoscroll.nvim",
		config = function()
			require("neoscroll").setup({})
		end,
	})
	use("petertriho/nvim-scrollbar")
	use({
		"folke/noice.nvim",
		-- config = function()
		-- require("noice").setup({
		-- add any options here
		-- })
		-- end,
		requires = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
	})
	use({ "kevinhwang91/nvim-ufo", requires = "kevinhwang91/promise-async" })

	-- search
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use({ "nvim-telescope/telescope-project.nvim" })
	use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" })

	-- Git
	use({
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
			require("scrollbar.handlers.gitsigns").setup()
		end,
	})
	use("sindrets/diffview.nvim")

	-- util
	use("nvim-lua/plenary.nvim")
	use("FotiadisM/tabset.nvim")
	use("christoomey/vim-tmux-navigator")
	use("akinsho/toggleterm.nvim")
	use({
		"kylechui/nvim-surround",
		branch = "main",
		config = function()
			require("nvim-surround").setup({})
		end,
	})
	use("inkarkat/vim-ReplaceWithRegister")
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup({})
		end,
	})
	use("windwp/nvim-autopairs")
	use("windwp/nvim-ts-autotag")
	use({
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	})
	use({
		"phaazon/hop.nvim",
		branch = "v2",
	})
	use("folke/zen-mode.nvim")
	use({
		"Weissle/easy-action",
		requires = {
			{
				"kevinhwang91/promise-async",
				module = { "async" },
			},
		},
	})
	use({
		"rmagatti/auto-session",
		config = function()
			require("auto-session").setup({
				log_level = "error",
				auto_session_suppress_dirs = "~/",
			})
		end,
	})
	use({
		"jackMort/ChatGPT.nvim",
		config = function()
			require("chatgpt").setup()
		end,
		requires = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
	})
	use("gcmt/wildfire.vim")
	use("gsuuon/note.nvim")
	use({
		"epwalsh/obsidian.nvim",
		tag = "*", -- recommended, use latest release instead of latest commit
		requires = {
			"nvim-lua/plenary.nvim",
		},
	})

	if packer_bootstrap then
		require("packer").sync()
	end
end)
