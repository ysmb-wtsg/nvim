return {
	"nvimdev/lspsaga.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter", -- optional
		"nvim-tree/nvim-web-devicons", -- optional
	},
	config = function()
		local opts = { noremap = true, silent = true }
		require("lspsaga").setup({
			vim.keymap.set("n", "<leader>lf", "<cmd>Lspsaga finder def+ref ++layout<CR>", opts),
			vim.keymap.set("n", "<leader>lh", "<cmd>Lspsaga hover_doc<CR>", opts),
			vim.keymap.set("n", "<leader>lo", "<cmd>Lspsaga outline<CR>", opts),
			vim.keymap.set("n", "<leader>lr", "<cmd>Lspsaga incoming_calls<CR>", opts),
			vim.keymap.set("n", "<leader>ld", "<cmd>Lspsaga outgoing_calls<CR>", opts),
			vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts),
		})
	end,
}
