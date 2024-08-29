return {
	"nomnivore/ollama.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},

	-- All the user commands added by the plugin
	cmd = { "Ollama", "OllamaModel", "OllamaServe", "OllamaServeStop" },

	keys = {
		-- Sample keybind for prompt menu. Note that the <c-u> is important for selections to work properly.
		{
			"<leader>oo",
			":<c-u>lua require('ollama').prompt()<cr>",
			desc = "ollama prompt",
			mode = { "n", "v" },
		},

		-- Sample keybind for direct prompting. Note that the <c-u> is important for selections to work properly.
		{
			"<leader>og",
			":<c-u>lua require('ollama').prompt('Generate_Code')<cr>",
			desc = "ollama Generate Code",
			mode = { "n", "v" },
		},
		{
			"<leader>os",
			"<CMD>OllamaServe<CR>",
			desc = "ollama serve",
			mode = { "n" },
		},
	},

	---@type Ollama.Config
	opts = {
		-- your configuration overrides
	},
}
