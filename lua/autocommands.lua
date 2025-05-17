local function define_augroups(definitions)
  for group_name, definition in pairs(definitions) do
    vim.api.nvim_create_augroup(group_name, { clear = true })
    for _, def in pairs(definition) do
      vim.api.nvim_create_autocmd(def[1], { group = group_name, pattern = def[2], command = def[3] })
    end
  end
end

define_augroups({
  _general_settings = {
    { "TextYankPost", "*", "lua vim.highlight.on_yank({higroup = 'Search', timeout = 200})" },
    { "VimLeavePre",  "*", "set title set titleold=" },
    { "CursorHold",   "*", "lua vim.diagnostic.open_float()" },
    { "BufWritePre",  "*", "lua vim.lsp.buf.format()" },
  },
  _markdown = { { "FileType", "markdown", "setlocal wrap" }, { "FileType", "markdown", "setlocal spell" } },
  _buffer_bindings = {
    { "FileType", "lspinfo",  "nnoremap <silent> <buffer> q :q<CR>" },
    { "FileType", "floaterm", "nnoremap <silent> <buffer> q :q<CR>" },
  },
})
