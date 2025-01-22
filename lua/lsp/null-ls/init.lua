local M = {}

local function eslint_config_exists()
  local eslintrc = vim.fn.glob(".eslintrc*", 0, 1)

  if not vim.tbl_isempty(eslintrc) then
    return true
  end

  -- if vim.fn.filereadable("package.json") then
  -- 	if vim.fn.json_decode(vim.fn.readfile("package.json"))["eslintConfig"] then
  -- 		return true
  -- 	end
  -- end

  return false
end

M.setup = function()
  local null_ls_status_ok, null_ls = pcall(require, "null-ls")
  if not null_ls_status_ok then
    return
  end

  -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
  local formatting = null_ls.builtins.formatting
  -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
  local diagnostics = null_ls.builtins.diagnostics

  null_ls.setup({
    debug = true,
    diagnostics_format = "#{m} [#{c}]",
    sources = {
      diagnostics.eslint_d.with({
        condition = function(utils)
          return eslint_config_exists()
        end,
      }),
      diagnostics.eslint.with({
        filetypes = { "svelte" },
        -- Load the local eslint config
        command = "./node_modules/.bin/eslint",
      }),
      formatting.prettierd.with({
        extra_filetypes = { "svelte" },
      }),
      formatting.black.with({ extra_args = { "--fast" } }),
      formatting.stylua,
      formatting.gofumpt,
      formatting.ocamlformat,
      diagnostics.shellcheck,
      diagnostics.revive,
    },
  })
end

return M
