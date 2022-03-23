require("packer").startup(function(use)
	use("wbthomason/packer.nvim")

	-- colorscheme
	use({
		"shaunsingh/nord.nvim",
		config = function()
			require("nord").set()
		end,
	})

	-- languages
	use("ap/vim-css-color")
	use("mattn/vim-goimports")
	use("wlangstroth/vim-racket")
	use({
		"nvim-orgmode/orgmode",
		config = function()
			require("orgmode").setup_ts_grammar()
			require("orgmode").setup({})
		end,
	})

	-- input
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})
	use({
		"tpope/vim-surround",
		requires = { "tpope/vim-repeat" },
	})
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	})
	use({
		"sbdchd/neoformat",
		config = function()
			vim.g.shfmt_opt = "-s -i 0"
		end,
	})

	-- interface
	use({
		"lewis6991/gitsigns.nvim",
		requires = { "nvim-lua/plenary.nvim" },
	})
	use({
		"nvim-telescope/telescope.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			require("telescope").setup({
				pickers = {
					find_files = {
						hidden = true,
					},
				},
			})
		end,
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
		"akinsho/bufferline.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("bufferline").setup({})
		end,
	})
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons" },
		after = "nord.nvim",
		config = function()
			require("lualine").setup({
				options = {
					section_separators = "",
					component_separators = "",
					theme = "nord",
				},
			})
		end,
	})
	use({
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup({})
		end,
	})
	use("famiu/bufdelete.nvim")

	-- completion
	use("neovim/nvim-lspconfig")
	use("rafamadriz/friendly-snippets")
	use("onsails/lspkind-nvim")
	use({
		"hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-emoji",
			"hrsh7th/cmp-calc",
			"hrsh7th/cmp-vsnip",
			"hrsh7th/vim-vsnip",
		},
	})

	-- lisp
	use("Olical/conjure")
	use({
		"eraserhd/parinfer-rust",
		run = "cargo build --release",
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
end)

require("plugins.cmp")
require("plugins.gitsigns")
require("plugins.lspconfig")
require("plugins.vsnip")
