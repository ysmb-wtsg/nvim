local mason_status, mason = pcall(require, "mason")
if not mason_status then
	return
end

local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
	return
end

local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
	return
end

local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
	return
end

local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_status then
	return
end

-- enable mason
mason.setup()

mason_lspconfig.setup({
	-- list of servers for mason to install
	ensure_installed = {
		"angularls",
		"tsserver",
		"html",
		"cssls",
		"golangci_lint_ls",
		"tailwindcss",
		"lua_ls",
		"emmet_ls",
		"pyright",
		"gopls",
		"angularls",
		"docker_compose_language_service",
	},
	-- auto-install configured servers (with lspconfig)
	automatic_installation = true, -- not the same as ensure_installed
})

-- enable keybinds for available lsp server
local on_attach = function(client, bufnr)
	local opts = { noremap = true, silent = true, buffer = bufnr }
	-- set keybinds
	vim.keymap.set("n", "gf", "<cmd>Lspsaga finder def+ref ++normal<CR>", opts)
	vim.keymap.set("n", "gd", "<cmd>Lspsaga hover_doc<CR>", opts)
	vim.keymap.set("n", "go", "<cmd>Lspsaga outline<CR>", opts)
	vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
	vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)
end
-- used to enable autocompletion
local capabilities = cmp_nvim_lsp.default_capabilities()

mason_lspconfig.setup_handlers({
	function(server_name)
		lspconfig[server_name].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})
	end,
	lua_ls = function()
		lspconfig["lua_ls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = { -- custom settings for lua
				Lua = {
					-- make the language server recognize 'vim' global
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						-- make language server aware of runtime files
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			},
		})
	end,
})

mason_null_ls.setup({
	-- list of formatters & linters for mason to install
	ensure_installed = {
		"prettier",
		"stylua",
		"autopep8",
		"flake8",
		"eslint_d",
	},
	-- auto-install configured formatters & linters (with null-ls)
	automatic_installation = true,
	handlers = {},
})
