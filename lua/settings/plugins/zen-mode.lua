return {
	"folke/zen-mode.nvim",
	event = "VeryLazy",
	config = function()
		vim.keymap.set("n", "<leader>z", "<cmd>ZenMode<CR>", { silent = true })
	end,
}
