require("packer").startup(function(use)
	use("wbthomason/packer.nvim")

	use("Olical/conjure")
	use("ap/vim-css-color")
	use({
		"shaunsingh/nord.nvim",
		config = function()
			require("nord").set()
		end,
	})
	use("mattn/vim-goimports")
	use("onsails/lspkind-nvim")
	use({
		"sbdchd/neoformat",
		config = function()
			vim.g.shfmt_opt = "-s -i 0"
		end,
	})
	use("tpope/vim-commentary")
	use("tpope/vim-repeat")
	use("tpope/vim-surround")
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	})
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
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = "maintained",
				highlight = {
					enable = true,
				},
				indent = {
					enable = true,
				},
			})
		end,
	})
	use({
		"p00f/nvim-ts-rainbow",
		requires = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("nvim-treesitter.configs").setup({
				rainbow = {
					enable = true,
					extended_mode = true,
				},
			})
		end,
	})
	use({
		"akinsho/bufferline.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("bufferline").setup({})
		end,
	})
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons" },
		config = function()
			require("lualine").setup({
				options = {
					theme = "nord",
				},
			})
		end,
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

require("plugins.cmp")
require("plugins.gitsigns")
require("plugins.lspconfig")
require("plugins.vsnip")
