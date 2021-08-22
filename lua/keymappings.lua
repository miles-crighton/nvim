vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', {noremap = true, silent = true})
vim.g.mapleader = ' '

-- resource config
vim.api.nvim_set_keymap('n', '<Leader>ss', ':luafile $MYVIMRC<CR>', {noremap = true})

-- no hl
vim.api.nvim_set_keymap('n', '<Leader>h', ':set hlsearch!<CR>', {noremap = true, silent = true})

vim.api.nvim_set_keymap('n', 'K', ':lua require(\'lspsaga.hover\').render_hover_doc()<CR>', {noremap = true, silent = true})

vim.api.nvim_set_keymap('n', 'gs', ':lua require(\'lspsaga.signaturehelp\').signature_help()<CR>', {noremap = true, silent = true})

-- Add a line above/below
vim.api.nvim_set_keymap('n', '<ENTER>', ':set paste<CR>m`o<Esc>``:set nopaste<CR>', {noremap = true, silent = true})
-- currently broken https://stackoverflow.com/questions/16359878/how-to-map-shift-enter
-- vim.api.nvim_set_keymap('n', '<C-ENTER>', ':set paste<CR>m`O<Esc>``:set nopaste<CR>', {noremap = true, silent = true})

-- Make Y work like D
vim.api.nvim_set_keymap('n', 'Y', 'y$', {noremap = true, silent = true})

-- Stable center for next/prev
vim.api.nvim_set_keymap('n', 'n', 'nzzzv', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'N', 'Nzzzv', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'J', 'mzJ`z', {noremap = true, silent = true})

-- Undo break points (ie. undo up to comma)
vim.api.nvim_set_keymap('i', ',', ',<c-g>u', {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', ';', ';<c-g>u', {noremap = true, silent = true})

-- Jumplist mutations
vim.api.nvim_set_keymap('n', 'k', '(v:count > 5 ? "m\'" . v:count : "") . \'k\'', {noremap = true, silent = true, expr = true})
vim.api.nvim_set_keymap('n', 'j', '(v:count > 5 ? "m\'" . v:count : "") . \'j\'', {noremap = true, silent = true, expr = true})

-- Moving text
vim.api.nvim_set_keymap('v', 'J', ':m \'>+1<CR>gv=gv', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', 'K', ':m \'<-2<CR>gv=gv', {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<C-j>', '<esc>:m .+1<CR>==', {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<C-k>', '<esc>:m .-2<CR>==', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>j', ':m .+1<CR>==', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>k', ':m .+1<CR>==', {noremap = true, silent = true})


-- explorer
vim.api.nvim_set_keymap('n', '<Leader>e', ':NvimTreeToggle<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '-', ':RnvimrToggle<CR>', {noremap = true, silent = true})

-- better window movement
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', {silent = true})
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', {silent = true})
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', {silent = true})
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', {silent = true})

-- TODO fix this
-- Terminal window navigation
vim.cmd([[
  tnoremap <C-h> <C-\><C-N><C-w>h
  tnoremap <C-j> <C-\><C-N><C-w>j
  tnoremap <C-k> <C-\><C-N><C-w>k
  tnoremap <C-l> <C-\><C-N><C-w>l
  inoremap <C-h> <C-\><C-N><C-w>h
  inoremap <C-j> <C-\><C-N><C-w>j
  inoremap <C-k> <C-\><C-N><C-w>k
  inoremap <C-l> <C-\><C-N><C-w>l
  tnoremap <Esc> <C-\><C-n>
]])

-- TODO fix this
-- resize with arrows
vim.cmd([[
  nnoremap <silent> <C-Up>    :resize -2<CR>
  nnoremap <silent> <C-Down>  :resize +2<CR>
  nnoremap <silent> <C-Left>  :vertical resize -2<CR>
  nnoremap <silent> <C-Right> :vertical resize +2<CR>
]])

-- better indenting
vim.api.nvim_set_keymap('v', '<', '<gv', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '>', '>gv', {noremap = true, silent = true})

-- I hate escape
vim.api.nvim_set_keymap('i', 'jk', '<ESC>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', 'kj', '<ESC>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', 'jj', '<ESC>', {noremap = true, silent = true})

-- Tab switch buffer
vim.api.nvim_set_keymap('n', '<TAB>', ':bnext<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<S-TAB>', ':bprevious<CR>', {noremap = true, silent = true})

-- Move selected line / block of text in visual mode
vim.api.nvim_set_keymap('x', 'K', ':move \'<-2<CR>gv-gv', {noremap = true, silent = true})
vim.api.nvim_set_keymap('x', 'J', ':move \'>+1<CR>gv-gv', {noremap = true, silent = true})

-- Better nav for omnicomplete
vim.cmd('inoremap <expr> <c-j> (\"\\<C-n>\")')
vim.cmd('inoremap <expr> <c-k> (\"\\<C-p>\")')
