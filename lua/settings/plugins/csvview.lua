return {
	"hat0uma/csvview.nvim",
	ft = {
		"csv",
	},
	config = function()
		require("csvview").setup({
			view = {
				display_mode = "border",
			},
		})
		vim.keymap.set("n", "<leader>cv", "<cmd>CsvViewToggle<CR>", { desc = "Toggle csv viewer" })
	end,
}
