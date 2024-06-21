local themes = {
	ayu = {
		"Shatur/neovim-ayu",
		priority = 1000,
		config = function()
			vim.cmd("colorscheme ayu-dark")
		end,
	},
	tokyonight = {
		"folke/tokyonight.nvim",
		priority = 1000,
		config = function()
			vim.cmd("colorscheme tokyonight-night")
		end,
	},
	catppuccin = {
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			vim.cmd("colorscheme catppuccin-mocha")
		end,
	},
}

return themes.tokyonight
