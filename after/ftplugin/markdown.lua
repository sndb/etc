-- Enable line wrapping
vim.wo.wrap = true

-- Fold with treesitter
vim.wo.foldmethod = 'expr'
vim.wo.foldexpr   = 'v:lua.vim.treesitter.foldexpr()'
