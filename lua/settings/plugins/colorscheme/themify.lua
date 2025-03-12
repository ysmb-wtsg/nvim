return {
	"lmantw/themify.nvim",
	lazy = false,
	priority = 999,
	config = function()
		require("themify").setup({
			{ "Shatur/neovim-ayu", branch = "master" },
			"folke/tokyonight.nvim",
			"catppuccin/nvim",
			{ "tiagovla/tokyodark.nvim", branch = "master" },
			"oxfist/night-owl.nvim",
			"olivercederborg/poimandres.nvim",
			"zootedb0t/citruszest.nvim",
			"atmosuwiryo/vim-winteriscoming",
			"maxmx03/fluoromachine.nvim",
			{ "zenbones-theme/zenbones.nvim", dependencies = "rktjmp/lush.nvim" },
			{ "Mofiqul/vscode.nvim" },
			{
				"ilof2/posterpole.nvim",
				branch = "master",
				priority = 1000,
				config = function()
					local posterpole = require("posterpole")
					posterpole.setup({
						-- config here
					})
					vim.cmd("colorscheme posterpole")

					-- This function create sheduled task, which will reload theme every hour
					-- Without "setup_adaptive" adaptive brightness will be set only after every restart
					posterpole.setup_adaptive()
				end,
			},
		})
		vim.keymap.set("n", "<leader>fc", "<cmd>Themify<CR>", { silent = true, desc = "Select colorscheme" })
	end,
}
