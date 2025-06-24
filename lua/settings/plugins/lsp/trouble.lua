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
			"gt",
			"<cmd>Trouble diagnostics toggle focus=true filter.buf=0<cr>",
			desc = "Diagnostics (Trouble)",
		},
		{
			"go",
			"<cmd>Trouble symbols toggle focus=true<cr>",
			desc = "Symbols (Trouble)",
		},
		{
			"gf",
			"<cmd>Trouble lsp toggle focus=true<cr>",
			desc = "LSP Definitions / references / ... (Trouble)",
		},
		{
			"gq",
			"<cmd>Trouble qflist toggle<cr>",
			desc = "Quickfix List (Trouble)",
		},
	},
}
