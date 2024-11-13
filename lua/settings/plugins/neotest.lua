return {
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",
			-- pytest
			"nvim-neotest/neotest-python",
		},
		config = function()
			local neotest = require("neotest")
			neotest.setup({
				adapters = {
					require("neotest-python")({
						args = { "--log-level", "DEBUG" },
						runner = "pytest",
					}),
				},
			})
			vim.keymap.set("n", "<leader>tr", function()
				require("neotest").run.run()
			end, { desc = "Neotest run current method" })
			vim.keymap.set("n", "<leader>tR", function()
				require("neotest").run.run(vim.fn.expand("%"))
			end, { desc = "Neotest run current file" })
			vim.keymap.set("n", "<leader>ts", function()
				require("neotest").summary.toggle()
			end, { desc = "Neotest toggle summary" })
			vim.keymap.set("n", "<leader>tw", function()
				require("neotest").watch.toggle()
			end, { desc = "Neotest toggle watch" })
			vim.keymap.set("n", "<leader>to", function()
				require("neotest").output.open()
			end, { desc = "Neotest open output window" })
			vim.keymap.set("n", "<leader>tp", function()
				require("neotest").output_panel.toggle()
			end, { desc = "Neotest toggle output panel" })
		end,
	},
}
