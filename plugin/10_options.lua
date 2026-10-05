-- General
vim.g.mapleader = ' '           -- Use `<Space>` as <Leader> key
vim.o.undofile  = true          -- Enable persistent undo
vim.o.clipboard = 'unnamedplus' -- Always use system clipboard

-- UI
vim.o.list           = true     -- Show helpful text indicators
vim.o.pumheight      = 20       -- Make popup menu smaller
vim.o.pummaxwidth    = 100      -- Make popup menu not too wide
vim.o.signcolumn     = 'yes'    -- Always show signcolumn (less flicker)
vim.o.splitbelow     = true     -- Horizontal splits will be below
vim.o.splitright     = true     -- Vertical splits will be to the right
vim.o.splitkeep      = 'screen' -- Reduce scroll during window split
vim.o.scrolloff      = 5        -- Minimum lines above and below cursor
vim.o.wrap           = false    -- Don't visually wrap lines (toggle with \w)
vim.o.linebreak      = true     -- Wrap lines at spaces (if 'wrap' is set)
vim.o.foldenable     = false    -- Open all folds by default

-- Editing
vim.o.expandtab      = true     -- Convert tabs to spaces
vim.o.shiftwidth     = 4        -- Use this number of spaces for indentation
vim.o.tabstop        = 4        -- Show tab as this number of spaces
vim.o.formatoptions  = 'rqn1j'  -- Improve comment editing
vim.o.ignorecase     = true     -- Ignore case during search
vim.o.wildignorecase = true     -- Ignore case when completing file names
vim.o.smartcase      = true     -- Respect case if search pattern has upper case

-- Pattern for a start of numbered list (used in `gw`). This reads as
-- "Start of list item is: at least one special character (digit, -, +, *)
-- possibly followed by punctuation (. or `)`) followed by at least one space".
vim.o.formatlistpat = [[^\s*[0-9\-\+\*]\+[\.\)]*\s\+]]

-- Don't auto-wrap comments and don't insert comment leader after hitting 'o'.
-- Do on `FileType` to always override these changes from filetype plugins.
local f = function() vim.cmd('setlocal formatoptions-=c formatoptions-=o') end
Config.new_autocmd('FileType', nil, f, "Proper 'formatoptions'")

-- Communicate the Neovim's cwd to the terminal emulator.
local print_osc7 = function()
  local osc7 = string.format('\027]7;file://%s%s\027\\', vim.fn.hostname(), vim.fn.getcwd())
  io.stdout:write(osc7)
  io.stdout:flush()
end

Config.new_autocmd('DirChanged', nil, print_osc7, 'Notify the host terminal of cwd changes.')

-- Highlight on yank.
Config.new_autocmd('TextYankPost', '*', function() vim.hl.on_yank() end, 'Highlight yanked text')
