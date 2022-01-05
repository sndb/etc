require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"bash",
		"c",
		"dockerfile",
		"gdscript",
		"go",
		"godot_resource",
		"gomod",
		"json",
		"latex",
		"lua",
		"make",
		"markdown",
		"python",
		"rust",
		"scss",
		"toml",
		"yaml",

		"html",
		"css",
		"javascript",
	},
	highlight = {
		enable = true,
	},
	incremental_selection = {
		enable = true,
	},
	indent = {
		enable = true,
	},
})

vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
