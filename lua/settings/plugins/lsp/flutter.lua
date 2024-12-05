return {
	"akinsho/flutter-tools.nvim",
	event = "VeryLazy",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"stevearc/dressing.nvim",
		"mfussenegger/nvim-dap",
	},
	config = function()
		require("flutter-tools").setup({
			flutter_path = nil,
			flutter_lookup_cmd = "asdf where flutter",
			fvm = false,
			widget_guides = { enabled = true },
			lsp = {
				settings = {
					showtodos = true,
					completefunctioncalls = true,
					analysisexcludedfolders = {
						vim.fn.expand("$Home/.pub-cache"),
					},
					renamefileswithclasses = "prompt",
					updateimportsonrename = true,
					enablesnippets = false,
				},
			},
			debugger = {
				enabled = true,
				run_via_dap = true,
				exception_breakpoints = {},
				register_configurations = function(paths)
					local dap = require("dap")
					-- これを入れないと debugger が動かない
					-- See also: https://github.com/akinsho/flutter-tools.nvim/pull/292
					dap.adapters.dart = {
						type = "executable",
						command = paths.flutter_bin,
						args = { "debug-adapter" },
					}
					dap.configurations.dart = {}
					require("dap.ext.vscode").load_launchjs()
				end,
			},
		})
	end,
}
