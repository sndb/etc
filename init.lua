-- General
vim.g.mapleader = '\\'
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
vim.lsp.enable({ 'pyright', 'gopls', 'zls' })

vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = { '*.go', '*.zig' },
  callback = function() vim.lsp.buf.format() end,
})

-- Highlight
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function() vim.hl.on_yank() end,
})

-- Plugins
vim.cmd([[
  call plug#begin()
  Plug 'ibhagwan/fzf-lua'
  Plug 'stevearc/oil.nvim'
  Plug 'kylechui/nvim-surround'
  Plug 'nvim-treesitter/nvim-treesitter', { 'branch': 'main' }
  Plug 'miikanissi/modus-themes.nvim'
  call plug#end()
]])

require('nvim-surround').setup({})

require('fzf-lua').setup({'default'})
vim.keymap.set('n', '<Leader>f', FzfLua.files)
vim.keymap.set('n', '<Leader>b', FzfLua.buffers)
vim.keymap.set('n', '<Leader>g', FzfLua.grep_project)
vim.keymap.set('n', '<Leader>o', FzfLua.oldfiles)
vim.keymap.set('n', '<Leader>d', FzfLua.diagnostics_document)
vim.keymap.set('n', '<Leader>s', FzfLua.lsp_document_symbols)
vim.keymap.set('n', '<Leader>a', FzfLua.lsp_code_actions)
vim.keymap.set('n', '<Leader>r', FzfLua.lsp_finder)
vim.keymap.set('n', '<Leader>h', FzfLua.help_tags)
vim.keymap.set('n', '<Leader>k', FzfLua.builtin)

require('oil').setup({
  view_options = { show_hidden = true },
  columns = { 'permissions', 'size', 'mtime' },
  constrain_cursor = 'name',
  watch_for_changes = true,
})

vim.keymap.set('n', '-', '<Cmd>Oil<CR>')

-- Treesitter
local treesitter_languages = { 'python', 'javascript', 'lua', 'c', 'go', 'zig', 'markdown' };

require('nvim-treesitter').install(treesitter_languages)

vim.api.nvim_create_autocmd('FileType', {
  pattern = treesitter_languages,
  callback = function() vim.treesitter.start() end,
})

-- Theme
vim.cmd('colorscheme modus')
