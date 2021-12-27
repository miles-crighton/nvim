--- Set cmds ---
vim.cmd('set iskeyword+=-') -- treat dash separated words as a word text object"
vim.cmd('set shortmess+=c') -- Don't pass messages to |ins-completion-menu|.
vim.cmd('set inccommand=split') -- Make substitution work in realtime
vim.cmd('set autoread') -- autoread changes to buffered files on file system

--- General Configs ---
vim.o.fileencoding = "utf-8" -- The encoding written to ile
vim.cmd('set colorcolumn=99999') -- fix indentline for now
vim.o.mouse = "a" -- Enable your mouse
vim.o.conceallevel = 0 -- So that I can see `` in markdown files
vim.o.showmode = false -- We don't need to see things like -- INSERT -- anymore
vim.o.backup = false -- This is recommended by coc
vim.o.writebackup = false -- This is recommended by coc

--- Line Wrapping ---
vim.wo.wrap = false -- Display long lines as just one line
vim.cmd('set whichwrap+=<,>,[,]') -- move to next line with theses keys
vim.o.hidden = true -- Required to keep multiple buffers open multiple buffers

--- Terminal Title ---
vim.o.title = true
TERMINAL = vim.fn.expand('$TERMINAL')
vim.cmd('let &titleold="' .. TERMINAL .. '"')
vim.o.titlestring = "%<%F%= - nvim"

--- Tab/Space inserts ---
vim.cmd('set ts=2') -- Insert 2 spaces for a tab
vim.cmd('set sw=2') -- Change the number of space characters inserted for indentation
vim.cmd('set expandtab') -- uses spaces instead of tabs
vim.bo.smartindent = true -- Makes indenting smart
vim.bo.expandtab = true -- Converts tabs to spaces

--- Splits ---
vim.o.splitbelow = true -- Horizontal splits will automatically be below
vim.o.splitright = true -- Vertical splits will automatically be to the right

--- Element sizing ---
vim.o.pumheight = 10 -- Makes popup menu smaller
vim.o.cmdheight = 1 -- More space for displaying messages
vim.o.foldcolumn = "0" -- Left indent (margin)
vim.wo.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
vim.o.showtabline = 0 -- Always show tabs

--- Scrolling ---
vim.o.scrolloff = 8 -- Lines before scrolling

--- Timeouts ---
vim.o.updatetime = 500 -- Time before any plugins get to update
vim.o.timeoutlen = 300 -- Time for key sequences to be completed
vim.o.ttimeoutlen = 0

--- Colors & Highlights ---
vim.g.tokyonight_transparent = true
vim.o.termguicolors = true -- set term giu colors most terminals support this
vim.wo.cursorline = true -- Enable highlighting of the current line
vim.cmd('syntax on')

--- Line numbers
vim.wo.number = true -- set numbered line2
vim.wo.relativenumber = true -- set relative number

--- Copy + Paste ---
vim.o.clipboard = "unnamedplus" -- Copy paste between vim and everything else

-- Blamer Plugin
vim.g.blamer_enabled = 1
vim.g.blamer_relative_time = 1
vim.g.blamer_show_in_visual_modes = 0

--- Font ---
-- vim.o.guifont = "FiraCode\\ Nerd\\ Font:h17"
