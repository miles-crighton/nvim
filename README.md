# Personal Nvim Config

> Currently used with NVIM v0.7.0

The structure of this config aims to be as easy as possible for me to alter and tinker with.

Wherever possible, distinct parts of the config are kept isolated to prevent a mess of interdependent settings. ie. keymaps, plugins etc.

## Vim config

All vim level config is stored in `lua/settings.lua`

## Plugins

Plugins loading is separated into two parts: `plugin-config` and the `plugin-loader`

The `plugin-config` stores a static configuration for all plugins as well as calls to their respective `setup` functions which are located in the `plugins` directory.

The loader runs through the plugin configs and initialises them using [Packer's](https://github.com/wbthomason/packer.nvim) API

## Keymaps

Similar to plugins keymaps are also separated into both a static config along with a dynamic loader.

## LSP

Using nvim's native LSP, the plugin (nvm-lsp-config)[https://github.com/neovim/nvim-lspconfig] is used to setup generic attach handlers for a buffer's file type using an available language server.

[Null-ls](https://github.com/jose-elias-alvarez/null-ls.nvim) is used to handle setup of linting and formatting.

## Mentions

Some of the original setup for this config came from [LunarVim](https://github.com/LunarVim/LunarVim), thanks to [chris@machine](https://www.chrisatmachine.com/) for building that project as well as their Nvim tutorials.
