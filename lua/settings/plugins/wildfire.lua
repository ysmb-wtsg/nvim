return {
	"sustech-data/wildfire.nvim",
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	config = function()
		require("wildfire").setup()
	end,
}
