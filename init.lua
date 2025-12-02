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

vim.cmd('au TermOpen * startinsert')
vim.cmd('au FileType lua setlocal et ts=2 sw=2')
vim.cmd('au FileType go setlocal noet ts=4 sw=4 nolist')

-- LSP
vim.lsp.enable({'pyright', 'gopls', 'zls'})

vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = {'*.go', '*.zig'},
  callback = function(ev)
    vim.lsp.buf.format({bufnr = ev.buf})
  end,
})

-- Highlight
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.hl.on_yank()
  end,
})

-- Plugins
vim.cmd([[
  call plug#begin()
  Plug 'ibhagwan/fzf-lua'
  Plug 'miikanissi/modus-themes.nvim'
  call plug#end()
]])

-- Bindings
vim.keymap.set('n', '<Leader>e', '<Cmd>Ex<CR>')

require('fzf-lua')
vim.keymap.set('n', '<Leader>f', FzfLua.files)
vim.keymap.set('n', '<Leader>b', FzfLua.buffers)
vim.keymap.set('n', '<Leader>g', FzfLua.grep_project)
vim.keymap.set('n', '<Leader>d', FzfLua.diagnostics_document)
vim.keymap.set('n', '<Leader>s', FzfLua.lsp_document_symbols)
vim.keymap.set('n', '<Leader>h', FzfLua.help_tags)
vim.keymap.set('n', '<Leader>k', FzfLua.builtin)

-- Colorscheme
vim.cmd('colorscheme modus')
