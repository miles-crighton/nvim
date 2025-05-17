local M = {
  'neovim/nvim-lspconfig',
}

function M.config()
  vim.lsp.config("tailwindcss", {
    settings = {
      tailwindCSS = {
        classAttributes = {
          "class",
          "className",
          ".*Classes",
        },
        experimental = {
          classRegex = {           -- for haml :D
            "tw`([^`]*)",          -- tw`...`
            'tw="([^"]*)',         -- <div tw="..." />
            'tw={"([^"}]*)',       -- <div tw={"..."} />
            "tw\\.\\w+`([^`]*)",   -- tw.xxx`...`
            "tw\\(.*?\\)`([^`]*)", -- tw(Component)`...`
            { "Classes \\=([^;]*);", "'([^']*)'" },
            { "Classes \\=([^;]*);", '"([^"]*)"' },
            { "Classes \\=([^;]*);", "\\`([^\\`]*)\\`" },
            { "cva\\(([^)]*)\\)",    "[\"'`]([^\"'`]*).*?[\"'`]" },
          },
        },
      },
    },
  })

  vim.lsp.config("lua_ls", {
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" },
        },
      },
    },
  })

  vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(event)
      local client = vim.lsp.get_client_by_id(event.data.client_id)

      -- This prevents highlighting from the LSP servers
      client.server_capabilities.semanticTokensProvider = nil

      -- This prevents formatting from the LSP servers
      if vim.tbl_contains({
            "tsserver",
            "svelte",
            "typescript-tools",
          }, client.name) then
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
      end

      local opts = { noremap = true, silent = true }
      vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
      vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
      vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
      vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
      vim.keymap.set("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
      vim.keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
      vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
      vim.keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
      vim.keymap.set("n", "[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
      vim.keymap.set(
        "n",
        "gl",
        '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics({ border = "rounded" })<CR>',
        opts
      )
      vim.keymap.set("n", "]d", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)
      vim.keymap.set("n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)

      vim.diagnostic.config {
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN] = '',
            [vim.diagnostic.severity.INFO] = '',
            [vim.diagnostic.severity.HINT] = '',
          }
        },
        update_in_insert = true,
        underline = { severity = vim.diagnostic.severity.ERROR },
        severity_sort = true,
        float = { border = 'rounded', source = 'if_many' },
        neotest = true,
        virtual_text = true,
      }
    end
  })

  vim.lsp.enable {
    "gopls",
    "terraformls",
    "html",
    "biome",
    "ocamllsp",
    "lua_ls",
    "typescript-tools",
    "svelte",
  }
end

return M
