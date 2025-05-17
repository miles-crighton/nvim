local M = { "glepnir/lspsaga.nvim" }

M.event = "BufRead"

M.opts = {
  code_action_lightbulb = {
    enable = false,
  },
  symbol_in_winbar = {
    enable = false,
  },
}

return M
