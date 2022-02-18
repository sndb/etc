require("packer").startup(function()
	use("wbthomason/packer.nvim")

	use("Olical/conjure")
	use("ap/vim-css-color")
	use("arcticicestudio/nord-vim")
	use("mattn/vim-goimports")
	use("onsails/lspkind-nvim")
	use("sbdchd/neoformat")
	use("tpope/vim-commentary")
	use("tpope/vim-repeat")
	use("tpope/vim-surround")
	use("windwp/nvim-autopairs")
	use("wlangstroth/vim-racket")
	use({
		"lewis6991/gitsigns.nvim",
		requires = { "nvim-lua/plenary.nvim" },
	})
	use({
		"nvim-telescope/telescope.nvim",
		requires = { "nvim-lua/plenary.nvim" },
	})
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})

	use("neovim/nvim-lspconfig")
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/cmp-emoji")
	use("hrsh7th/cmp-calc")

	use("hrsh7th/vim-vsnip")
	use("hrsh7th/cmp-vsnip")
	use("rafamadriz/friendly-snippets")
end)

require("plugins.autopairs")
require("plugins.cmp")
require("plugins.gitsigns")
require("plugins.goimports")
require("plugins.lspconfig")
require("plugins.neoformat")
require("plugins.treesitter")
require("plugins.vsnip")
