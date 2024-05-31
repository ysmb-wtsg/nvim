return {
	"nvimdev/lspsaga.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter", -- optional
		"nvim-tree/nvim-web-devicons", -- optional
	},
	config = function()
		local opts = { noremap = true, silent = true }
		require("lspsaga").setup({
			vim.keymap.set("n", "gd", "<cmd>Lspsaga goto_definition<CR>", opts),
			vim.keymap.set("n", "gf", "<cmd>Lspsaga finder def+ref ++layout<CR>", opts),
			vim.keymap.set("n", "gh", "<cmd>Lspsaga hover_doc<CR>", opts),
			vim.keymap.set("n", "go", "<cmd>Lspsaga outline<CR>", opts),
			vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts),
		})
	end,
}
