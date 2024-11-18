return {
	"MagicDuck/grug-far.nvim",
	config = function()
		local grug_far = require("grug-far")
		grug_far.setup({
			keymaps = {
				replace = { n = "R" },
				qflist = { n = "<C-q>" },
				syncLocations = { n = "r" },
				syncline = { n = "<localleader>l" },
				close = { n = "<leader>q" },
				historyOpen = { n = "<localleader>h" },
				refresh = { n = "<localleader>f" },
				openLocation = { n = "<localleader>o" },
				gotoLocation = { n = "<enter>" },
				pickHistoryEntry = { n = "<enter>" },
				abort = { n = "<localleader>b" },
				help = { n = "g?" },
				previewLocation = { n = "<C-p>" },
			},
			-- options, see Configuration section below
			-- there are no required options atm
			-- engine = 'ripgrep' is default, but 'astgrep' can be specified
		})
		vim.keymap.set("n", "<leader>fg", function()
			grug_far.with_visual_selection({
				prefills = {
					flags = "--ignore-case",
				},
			})
		end, { silent = true, desc = "Telescope strings (with grug-far)" })
	end,
}
