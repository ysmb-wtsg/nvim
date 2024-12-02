return {
	"nvimdev/lspsaga.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter", -- optional
		"nvim-tree/nvim-web-devicons", -- optional
	},
	config = function()
		require("lspsaga").setup({})
		vim.keymap.set("n", "gd", "<cmd>Lspsaga goto_definition<CR>", { silent = true, desc = "Go to definition" })
		vim.keymap.set(
			"n",
			"gf",
			"<cmd>Lspsaga finder def+ref ++layout<CR>",
			{ silent = true, desc = "Show definition and references" }
		)
		vim.keymap.set("n", "go", "<cmd>Lspsaga outline<CR>", { silent = true, desc = "Show outline" })
		vim.keymap.set(
			"n",
			"gt",
			"<cmd>Lspsaga show_buf_diagnostics<CR>",
			{ silent = true, desc = "Show buffer diagnostics" }
		)
		vim.keymap.set(
			"n",
			"gT",
			"<cmd>Lspsaga show_workspace_diagnostics<CR>",
			{ silent = true, desc = "Show workspace diagnostics" }
		)
		vim.keymap.set(
			"n",
			"<leader>ca",
			"<cmd>Lspsaga code_action<CR>",
			{ silent = true, desc = "Show available code actions" }
		)
	end,
}
