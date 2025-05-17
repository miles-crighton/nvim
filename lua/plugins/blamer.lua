local M = { "APZelos/blamer.nvim" }

function M.config()
  vim.g.blamer_enabled = 1
  vim.g.blamer_relative_time = 1
  vim.g.blamer_show_in_visual_modes = 0
end

return M
