return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")

		local my_theme = require("lualine.themes.tokyonight")

		-- configure lualine with modified theme
		lualine.setup({
			options = {
				disabled_filetypes = { "NvimTree" },
				theme = my_theme,
			},
			sections = {
				lualine_c = {},
				lualine_z = {
					{
						"datetime",
						style = "%H:%M",
					},
				},
			},
		})
	end,
}
