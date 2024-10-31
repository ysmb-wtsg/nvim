return {
	"vinnymeller/swagger-preview.nvim",
	cmd = { "SwaggerPreview", "SwaggerPreviewStop", "SwaggerPreviewToggle" },
	keys = {
		{ "<leader>ps", "<cmd>SwaggerPreview<CR>", desc = "Preview Swagger" },
	},
	build = "npm i",
	config = true,
}
