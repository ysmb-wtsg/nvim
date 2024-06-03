return {
	"sindrets/diffview.nvim",
	lazy = true,
	keys = {
		{ "<leader>hd", "<cmd>DiffviewOpen HEAD~1<CR>", { silent = true } },
		{ "<leader>hf", "<cmd>DiffviewFileHistory %<CR>", { silent = true } },
	},
}
