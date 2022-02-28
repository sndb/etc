local opts = { noremap = true }

-- leader
vim.g.mapleader = "\\"
vim.g.maplocalleader = ","

-- navigation
vim.api.nvim_set_keymap("n", "-", "<Cmd>Explore<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-n>", "<Cmd>cnext<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-p>", "<Cmd>cprevious<CR>", opts)
vim.api.nvim_set_keymap("n", "<Leader>c", "<Cmd>cclose<CR>", opts)

-- shell
vim.api.nvim_set_keymap("n", "<Leader>r", "<Cmd>.w !bash<CR>", opts)
vim.api.nvim_set_keymap("n", "<Leader>t", "<Cmd>vs<CR><Cmd>te<CR>", opts)

-- format
vim.api.nvim_set_keymap("n", "<Leader>=", "<Cmd>Neoformat<CR>", opts)

-- telescope
vim.api.nvim_set_keymap("n", "<Leader>f", "<Cmd>lua require('telescope.builtin').find_files()<CR>", opts)
vim.api.nvim_set_keymap("n", "<Leader>g", "<Cmd>lua require('telescope.builtin').live_grep()<CR>", opts)
vim.api.nvim_set_keymap("n", "<Leader>b", "<Cmd>lua require('telescope.builtin').buffers()<CR>", opts)

-- buffers
vim.api.nvim_set_keymap("n", "]b", "<Cmd>BufferLineCycleNext<CR>", opts)
vim.api.nvim_set_keymap("n", "[b", "<Cmd>BufferLineCyclePrev<CR>", opts)
vim.api.nvim_set_keymap("n", "<Leader>x", "<Cmd>bwipeout<CR>", opts)
