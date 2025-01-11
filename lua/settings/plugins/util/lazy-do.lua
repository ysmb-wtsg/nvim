return {
	"Dan7h3x/LazyDo",
	branch = "main",
	keys = { -- recommended keymap for easy toggle LazyDo in normal and insert modes (arbitrary)
		{
			"tt",
			"<ESC><CMD>LazyDoToggle<CR>",
			mode = { "n", "i" },
		},
	},
	event = "VeryLazy",
	opts = {
		-- your config here
	},
}
