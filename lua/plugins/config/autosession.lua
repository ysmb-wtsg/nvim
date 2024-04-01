
local stasus, autosession = pcall(require, "auto-session")
if not stasus then
	return
end

autosession.setup({
	auto_session_suppress_dirs = { "~/proj" },
	log_level = "error",
	auto_session_enable_last_session = false,
	auto_session_root_dir = vim.fn.stdpath("data") .. "/sessions/",
	auto_session_enabled = true,
	auto_save_enabled = false,
	auto_restore_enabled = true,
})
