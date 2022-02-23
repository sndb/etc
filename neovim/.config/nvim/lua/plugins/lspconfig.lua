local lspconfig = require("lspconfig")

local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<space>e", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
vim.api.nvim_set_keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
vim.api.nvim_set_keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
vim.api.nvim_set_keymap("n", "<space>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)

local on_attach = function(client, bufnr)
	local function map(mode, lhs, rhs)
		vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts)
	end

	map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
	map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
	map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
	map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
	map("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
	map("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>")
	map("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>")
	map("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>")
	map("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
	map("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
	map("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")
	map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
	map("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>")
end

local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

local servers = {
	"bashls",
	"clangd",
	"denols",
	"gdscript",
	"gopls",
	"pyright",
	"racket_langserver",
	"rust_analyzer",

	"html",
	"cssls",
	"jsonls",
}

for _, lsp in pairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
		flags = {
			-- TODO remove later, this will be the default in neovim 0.7
			debounce_text_changes = 150,
		},
	})
end

local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")
lspconfig.sumneko_lua.setup({
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
				path = runtime_path,
			},
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
			},
		},
	},
})
