return {
	"echasnovski/mini.animate",
	event = { "BufReadPre", "BufNewFile" },
	opts = function(_, opts)
		opts.scroll = {
			enable = false,
		}
	end,
}
