return {
	"FotiadisM/tabset.nvim",
	config = function()
		local tabset = require("tabset")
		tabset.setup({
			defaults = {
				tabwidth = 2,
				expandtab = true,
			},
			languages = {
				{
					filetypes = {
						"python",
					},
					config = {
						tabwidth = 4,
					},
				},
			},
		})
	end,
}
