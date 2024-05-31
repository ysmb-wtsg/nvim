local themes = {
	ayu = {
		"Shatur/neovim-ayu",
		lazy = false,
		config = function()
			vim.cmd("colorscheme ayu-dark")
		end,
	},
	tokyonight = {
		"folke/tokyonight.nvim",
		lazy = false,
		config = function()
			vim.cmd("colorscheme tokyonight-night")
		end,
	},
	catppuccin = {
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		config = function()
			vim.cmd("colorscheme catppuccin-mocha")
		end,
	},
}

return themes.tokyonight
