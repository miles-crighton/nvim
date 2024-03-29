vim.cmd("colorscheme kanagawa")

-- -- Change diff colors for reduced contrast
vim.cmd("hi DiffAdd gui=NONE guifg=NONE guibg=#3d4543")
vim.cmd("hi DiffDelete gui=NONE guifg=NONE guibg=#3e303a")

vim.cmd("hi NvimTreeIndentMarker gui=NONE guifg=NONE guibg=NONE")

-- Darken current line highlight
-- vim.cmd("hi CursorLine guibg=#1f2335")
-- vim.cmd("hi CursorLineNR guibg=#1f2335")

-- Darken message area
-- vim.cmd('hi MsgArea guibg=#1f2335 guifg=#9dcfff')

-- Set window divider borders to be same color as background
vim.cmd("hi VertSplit ctermbg=NONE guibg=NONE guifg=#363647")
vim.cmd("highlight clear SignColumn")
vim.cmd("highlight LineNr guibg=none")
vim.cmd("highlight GitSignsAdd guibg=NONE")
vim.cmd("highlight GitSignsChange guibg=NONE")
vim.cmd("highlight GitSignsDelete guibg=NONE")
-- vim.cmd('set fillchars+=vert:█')
