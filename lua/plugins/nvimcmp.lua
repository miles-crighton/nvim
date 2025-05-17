local M = { "hrsh7th/nvim-cmp" }

M.dependencies = {
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-cmdline",
}


function M.config()
  local cmp = require("cmp")
  vim.opt.completeopt = "menuone,noselect"
  return {
    -- formatting = {
    -- 	format = function(_, vim_item)
    -- 		local icons = require("nvchad_ui.icons").lspkind
    -- 		vim_item.kind = string.format("%s %s", icons[vim_item.kind], vim_item.kind)
    -- 		return vim_item
    -- 	end,
    -- },
    mapping = {
      ["<C-y>"] = cmp.mapping.confirm({ select = false }),
      ["<C-e>"] = cmp.mapping.abort(),
      ["<Up>"] = cmp.mapping.select_prev_item({ behavior = "select" }),
      ["<Down>"] = cmp.mapping.select_next_item({ behavior = "select" }),
      ["<C-p>"] = cmp.mapping(function()
        if cmp.visible() then
          cmp.select_prev_item({ behavior = "insert" })
        else
          cmp.complete()
        end
      end),
      ["<C-n>"] = cmp.mapping(function()
        if cmp.visible() then
          cmp.select_next_item({ behavior = "insert" })
        else
          cmp.complete()
        end
      end),
    },
    sources = {
      { name = "luasnip" },
      { name = "nvim_lsp" },
      { name = "buffer" },
      { name = "nvim_lua" },
      { name = "path" },
    },
  }
end

return M
