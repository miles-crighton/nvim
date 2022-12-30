require("settings")

local plugins = require("plugin-config")
require("plugin-loader")

require("autocommands")
require("keymaps").setup()
require("colorscheme")
require("lsp")
