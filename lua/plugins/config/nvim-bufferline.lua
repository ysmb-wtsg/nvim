local status, bufferline = pcall(require, "bufferline")
if not status then
	return
end

bufferline.setup({
	options = {
		mode = "tabs",
		separator_style = "slant",
		always_show_bufferline = false,
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
