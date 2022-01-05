require("lv-globals")

local plugins = require("plugin-config")
require("plugin-loader").load({ plugins })

require("settings")
require("autocommands")
require("keymaps").setup()
require("colorscheme")
require("lsp")
