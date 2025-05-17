local M = { "nvim-treesitter/nvim-treesitter" }

M.build = ':TSUpdate'

M.main = 'nvim-treesitter.configs'

M.opts = {
  -- Keep alphabetical order when managing this list
  ensure_installed = {
    'bash',
    'c',
    'css',
    'diff',
    'dockerfile',
    'go',
    'html',
    'javascript',
    'json',
    'lua',
    'luadoc',
    'make',
    'markdown',
    'markdown_inline',
    'nginx',
    'php',
    'python',
    'query',
    'regex',
    'scss',
    'svelte',
    'sql',
    'toml',
    'typescript',
    'vim',
    'vimdoc',
    'xml',
    'yaml',
  },

  auto_install = true,

  -- Enable highlighting
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },

  -- Enable indentation
  indent = {
    enable = true,
  },
}

return M
