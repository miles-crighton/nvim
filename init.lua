require('lv-globals')

local plugins = require "plugin-config"
require("plugin-loader").load {plugins}

vim.cmd('luafile ~/.config/nvim/lv-settings.lua')

require('settings')
require('lv-utils')
require('autocommands')
require('keymaps').setup()
require('colorscheme')
require('plugins/galaxyline')
require('plugins/comment')
require('plugins/compe')
require('plugins/telescope')
require('plugins/nvimtree')
require('plugins/treesitter')
require('plugins/autopairs')
-- require('rnvimr')
require('plugins/diffview')
require('plugins/whichkey')

-- NOTE: Been disabled, remove if no changes occur
-- vim.cmd('source ~/.config/nvim/vimscript/functions.vim')

-- LSP
require('lsp')
require('lsp.clangd')
require('lsp.php-ls')
require('lsp.dart-ls')
require('lsp.lua-ls')
require('lsp.bash-ls')
require('lsp.go-ls')
require('lsp.js-ts-ls')
require('lsp.python-ls')
require('lsp.rust-ls')
require('lsp.json-ls')
require('lsp.yaml-ls')
require('lsp.terraform-ls')
require('lsp.vim-ls')
require('lsp.graphql-ls')
require('lsp.docker-ls')
require('lsp.html-ls')
require('lsp.css-ls')
require('lsp.emmet-ls')
require('lsp.efm-general-ls')
require('lsp.latex-ls')
require('lsp.svelte-ls')
require('lsp.tailwindcss-ls')
require('lsp.ruby-ls')
require('lsp.kotlin-ls')
