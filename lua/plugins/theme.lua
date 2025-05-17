local M = {}

function M.tokyonight()
  return {
    "folke/tokyonight.nvim",
    config = function()
      vim.g.tokyonight_transparent = true
      vim.cmd("colorscheme tokyonight")
    end
  }
end

function M.kanagawa()
  return {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      vim.cmd("colorscheme kanagawa")
    end
  }
end

return M.kanagawa()
