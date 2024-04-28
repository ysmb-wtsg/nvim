return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons", "folke/todo-comments.nvim" },
	keys = {
		{ "<leader>tw", "<cmd>TroubleToggle workspace_diagnostics<CR>", desc = "Open trouble workspace diagnostics" },
		{ "<leader>tf", "<cmd>TroubleToggle document_diagnostics<CR>", desc = "Open trouble document diagnostics" },
		{ "<leader>tq", "<cmd>TroubleToggle quickfix<CR>", desc = "Open trouble quickfix list" },
		{ "<leader>tl", "<cmd>TroubleToggle loclist<CR>", desc = "Open trouble location list" },
		{ "<leader>tt", "<cmd>TodoTrouble<CR>", desc = "Open todos in trouble" },
	},
}
