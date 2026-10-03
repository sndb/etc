-- Tabs for indentation
vim.bo.expandtab  = false
vim.bo.shiftwidth = 4
vim.bo.tabstop    = 4

-- Fold with treesitter
vim.wo.foldmethod = 'expr'
vim.wo.foldexpr   = 'v:lua.vim.treesitter.foldexpr()'

-- Disable list mode
vim.wo.list = false
