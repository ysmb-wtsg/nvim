return {
	"akinsho/toggleterm.nvim",
	config = function()
		local toggleterm = require("toggleterm")
		toggleterm.setup({
			size = 20,
			open_mapping = [[<C-/>]],
			hide_numbers = true,
			shade_filetypes = {},
			shade_terminals = true,
			shading_factor = 2,
			start_in_insert = true,
			insert_mappings = true,
			persist_size = true,
			direction = "float",
			close_on_exit = true,
			shell = vim.o.shell,
			float_opts = {
				border = "curved",
				winblend = 0,
				highlights = {
					border = "Normal",
					background = "Normal",
				},
			},
		})
		function _G.set_terminal_keymaps()
			local opts = { buffer = 0 }
			vim.keymap.set("t", "<C-q>", [[<C-\><C-n>]], opts)
		end

		-- if you only want these mappings for toggle term use term://*toggleterm#* instead
		vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

		local Terminal = require("toggleterm.terminal").Terminal
		local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float", count = 999 })
		local lazydocker = Terminal:new({ cmd = "lazydocker", hidden = true, direction = "float", count = 998 })

		function Lazygit_toggle()
			lazygit:toggle()
		end
		vim.keymap.set("n", "<leader>g", "<cmd>lua Lazygit_toggle()<CR>", { silent = true })

		function Lazydocker_toggle()
			lazydocker:toggle()
		end
		vim.keymap.set("n", "<leader>d", "<cmd>lua Lazydocker_toggle()<CR>", { silent = true }
)
	end,
}
