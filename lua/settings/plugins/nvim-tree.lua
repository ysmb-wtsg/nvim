return {
	"nvim-tree/nvim-tree.lua",
	keys = {
		{ "<leader>e", "<cmd>NvimTreeFindFileToggle<CR>", silent = true, desc = "Toggle NvimTree" },
	},
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local function on_attach(bufnr)
			local api = require("nvim-tree.api")

			local function opts(desc)
				return { desc = "uvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
			end

			api.config.mappings.default_on_attach(bufnr)
			vim.keymap.set("n", "t", api.node.open.tab, opts("Open: New Tab"))
			vim.keymap.set("n", "o", api.node.open.edit, opts("Open"))
			vim.keymap.set("n", "s", api.node.open.vertical, opts("Open: Vertical Split"))
			vim.keymap.set("n", "w", api.node.navigate.parent_close, opts("Close Directory"))
		end
		local nvimtree = require("nvim-tree")
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1
		nvimtree.setup({
			on_attach = on_attach,
			actions = {
				open_file = {
					quit_on_open = true,
					window_picker = {
						enable = false,
					},
				},
			},
			git = {
				ignore = false,
			},
			view = {
				-- float = {
				-- 	enable = true,
				-- 	open_win_config = {
				-- 		relative = "editor",
				-- 		width = 60,
				-- 		-- width = 125,
				-- 		height = 30,
				-- 		row = 4,
				-- 		col = 9,
				-- 	},
				-- },
				relativenumber = true,
				width = 50,
			},
			ui = {
				confirm = {
					default_yes = true,
				},
			},
		})
	end,
}
