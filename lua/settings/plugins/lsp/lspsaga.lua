return {
	"nvimdev/lspsaga.nvim",
	keys = {
		{ "gd", "<cmd>Lspsaga goto_definition<CR>", silent = true, desc = "Go to definition" },
		{ "gf", "<cmd>Lspsaga finder def+ref ++layout<CR>", silent = true, desc = "Show definition and references" },
		{ "go", "<cmd>Lspsaga outline<CR>", silent = true, desc = "Show outline" },
		{ "<leader>ca", "<cmd>Lspsaga code_action<CR>", silent = true, desc = "Show available code actions" },
	},
	dependencies = {
		"nvim-treesitter/nvim-treesitter", -- optional
		"nvim-tree/nvim-web-devicons", -- optional
	},
	opts = {},
}
