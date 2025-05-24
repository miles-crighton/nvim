local g = vim.g
local o = vim.opt
local wo = vim.wo

-- Set leader key
g.mapleader = ' '

-- Enable mouse in all modes
o.mouse = "a"

-- Hide modes
o.showmode = false

--- Line Wrapping ---
wo.wrap = false

-- Break indent
o.breakindent = true

-- Use space to fill the space when tab is inserted, use 2 spaces r a tab
o.expandtab = true
o.tabstop = 2
o.softtabstop = 2

-- Always show the signcolumn
wo.signcolumn = "yes"

-- Number of spaces to use r an indent
o.shiftwidth = 2

-- Splits directions
o.splitbelow = true
o.splitright = true

-- Hide tab line
o.showtabline = 0

-- Lines to keep above and below cursor
o.scrolloff = 8

-- Enable highlighting of the current line
wo.cursorline = true

--- Enable line numbers and make them relative to cursor
o.number = true
o.relativenumber = true

-- Sync clipboard between OS and Neovim
vim.schedule(function()
  o.clipboard = 'unnamedplus'
end)
