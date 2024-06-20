return {
	"rmagatti/auto-session",
	keys = {
		{ "<leader>w", "<cmd>w<CR><cmd>SessionSave<CR>", silent = true, desc = "Save with SessionSave" },
		{ "<leader>sr", "<cmd>SessionRestore<CR>", silent = true, desc = "Restore Session" },
	},
	config = function()
		local autosession = require("auto-session")
		autosession.setup({
			auto_session_suppress_dirs = { "~/proj" },
			log_level = "error",
			auto_session_enable_last_session = false,
			auto_session_root_dir = vim.fn.stdpath("data") .. "/sessions/",
			auto_session_enabled = true,
			auto_save_enabled = false,
			auto_restore_enabled = true,
		})
	end,
}
