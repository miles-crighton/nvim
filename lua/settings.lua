vim.cmd('set iskeyword+=-') -- treat dash separated words as a word text object"
vim.cmd('set shortmess+=c') -- Don't pass messages to |ins-completion-menu|.
vim.cmd('set inccommand=split') -- Make substitution work in realtime
-- vim.cmd('set autochdir') -- change the dir to current file
vim.o.hidden = O.hidden_files -- Required to keep multiple buffers open multiple buffers
vim.o.title = true
TERMINAL = vim.fn.expand('$TERMINAL')
vim.cmd('let &titleold="'..TERMINAL..'"')
vim.o.titlestring="%<%F%=%l/%L - nvim"
vim.wo.wrap = O.wrap_lines -- Display long lines as just one line
vim.cmd('set whichwrap+=<,>,[,],h,l') -- move to next line with theses keys
vim.cmd('syntax on') -- move to next line with theses keys
vim.o.pumheight = 10 -- Makes popup menu smaller
vim.o.fileencoding = "utf-8" -- The encoding written to ile
vim.o.cmdheight = 1 -- More space for displaying messages
vim.cmd('set colorcolumn=99999') -- fix indentline for now
vim.o.mouse = "a" -- Enable your mouse
vim.o.splitbelow = true -- Horizontal splits will automatically be below
vim.o.termguicolors = true -- set term giu colors most terminals support this
vim.o.splitright = true -- Vertical splits will automatically be to the right
vim.o.t_Co = "256" -- Support 256 colors
vim.o.conceallevel = 0 -- So that I can see `` in markdown files
vim.cmd('set ts=2') -- Insert 2 spaces for a tab
vim.cmd('set sw=2') -- Change the number of space characters inserted for indentation
vim.cmd('set expandtab') -- uses spaces instead of tabs
vim.bo.expandtab = true -- Converts tabs to spaces
vim.bo.smartindent = true -- Makes indenting smart
vim.wo.number = O.number -- set numbered line2
vim.wo.relativenumber = O.relative_number -- set relative number
vim.wo.cursorline = true -- Enable highlighting of the current line
vim.o.showtabline = 2 -- Always show tabs
vim.o.scrolloff = 8 -- Lines before scrolling
vim.o.foldcolumn = "2" -- Left indent
vim.o.showmode = false -- We don't need to see things like -- INSERT -- anymore
vim.o.backup = false -- This is recommended by coc
vim.o.writebackup = false -- This is recommended by coc
vim.wo.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
vim.o.updatetime = 500 -- Time before any plugins get to update
vim.o.timeoutlen = 300 -- Time for key sequences to be completed
vim.o.ttimeoutlen = 0
vim.o.clipboard = "unnamedplus" -- Copy paste between vim and everything else
-- vim.o.guifont = "JetBrainsMono\\ Nerd\\ Font\\ Mono:h18"
-- vim.o.guifont = "Hack\\ Nerd\\ Font\\ Mono"
-- vim.o.guifont = "SauceCodePro Nerd Font:h17"
-- vim.o.guifont = "FiraCode\\ Nerd\\ Font:h17"
vim.g.tokyonight_transparent = true

-- Blamer Plugin
vim.g.blamer_enabled = 1
vim.g.blamer_relative_time = 1
vim.g.blamer_show_in_visual_modes = 0
