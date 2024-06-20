return {
	"iamcco/markdown-preview.nvim",
	ft = "markdown",
	keys = {
		{ "<leader>mp", "<cmd>MarkdownPreview<CR>", silent = true, desc = "Markdown Preview" },
	},
	config = function()
		vim.fn["mkdp#util#install"]()
	end,
}
