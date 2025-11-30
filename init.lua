-- Basic settings.
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

vim.cmd('au FileType lua setlocal et ts=2 sw=2')
vim.cmd('au FileType go setlocal noet ts=8 sw=8 nolist')

-- Sync clipboard between OS and Neovim.
vim.api.nvim_create_autocmd('UIEnter', {
  callback = function()
    vim.o.clipboard = 'unnamedplus'
  end,
})

-- Configure LSP and autoformat.
vim.lsp.enable({'pyright', 'gopls', 'zls'})

vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = {'*.go', '*.zig'},
  callback = function(ev)
    vim.lsp.buf.format({bufnr = ev.buf})
  end,
})

-- Use <Esc> to exit terminal mode.
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

-- Navigate between windows.
vim.keymap.set({ 't', 'i' }, '<A-h>', '<C-\\><C-n><C-w>h')
vim.keymap.set({ 't', 'i' }, '<A-j>', '<C-\\><C-n><C-w>j')
vim.keymap.set({ 't', 'i' }, '<A-k>', '<C-\\><C-n><C-w>k')
vim.keymap.set({ 't', 'i' }, '<A-l>', '<C-\\><C-n><C-w>l')
vim.keymap.set({ 'n' }, '<A-h>', '<C-w>h')
vim.keymap.set({ 'n' }, '<A-j>', '<C-w>j')
vim.keymap.set({ 'n' }, '<A-k>', '<C-w>k')
vim.keymap.set({ 'n' }, '<A-l>', '<C-w>l')

-- Highlight when yanking (copying) text.
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.hl.on_yank()
  end,
})

-- Automatically turn off search highlighting.
vim.cmd('packadd! nohlsearch')
