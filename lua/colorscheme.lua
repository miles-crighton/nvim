vim.cmd('let g:nvcode_termcolors=256')

vim.cmd('colorscheme ' .. "tokyonight")

-- Change diff colors for reduced contrast
vim.cmd('hi DiffAdd gui=NONE guifg=NONE guibg=#3d4543')
vim.cmd('hi DiffDelete gui=NONE guifg=NONE guibg=#3e303a')

-- Darken current line highlight
vim.cmd('hi CursorLine guibg=#1f2335')
vim.cmd('hi CursorLineNR guibg=#1f2335')

-- Darken message area
vim.cmd('hi MsgArea guibg=#1f2335 guifg=#7dcfff')

-- Set window divider borders to be same color as background
vim.cmd('hi VertSplit ctermbg=NONE guibg=NONE guifg=#1f2335')
vim.cmd('set fillchars+=vert:█')
