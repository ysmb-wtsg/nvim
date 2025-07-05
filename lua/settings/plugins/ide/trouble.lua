return {
	"folke/trouble.nvim",
	opts = {
		auto_preview = false,
		modes = {
			diagnostics = {
				preview = {
					type = "split",
					relative = "win",
					position = "right",
					size = 0.3,
				},
			},
			symbols = {
				win = {
					type = "split",
					relative = "win",
					position = "right",
					size = 0.3,
				},
			},
		},
		keys = {
			["<leader>"] = "fold_toggle",
			w = "fold_close",
		},
	},
	cmd = "Trouble",
	keys = {
		{
			"go",
			"<cmd>Trouble symbols toggle focus=true<cr>",
			desc = "Symbols (Trouble)",
		},
	},
}
