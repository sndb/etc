-- Enable line wrapping
vim.wo.wrap = true

-- Fold with treesitter
vim.wo.foldmethod = 'expr'
vim.wo.foldexpr   = 'v:lua.vim.treesitter.foldexpr()'

-- Navigate headings
vim.keymap.set('n', '<Leader>fs', function()
  Snacks.picker.lines({ pattern = '^#' })
end, { buffer = true, desc = 'Outline' })
