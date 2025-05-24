local cmd = vim.api.nvim_create_autocmd
local custom_commands = vim.api.nvim_create_augroup('custom-commands', { clear = true })

cmd('TextYankPost', {
  desc = 'Highlight text when yanking in normal mode',
  group = custom_commands,
  callback = function()
    vim.hl.on_yank {
      timeout = 60,
      on_visual = false,
      higroup = 'Search',
    }
  end,
})

cmd("CursorHold", {
  desc = "Open diagnostics on cursor hold",
  group = custom_commands,
  callback = function()
    vim.diagnostic.open_float()
  end
})

cmd("BufWritePre", {
  desc = "Format buffer on write",
  group = custom_commands,
  callback = function()
    vim.lsp.buf.format()
  end
})
