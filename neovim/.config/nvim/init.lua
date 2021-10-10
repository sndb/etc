vim.cmd([[
call plug#begin(stdpath('data') . '/plugged')
	Plug 'ap/vim-css-color'
	Plug 'arcticicestudio/nord-vim'
	Plug 'mattn/vim-goimports'
	Plug 'neovim/nvim-lspconfig'
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
	Plug 'onsails/lspkind-nvim'
	Plug 'sbdchd/neoformat'
	Plug 'tpope/vim-commentary'
	Plug 'tpope/vim-repeat'
	Plug 'tpope/vim-surround'
	Plug 'windwp/nvim-autopairs'

	Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-telescope/telescope.nvim'
	Plug 'lewis6991/gitsigns.nvim'

	Plug 'hrsh7th/nvim-cmp'
	Plug 'hrsh7th/vim-vsnip'
	Plug 'hrsh7th/cmp-buffer'
	Plug 'hrsh7th/cmp-nvim-lsp'
	Plug 'hrsh7th/cmp-vsnip'
	Plug 'hrsh7th/cmp-path'
	Plug 'hrsh7th/cmp-emoji'
	Plug 'hrsh7th/cmp-calc'
	Plug 'rafamadriz/friendly-snippets'
call plug#end()
]])

vim.cmd("colorscheme nord")

require("autocommands")
require("basics")
require("mappings")
require("wrapping")
require("plugins")
