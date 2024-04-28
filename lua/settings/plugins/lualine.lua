return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status") -- to configure lazy pending updates count

		local colors = {
			blue = "#65D1FF",
			green = "#3EFFDC",
			violet = "#FF61EF",
			yellow = "#FFDA7B",
			red = "#FF4A4A",
			fg = "#c3ccdc",
			bg = "#112638",
			inactive_bg = "#2c3043",
		}

		local my_theme = require("lualine.themes.ayu_dark")

		-- configure lualine with modified theme
		lualine.setup({
			options = {
				disabled_filetypes = { "NvimTree" },
				theme = my_theme,
			},
			sections = {
				lualine_x = {
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
						color = { fg = "#ff9e64" },
					},
					{ "encoding" },
					{ "fileformat" },
					{ "filetype" },
				},
				lualine_z = {
					{
						"datetime",
						-- options: default, us, uk, iso, or your own format string ("%H:%M", etc..)
						style = "%Y/%m/%d(%A) %H:%M",
					},
				},
			},
		})
	end,
}
