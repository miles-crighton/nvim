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

      -- Change diff colors for reduced contrast
      vim.cmd("hi DiffAdd gui=NONE guifg=NONE guibg=#3d4543")
      vim.cmd("hi DiffDelete gui=NONE guifg=NONE guibg=#3e303a")
      vim.cmd("hi VertSplit ctermbg=NONE guibg=NONE guifg=#363647")

      vim.cmd("highlight clear SignColumn")
      vim.cmd("highlight LineNr guibg=none")
      vim.cmd("highlight GitSignsAdd guibg=NONE")
      vim.cmd("highlight GitSignsChange guibg=NONE")
      vim.cmd("highlight GitSignsDelete guibg=NONE")
    end
  }
end

return M.kanagawa()
