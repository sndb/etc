-- leader
vim.g.mapleader = "\\"
vim.g.maplocalleader = ","

local mappings = {
	-- navigation
	["-"] = "<Cmd>Explore<CR>",
	["<C-j>"] = "<Cmd>cnext<CR>",
	["<C-k>"] = "<Cmd>cprevious<CR>",
	["<Leader>c"] = "<Cmd>cclose<CR>",

	-- shell
	["<Leader>r"] = "<Cmd>.w !bash<CR>",
	["<Leader>t"] = "<Cmd>vs<CR><Cmd>te<CR>",

	-- format
	["<Leader>="] = "<Cmd>Neoformat<CR>",

	-- telescope
	["<Leader>f"] = "<Cmd>lua require('telescope.builtin').find_files()<CR>",
	["<Leader>g"] = "<Cmd>lua require('telescope.builtin').live_grep()<CR>",
	["<Leader>b"] = "<Cmd>lua require('telescope.builtin').buffers()<CR>",

	-- buffers
	["<C-n>"] = "<Cmd>BufferLineCycleNext<CR>",
	["<C-p>"] = "<Cmd>BufferLineCyclePrev<CR>",
	["<Leader>x"] = "<Cmd>Bwipeout<CR>",
}

for mapping, action in pairs(mappings) do
	vim.api.nvim_set_keymap("n", mapping, action, { noremap = true, silent = true })
end
