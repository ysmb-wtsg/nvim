return {
	"sindrets/diffview.nvim",
	config = function()
		vim.keymap.set("n", "<leader>hd", "<cmd>DiffviewOpen HEAD~1<CR>", { silent = true })
		vim.keymap.set("n", "<leader>hf", "<cmd>DiffviewFileHistory %<CR>", { silent = true })
	end,
}
