return {
	"akinsho/nvim-bufferline.lua",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		local bufferline = require("bufferline")
		bufferline.setup({
			options = {
				custom_filter = function(buf_number)
					if vim.bo[buf_number].filetype ~= "NvimTree" and vim.bo[buf_number].filetype ~= "toggleterm" then
						return true
					end
					return false
				end,
				offsets = {
					{
						filetype = "NvimTree",
						text = "📂NvimTree",
						separator = true,
						highlight = "Directory",
					},
				},
				mode = "tabs",
				separator_style = "slant",
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
		})
	end,
}
