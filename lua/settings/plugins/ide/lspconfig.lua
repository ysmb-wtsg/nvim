return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/neodev.nvim", opts = {} },
		{ "b0o/schemastore.nvim" },
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")

		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		local lsp_list = {
			"ts_ls",
			"html",
			"cssls",
			"tailwindcss",
			"svelte",
			"lua_ls",
			"graphql",
			"emmet_ls",
			"prismals",
			"pyright",
			"yamlls",
			"jsonls",
		}

		mason_lspconfig.setup({ensure_installed = lsp_list})

		mason_tool_installer.setup({
			ensure_installed = {
				"prettier",
				"stylua",
				"ruff", -- as linter formatter
				"eslint_d",
				"shellcheck",
				"shfmt",
				"yamllint",
				"yamlfmt",
				"staticcheck",
			},
		})

		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				-- Buffer local mappings.
				-- See `:help vim.lsp.*` for documentation on any of the below functions
				vim.keymap.set(
					"n",
					"<leader>rl",
					":LspRestart<CR>",
					{ buffer = ev.buf, silent = true, desc = "Restart LSP" }
				) -- mapping to restart lsp if necessary
			end,
		})

		vim.lsp.config("*", {
			capabilities = require("cmp_nvim_lsp").default_capabilities(),
			root_markers = { ".git" },
		})
		vim.lsp.enable(lsp_list)
	end,
}
