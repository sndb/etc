require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"go",
		"javascript",
		"lua",
		"python",
		"rust",
	},
	highlight = {
		enable = true,
	},
})
