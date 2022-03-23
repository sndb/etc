-- basics
vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true
vim.o.hlsearch = false
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.gdefault = true
vim.o.scrolloff = 32
vim.o.inccommand = "split"
vim.o.modeline = false
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.hidden = true
vim.o.list = true
vim.o.listchars = "tab:>-,trail:~,extends:>,precedes:<,nbsp:+"
vim.o.clipboard = "unnamedplus"
vim.o.updatetime = 50
vim.o.timeoutlen = 500
vim.o.shortmess = vim.o.shortmess .. "I"
vim.o.completeopt = "menu,menuone,noselect"
vim.o.langmap =
	"ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz"
vim.o.termguicolors = true

-- autocommands
vim.cmd("autocmd TermOpen * startinsert")
vim.cmd("autocmd FileType html,css,scss,javascript,markdown,org setlocal et sw=2 sts=-1")

-- wrapping
vim.o.linebreak = true
vim.o.breakindent = true
vim.o.showbreak = "+++ "
vim.o.cpoptions = vim.o.cpoptions .. "n"
vim.o.sidescrolloff = 8
