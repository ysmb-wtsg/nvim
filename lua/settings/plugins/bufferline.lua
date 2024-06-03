return {
	"akinsho/nvim-bufferline.lua",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		local bufferline = require("bufferline")
		bufferline.setup({
			options = {
				mode = "tabs",
				separator_style = "thin",
				always_show_bufferline = true,
				show_buffer_close_icons = false,
				show_close_icon = false,
				color_icons = true,
				diagnostics = "nvim_lsp",
				diagnostics_indicator = function(count, level)
					local icon = level:match("error") and " " or " "
					return " " .. icon .. count
				end,
			},
			highlights = {
				separator = {
					guifg = "#073642",
					guibg = "#002b36",
				},
				separator_selected = {
					guifg = "#073642",
				},
				background = {
					guifg = "#657b83",
					guibg = "#002b36",
				},
				buffer_selected = {
					guifg = "#fdf6e3",
					gui = "bold",
				},
				fill = {
					guibg = "#073642",
				},
			},
		})
	end,
}
