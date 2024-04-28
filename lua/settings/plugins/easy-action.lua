return {
	"Weissle/easy-action",
	dependencies = {
		{
			"kevinhwang91/promise-async",
			module = { "async" },
		},
	},
	config = function()
		local easy_action = require("easy-action")
		easy_action.setup({
			-- These chars can show up any times in your action input.
			free_chars = "0123456789",
			-- These chars can show up no more than twice in action input.
			limited_chars = "iafFtT",
			-- Cancel action.
			terminate_char = "<ESC>",
			-- all action contains `key` will be replaced by `value`. For example yib -> yi(
			remap = {
				ib = "i(",
				ab = "a(",
			},
			-- Default jump provider
			jump_provider = "hop",
			jump_provider_config = {
				hop = {
					action_select = {
						char1 = {
							-- action ends with any char of options will use HopChar1MW command.
							options = "(){}[]<>`'\"",
							cmd = "HopChar1MW",
							feed = function(action)
								return string.sub(action, #action)
							end,
						},
						line = {
							-- action ends with any char of options will use HopLineMW command.
							options = "yd",
							cmd = "HopLineMW",
						},
						-- Default command.
						default = "HopChar2MW",
					},
				},
				leap = {
					action_select = {
						default = function()
							require("leap").leap({ target_windows = require("leap.util").get_enterable_windows() })
						end,
					},
				},
			},
			-- Just make sure they are greater than 0. Usually 1 is all right.
			jump_back_delay_ms = 1,
			feed_delay_ms = 1,
		})
		vim.keymap.set("n", "<leader>a", "<cmd>BasicEasyAction<CR>", { silent = true })
	end,
}
