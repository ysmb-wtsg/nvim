return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons", "ravitemer/mcphub.nvim" },
	config = function()
		local lualine = require("lualine")

		-- configure lualine with modified theme
		lualine.setup({
			options = {
				theme = "auto",
				globalstatus = true,
			},
			sections = {
				lualine_c = {},
				lualine_x = {
					{ require("mcphub.extensions.lualine") },
				},
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
