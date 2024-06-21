return {
	"vinnymeller/swagger-preview.nvim",
	build = "npm install -g swagger-ui-watcher",
	keys = {
		{ "<leader>ps", "<cmd>SwaggerPreview<CR>", desc = "Preview Swagger" },
	},
	opts = {
		port = 8000,
		host = "localhost",
	},
}
