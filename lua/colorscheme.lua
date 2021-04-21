vim.cmd('let g:nvcode_termcolors=256')

vim.cmd('colorscheme ' .. O.colorscheme)

-- Change diff colors for reduced contrast
vim.cmd('hi DiffAdd gui=NONE guifg=NONE guibg=#3d4543')
vim.cmd('hi DiffDelete gui=NONE guifg=NONE guibg=#3e303a')
