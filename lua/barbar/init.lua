vim.api.nvim_set_keymap('n', '<TAB>', ':BufferLineCycleNext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-TAB>', ':BufferLineCyclePrev<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-x>', ':BufferLineClose<CR>', { noremap = true, silent = true })

require'bufferline'.setup{
  options = {
    diagnostics = "nvim_lsp",
    diagnostics_indicator = function(count, level, diagnostics_dict)
      local icon = level:match("error") and "" or ""
      return " " .. icon
    end,
    offsets = {{filetype = "NvimTree", text = "File Explorer", highlight = "Directory", text_align = "center"}}
  }
}
