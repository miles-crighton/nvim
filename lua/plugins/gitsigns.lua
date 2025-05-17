local M = {
  "lewis6991/gitsigns.nvim"
}

M.opts = {
  signs = {
    add = { text = "▎" },
    change = { text = "▎" },
    delete = { text = "契" },
    topdelete = { text = "契" },
    changedelete = { text = "▎" },
  },
}

function M.init()
  -- load gitsigns only when a git file is opened -- from https://github.com/NvChad/NvChad/blob/v2.0/lua/plugins/init.lua#L95
  vim.api.nvim_create_autocmd({ "BufRead" }, {
    group = vim.api.nvim_create_augroup("GitSignsLazyLoad", { clear = true }),
    callback = function()
      vim.fn.system("git -C " .. vim.fn.expand("%:p:h") .. " rev-parse")
      if vim.v.shell_error == 0 then
        vim.api.nvim_del_augroup_by_name("GitSignsLazyLoad")
        vim.schedule(function()
          require("lazy").load({ plugins = { "gitsigns.nvim" } })
        end)
      end
    end,
  })
end

return M
