-- Treesitter
vim.pack.add({
  'https://github.com/nvim-treesitter/nvim-treesitter',
  'https://github.com/nvim-treesitter/nvim-treesitter-textobjects',
})

-- Update parsers after plugin upgrade.
local ts_update = function() vim.cmd('TSUpdate') end
Config.on_packchanged('nvim-treesitter', { 'update' }, ts_update, ':TSUpdate')

-- Auto-install treesitter parsers.
local languages = { 'vimdoc', 'markdown', 'go', 'gomod', 'python', 'lua' }
require('nvim-treesitter').install(languages)

-- Enable treesitter for supported languages.
local filetypes = {}
for _, lang in ipairs(languages) do
  for _, ft in ipairs(vim.treesitter.language.get_filetypes(lang)) do
    table.insert(filetypes, ft)
  end
end
local ts_start = function(ev) vim.treesitter.start(ev.buf) end
Config.new_autocmd('FileType', filetypes, ts_start, 'Start treesitter')

-- LSP
vim.pack.add({ 'https://github.com/neovim/nvim-lspconfig' })
vim.lsp.enable({ 'gopls', 'pyright', 'clangd', 'lua_ls' })

-- Conform
vim.pack.add({ 'https://github.com/stevearc/conform.nvim' })

require('conform').setup({
  default_format_opts = {
    lsp_format = 'fallback',
  },
  formatters_by_ft = {
    lua = { 'stylua' },
    python = { 'ruff_format' },
    json = { 'deno_fmt' },
    javascript = { 'deno_fmt' },
  },
})

-- Colorscheme
vim.pack.add({ { src = 'https://github.com/catppuccin/nvim', name = 'catppuccin' } })
vim.cmd.colorscheme('catppuccin-nvim')

-- Snacks
vim.pack.add({ 'https://github.com/folke/snacks.nvim' })

require('snacks').setup({
  picker = { enabled = true },
})

-- Gitsigns
vim.pack.add({ 'https://github.com/lewis6991/gitsigns.nvim' })

local gitsigns = require('gitsigns')
gitsigns.setup({
  on_attach = function(bufnr)
    local map = function(mode, lhs, rhs, desc)
      vim.keymap.set(mode, lhs, rhs, { buf = bufnr, desc = desc })
    end

    -- Navigation
    local next_hunk = function()
      if vim.wo.diff then
        vim.cmd.normal({ ']c', bang = true })
      else
        gitsigns.nav_hunk('next')
      end
    end

    local prev_hunk = function()
      if vim.wo.diff then
        vim.cmd.normal({ '[c', bang = true })
      else
        gitsigns.nav_hunk('prev')
      end
    end

    map('n', ']c', next_hunk, 'Next hunk')
    map('n', '[c', prev_hunk, 'Previous hunk')

    -- Actions
    map('n', '<Leader>hs', gitsigns.stage_hunk, 'Stage hunk')
    map('n', '<Leader>hr', gitsigns.reset_hunk, 'Reset hunk')

    map('x', '<Leader>hs', function()
      gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
    end, 'Stage region')

    map('x', '<Leader>hr', function()
      gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
    end, 'Reset region')

    map('n', '<Leader>hS', gitsigns.stage_buffer, 'Stage buffer')
    map('n', '<Leader>hR', gitsigns.reset_buffer, 'Reset buffer')
    map('n', '<Leader>hp', gitsigns.preview_hunk, 'Preview hunk')

    map('n', '<Leader>hb', function()
      gitsigns.blame_line({ full = true })
    end, 'Blame line')

    map('n', '<Leader>hq', gitsigns.setqflist, 'Quickfix hunks (buffer)')
    map('n', '<Leader>hQ', function() gitsigns.setqflist('all') end, 'Quickfix hunks (all)')

    -- Text object
    map({ 'o', 'x' }, 'ih', gitsigns.select_hunk, 'Select hunk')
  end
})

-- Diffview
vim.pack.add({ 'https://github.com/sindrets/diffview.nvim' })

require('diffview').setup({
  enhanced_diff_hl = true,
  use_icons = false,
  keymaps = {
    view = {
      ['<C-c>'] = '<Cmd>DiffviewClose<CR>'
    },
    file_panel = {
      ['<C-c>'] = '<Cmd>DiffviewClose<CR>',
      ['q'] = '<Cmd>DiffviewClose<CR>',
    },
  },
})

-- Neogit
vim.pack.add({ 'https://github.com/neogitorg/neogit' })

-- Blink
vim.pack.add({
  'https://github.com/saghen/blink.lib',
  'https://github.com/saghen/blink.cmp',
})

local cmp = require('blink.cmp')
cmp.build():pwait()
cmp.setup({
  sources = { default = { 'lsp', 'path', 'buffer' } },
  completion = { menu = { auto_show = false } },
})

-- Oil
vim.pack.add({ 'https://github.com/stevearc/oil.nvim' })

local oil = require('oil')
oil.setup({
  keymaps = {
    ['g?'] = 'actions.show_help',
    ['<CR>'] = 'actions.select',
    ['<C-v>'] = { 'actions.select', opts = { vertical = true } },
    ['<C-s>'] = { 'actions.select', opts = { horizontal = true } },
    ['<C-t>'] = { 'actions.select', opts = { tab = true } },
    ['<C-p>'] = 'actions.preview',
    ['<C-c>'] = 'actions.close',
    ['-'] = 'actions.parent',
    ['_'] = 'actions.open_cwd',
    ['<Leader>cd'] = { 'actions.cd', opts = { scope = 'tab' } },
    ['gs'] = 'actions.change_sort',
    ['gx'] = 'actions.open_external',
    ['g.'] = 'actions.toggle_hidden',

    ['q'] = 'actions.close',
    ['l'] = 'actions.select',
    ['h'] = 'actions.parent',

    ['gh'] = '<Cmd>edit $HOME<CR>',
    ['gd'] = '<Cmd>edit $HOME/Downloads<CR>',
    ['<Leader>ff'] = function() Snacks.picker.files({ cwd = oil.get_current_dir() }) end,
    ['<Leader>fg'] = function() Snacks.picker.grep({ cwd = oil.get_current_dir() }) end,
  },
  use_default_keymaps = false,
  columns = { 'icon', 'permissions', 'size', 'mtime' },
  view_options = { show_hidden = true },
  watch_for_changes = true,
})

-- Quicker
vim.pack.add({ 'https://github.com/stevearc/quicker.nvim' })
require('quicker').setup()
