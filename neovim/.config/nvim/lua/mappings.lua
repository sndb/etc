-- navigation
vim.api.nvim_set_keymap("n", "-", "<Cmd>Explore<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-n>", "<Cmd>cnext<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-p>", "<Cmd>cprevious<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>c", "<Cmd>cclose<CR>", { noremap = true })

-- shell
vim.api.nvim_set_keymap("n", "<Leader>r", "<Cmd>.w !bash<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>t", "<Cmd>vs<CR><Cmd>te<CR>", { noremap = true })

-- format
vim.api.nvim_set_keymap("n", "<Leader>=", "<Cmd>Neoformat<CR>", { noremap = true })

-- telescope
vim.api.nvim_set_keymap("n", "<leader>f", "<Cmd>lua require('telescope.builtin').find_files()<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>g", "<Cmd>lua require('telescope.builtin').live_grep()<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>b", "<Cmd>lua require('telescope.builtin').buffers()<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>h", "<Cmd>lua require('telescope.builtin').help_tags()<CR>", { noremap = true })
