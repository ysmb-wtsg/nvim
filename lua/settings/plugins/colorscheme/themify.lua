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
		})
		vim.keymap.set("n", "<leader>fc", "<cmd>Themify<CR>", { silent = true, desc = "Select colorscheme" })
	end,
}
