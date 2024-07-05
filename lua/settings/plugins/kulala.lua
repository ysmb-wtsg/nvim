return {
	"mistweaverco/kulala.nvim",
	config = function()
		vim.filetype.add({
			extension = {
				["http"] = "http",
			},
		})

		local kulala = require("kulala")
		-- Setup is required, even if you don't pass any options
		kulala.setup({
			-- default_view, body or headers
			default_view = "body",
			-- dev, test, prod, can be anything
			-- see: https://learn.microsoft.com/en-us/aspnet/core/test/http-files?view=aspnetcore-8.0#environment-files
			default_env = "dev",
			-- enable/disable debug mode
			debug = false,
			-- default formatters for different content types
			formatters = {
				json = { "jq", "." },
				xml = { "xmllint", "--format", "-" },
				html = { "xmllint", "--format", "--html", "-" },
			},
			-- default icons
			icons = {
				inlay = {
					loading = "⏳",
					done = "✅ ",
				},
				lualine = "🐼",
			},
			-- additional cURL options
			-- e.g. { "--insecure", "-A", "Mozilla/5.0" }
			additional_curl_options = {},
		})

		vim.keymap.set("n", "<leader>kr", function()
			kulala.run()
		end, { desc = "kulala run" })
		vim.keymap.set("n", "<leader>kt", function()
			kulala.toggle_view()
		end, { desc = "kulala toggle between headers and body" })
		vim.keymap.set("n", "<leader>kj", function()
			kulala.jump_next()
		end, { desc = "kulala jump next" })
		vim.keymap.set("n", "<leader>kk", function()
			kulala.jump_prev()
		end, { desc = "kulala jump prev" })
	end,
}
