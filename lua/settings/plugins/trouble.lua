return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons", "folke/todo-comments.nvim" },
	config = function()
		vim.keymap.set("n", "<leader>tf", "<cmd>Trouble diagnostics<CR>")
		vim.keymap.set("n", "<leader>tt", "<cmd>Trouble todo<CR>")
	end,
}
