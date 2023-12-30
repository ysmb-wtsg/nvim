local status, lualine = pcall(require, "lualine")
if not status then
	return
end

lualine.setup({
	sections = {
		lualine_z = {
			{
				"datetime",
				-- options: default, us, uk, iso, or your own format string ("%H:%M", etc..)
				style = "%Y/%m/%d(%A) %H:%M",
			},
		},
	},
})
