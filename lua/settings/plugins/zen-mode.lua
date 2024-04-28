return {
	"folke/zen-mode.nvim",
	config = function()
		vim.keymap.set("n", "<leader>z", "<cmd>ZenMode<CR>", { silent = true })
	end,
}
