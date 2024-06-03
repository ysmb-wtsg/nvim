return {
	"iamcco/markdown-preview.nvim",
	ft = "markdown",
	config = function()
		vim.fn["mkdp#util#install"]()
		vim.keymap.set("n", "<leader>mp", "<cmd>MarkdownPreview<CR>", { silent = true })
		vim.keymap.set("n", "<leader>mt", "<cmd>MarkdownPreviewToggle<CR>", { silent = true })
	end,
}
