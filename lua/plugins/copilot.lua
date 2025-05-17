local M = { "zbirenbaum/copilot.lua" }

M.cmd = "Copilot"

M.event = "InsertEnter"

M.opts = {
  suggestion = {
    auto_trigger = true,
  },
  panel = {
    layout = {
      position = "right",
    },
  },
}

return M
