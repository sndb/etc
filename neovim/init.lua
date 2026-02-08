-- General
vim.g.mapleader = ' '
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.wildignorecase = true
vim.o.completeopt = 'menu,menuone,popup,noselect,fuzzy'
vim.o.scrolloff = 10
vim.o.list = true
vim.o.confirm = true
vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.clipboard = 'unnamedplus'
vim.o.updatetime = 250
vim.o.splitright = true
vim.o.splitbelow = true

vim.cmd('au TermOpen * startinsert')
vim.cmd('au FileType lua setlocal et ts=2 sw=2')
vim.cmd('au FileType go setlocal noet ts=4 sw=4 nolist')

-- LSP
vim.lsp.enable({ 'pyright', 'clangd', 'gopls', 'zls' })

vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = { '*.go', '*.zig' },
  callback = function() vim.lsp.buf.format() end,
})

vim.keymap.set('n', '<Leader>a', vim.lsp.buf.code_action)

-- Highlight
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function() vim.hl.on_yank() end,
})

-- Plugins
vim.cmd([[
  call plug#begin()
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'kylechui/nvim-surround'
  Plug 'lewis6991/gitsigns.nvim'
  Plug 'nvim-treesitter/nvim-treesitter', { 'branch': 'main' }
  Plug 'miikanissi/modus-themes.nvim'
  call plug#end()
]])

require('nvim-surround').setup({})

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<Leader>f', builtin.find_files)
vim.keymap.set('n', '<Leader>g', builtin.live_grep)
vim.keymap.set('n', '<Leader>b', builtin.buffers)
vim.keymap.set('n', '<Leader>o', builtin.oldfiles)
vim.keymap.set('n', '<Leader>d', builtin.diagnostics)
vim.keymap.set('n', '<Leader>t', builtin.lsp_document_symbols)
vim.keymap.set('n', '<Leader>r', builtin.lsp_references)
vim.keymap.set('n', '<Leader>s', builtin.git_status)

-- Gitsigns
local gitsigns = require('gitsigns')
vim.keymap.set('n', ']c', function() gitsigns.nav_hunk('next') end)
vim.keymap.set('n', '[c', function() gitsigns.nav_hunk('prev') end)
vim.keymap.set('n', '<Leader>hs', gitsigns.stage_hunk)
vim.keymap.set('n', '<Leader>hr', gitsigns.reset_hunk)
vim.keymap.set('n', '<Leader>hp', gitsigns.preview_hunk)
vim.keymap.set('n', '<Leader>hb', gitsigns.blame_line)

-- Netrw
vim.keymap.set('n', '-', '<Cmd>Explore<CR>')
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 1
vim.g.netrw_sizestyle = 'h'

-- Treesitter
local treesitter_languages = { 'python', 'javascript', 'lua', 'c', 'go', 'zig', 'markdown' };

require('nvim-treesitter').install(treesitter_languages)

vim.api.nvim_create_autocmd('FileType', {
  pattern = treesitter_languages,
  callback = function() vim.treesitter.start() end,
})

-- Theme
vim.cmd('colorscheme modus')
