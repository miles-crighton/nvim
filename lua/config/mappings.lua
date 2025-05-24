-- Keymaps and filetype mappings

-- ------------------
-- Utils for mappings
-- ------------------

-- Close floating windows
local function close_floating()
  for _, win in pairs(vim.api.nvim_list_wins()) do
    if vim.api.nvim_win_get_config(win).relative == 'win' then
      vim.api.nvim_win_close(win, false)
    end
  end
end

-- Keymap shortcut
local function map(mode, l, r, opts)
  opts = opts or {}
  vim.keymap.set(mode, l, r, opts)
end

-- -------
-- Keymaps
-- -------

-- Insert mode mappings
map('i', 'jk', '<ESC>', { desc = 'Exit insert mode' })
map('i', '<A-j>', '<cmd>cnext<CR>', { desc = 'Navigate to next quickfix item' })
map('i', '<A-k>', '<cmd>cprev<CR>', { desc = 'Navigate to previous quickfix item' })

-- Normal mode mappings
map('n', '<Space>', '<NOP>', { desc = 'Disable space in normal mode' })

-- Search and replace word under cursor
map('n', '<Leader>rr', ':%s/<C-R><C-W>//g<Left><Left>', {
  noremap = true,
  silent = true,
  desc = 'Search and replace word under cursor'
})

-- Better window movement
map('n', '<C-h>', '<C-w>h', { desc = 'Move focus to the left window' })
map('n', '<C-j>', '<C-w>j', { desc = 'Move focus to the lower window' })
map('n', '<C-k>', '<C-w>k', { desc = 'Move focus to the upper window' })
map('n', '<C-l>', '<C-w>l', { desc = 'Move focus to the right window' })

-- Make Y work like D
map('n', 'Y', 'y$', { desc = 'Yank to end of line' })

-- Jumplist Mutations
map('n', 'k', '(v:count > 5 ? "m\'" . v:count : "") . \'k\'', {
  noremap = true,
  silent = true,
  expr = true,
  desc = 'Move up with jumplist mutation for large movements'
})
map('n', 'j', '(v:count > 5 ? "m\'" . v:count : "") . \'j\'', {
  noremap = true,
  silent = true,
  expr = true,
  desc = 'Move down with jumplist mutation for large movements'
})

-- Resize with arrows
map('n', '<C-Up>', ':resize -2<CR>', { desc = 'Decrease window height' })
map('n', '<C-Down>', ':resize +2<CR>', { desc = 'Increase window height' })
map('n', '<C-Left>', ':vertical resize -2<CR>', { desc = 'Decrease window width' })
map('n', '<C-Right>', ':vertical resize +2<CR>', { desc = 'Increase window width' })

-- Stable center for next/prev
map('n', 'n', 'nzzzv', { noremap = true, silent = true, desc = 'Next search result centered' })
map('n', 'N', 'Nzzzv', { noremap = true, silent = true, desc = 'Previous search result centered' })
map('n', 'J', 'mzJ`z', { noremap = true, silent = true, desc = 'Join lines with cursor position preserved' })

-- QuickFix
map('n', ']q', ':cnext<CR>', { desc = 'Next quickfix item' })
map('n', '[q', ':cprev<CR>', { desc = 'Previous quickfix item' })
map('n', '<C-q>', ':call QuickFixToggle()<CR>', { desc = 'Toggle quickfix window' })

-- Re-source config
map('n', '<Leader>ss', ':luafile $MYVIMRC<CR>', { noremap = true, desc = 'Reload Neovim configuration' })

-- Telescope
map('n', '<Leader>f',
  ":lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})<CR>", {
    desc = 'Find files with Telescope'
  })

-- Tree/File explorer
map('n', '<Leader>e', ":lua require('oil').open()<CR>", { desc = 'Open Oil file manager' })

-- Buffers
map('n', '<Leader>c', ':BufferClose<CR>', { desc = 'Close buffer' })

-- Highlights
map('n', '<Leader>h', ':set hlsearch!<CR>', { desc = 'Toggle search highlighting' })

-- GitHub integration
map('n', '<Leader><C-r>', ':OpenInGHRepo<CR>', { desc = 'Open repository in GitHub' })
map('n', '<Leader>gf', ':OpenInGHFile<CR>', { desc = 'Open file in GitHub' })

-- Re-map as netrw is disabled
map('n', 'gx', ':execute \'!open \' . shellescape(expand(\'<cfile>\'), 1)<CR>', {
  noremap = true,
  silent = true,
  desc = 'Open file under cursor with system default'
})

-- Terminal mode mappings
map('t', '<C-h>', '<C-\\><C-N><C-w>h', { desc = 'Terminal: move focus to left window' })
map('t', '<C-j>', '<C-\\><C-N><C-w>j', { desc = 'Terminal: move focus to lower window' })
map('t', '<C-k>', '<C-\\><C-N><C-w>k', { desc = 'Terminal: move focus to upper window' })
map('t', '<C-l>', '<C-\\><C-N><C-w>l', { desc = 'Terminal: move focus to right window' })
map('t', '<Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Visual mode mappings
map('v', '<', '<gv', { desc = 'Indent left and reselect' })
map('v', '>', '>gv', { desc = 'Indent right and reselect' })
map('v', '<leader>/', ':CommentToggle<CR>', { desc = 'Toggle comment' })
map('v', '<Leader>gf', ':OpenInGHFileLines<CR>', { desc = 'Open selected lines in GitHub' })

-- Visual block mode mappings
map('x', 'K', ':move \'<-2<CR>gv-gv', { desc = 'Move selected text up' })
map('x', 'J', ':move \'>+1<CR>gv-gv', { desc = 'Move selected text down' })
