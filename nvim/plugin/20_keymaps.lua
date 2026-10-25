-- Basic
vim.keymap.set('n', '<Esc>', '<Cmd>noh<CR>', { desc = 'Clear highlighting' })
vim.keymap.set('n', '<Leader>qq', '<Cmd>qa<CR>', { desc = 'Quit all' })
vim.keymap.set('n', '<C-s>', '<Cmd>silent! update<CR>', { desc = 'Save file' })
vim.keymap.set({ 'i', 'x' }, '<C-s>', '<Esc><Cmd>silent! update<CR>', { desc = 'Save file' })

local cd_to_root = function()
  local root = Snacks.git.get_root() or vim.fn.expand('%:p:h')
  vim.fn.chdir(root, 'tabpage')
end

vim.keymap.set('n', '<Leader>cd', cd_to_root, { desc = 'cd to the project root' })

-- Windows
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Focus on left window' })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Focus on below window' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Focus on above window' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Focus on right window' })

-- Utilities
vim.keymap.set('n', '-', '<Cmd>Oil<CR>', { desc = 'Explorer' })
vim.keymap.set({ 'n', 't' }, '<C-/>', function() Snacks.terminal.focus() end, { desc = 'Terminal' })

-- Pickers
vim.keymap.set('n', '<Leader>r', function() Snacks.picker.resume() end, { desc = 'Resume' })
vim.keymap.set('n', '<Leader><Space>', function() Snacks.picker.smart() end, { desc = 'Smart' })
vim.keymap.set('n', '<Leader>ff', function() Snacks.picker.files() end, { desc = 'Files' })
vim.keymap.set('n', '<Leader>fv', function() Snacks.picker.recent() end, { desc = 'Recent' })
vim.keymap.set('n', '<Leader>fb', function() Snacks.picker.buffers() end, { desc = 'Buffers' })
vim.keymap.set('n', '<Leader>fg', function() Snacks.picker.grep() end, { desc = 'Grep' })
vim.keymap.set('n', '<Leader>fl', function() Snacks.picker.lines() end, { desc = 'Lines' })
vim.keymap.set('n', '<Leader>fd', function() Snacks.picker.diagnostics() end, { desc = 'Diagnostics' })
vim.keymap.set('n', '<Leader>fh', function() Snacks.picker.help() end, { desc = 'Help' })
vim.keymap.set('n', '<Leader>fr', function() Snacks.picker.lsp_references() end, { desc = 'References' })
vim.keymap.set('n', '<Leader>fs', function() Snacks.picker.lsp_symbols() end, { desc = 'Symbols' })
vim.keymap.set('n', '<Leader>fw', function() Snacks.picker.lsp_workspace_symbols() end, { desc = 'Workspace symbols' })
vim.keymap.set('n', '<Leader>zi', function() Snacks.picker.zoxide() end, { desc = 'Zoxide' })

-- Git
vim.keymap.set('n', '<Leader>gs', function() Snacks.picker.git_status() end, { desc = 'Git status' })
vim.keymap.set('n', '<Leader>gd', '<Cmd>DiffviewOpen<CR>', { desc = 'Open Diffview' })
vim.keymap.set('n', '<Leader>gg', '<Cmd>Neogit<CR>', { desc = 'Open Neogit' })

-- Tabs
vim.keymap.set('n', '<Leader><Tab><Tab>', '<Cmd>tabnew<CR>', { desc = 'New tab' })
vim.keymap.set('n', '<Leader><Tab>c', '<Cmd>tabclose<CR>', { desc = 'Close tab' })
vim.keymap.set('n', '<Leader><Tab>o', '<Cmd>tabonly<CR>', { desc = 'Close other tabs' })

-- Buffers
vim.keymap.set('n', '<Leader>bd', function() Snacks.bufdelete() end, { desc = 'Delete buffer' })
vim.keymap.set('n', '<Leader>bo', function() Snacks.bufdelete.other() end, { desc = 'Delete other buffers' })
vim.keymap.set('n', '<Leader>bi', function() Snacks.bufdelete.invisible() end, { desc = 'Delete invisible buffers' })

-- LSP
vim.keymap.set({ 'n', 'x' }, '<Leader>la', function() vim.lsp.buf.code_action() end, { desc = 'Actions' })
vim.keymap.set({ 'n', 'x' }, '<Leader>lf', function() require('conform').format() end, { desc = 'Format' })
vim.keymap.set('n', '<Leader>ld', function() vim.diagnostic.open_float() end, { desc = 'Diagnostic popup' })
vim.keymap.set('n', '<Leader>lr', function() vim.lsp.buf.rename() end, { desc = 'Rename' })

-- Notes
local notes_dir = vim.fn.expand('~/Documents/Notes')
local notes_inbox = notes_dir .. '/inbox.md'

vim.keymap.set('n', '<Leader>ni', function()
  vim.cmd.edit(vim.fn.fnameescape(notes_inbox))
end, { desc = 'Open inbox' })

vim.keymap.set('n', '<Leader>nf', function()
  Snacks.picker.files({ cwd = notes_dir })
end, { desc = 'Find note' })

vim.keymap.set('n', '<leader>ng', function()
  Snacks.picker.grep({ cwd = notes_dir })
end, { desc = 'Grep notes' })

vim.keymap.set('n', '<leader>nt', function()
  Snacks.picker.grep({
    cwd = notes_dir,
    search = [[^\s*[-*+]\s+\[[\s-]\]\s+]],
    regex = true,
    live = false,
    title = 'Unfinished tasks',
  })
end, { desc = 'Unfinished tasks' })

vim.keymap.set('n', '<leader>nc', function()
  if vim.fn.filereadable(notes_inbox) == 0 then
    vim.fn.writefile({ '# Inbox', '' }, notes_inbox)
  end
  vim.cmd.edit(vim.fn.fnameescape(notes_inbox))
  vim.cmd('normal! 2Go- [ ] ')
  vim.cmd('startinsert!')
end, { desc = 'Quick capture' })

vim.keymap.set('n', '<leader>nn', function()
  vim.ui.input({ prompt = 'Note title: ' }, function(title)
    if not title or title == '' then return end
    local slug = title:lower():gsub('%s+', '-'):gsub('[^%w%-]', '')
    local file = string.format('%s/%s.md', notes_dir, slug)
    if vim.fn.filereadable(file) == 0 then
      vim.fn.writefile({ '# ' .. title, '' }, file)
    end
    vim.cmd.edit(vim.fn.fnameescape(file))
  end)
end, { desc = 'New note' })
