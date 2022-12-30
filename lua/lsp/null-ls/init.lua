local M = {}

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
			diagnostics.eslint_d,
			diagnostics.eslint.with({
				filetypes = { "svelte" },
				-- Load the local eslint config
				command = "./node_modules/.bin/eslint",
			}),
			formatting.prettier_d_slim.with({
				extra_filetypes = { "svelte" },
			}),
			-- formatting.prettier,
			formatting.black.with({ extra_args = { "--fast" } }),
			formatting.stylua,
			-- formatting.gofumpt,
			diagnostics.shellcheck,
			diagnostics.revive,
		},
		-- does not work with tsx, needs BufWritePost
		on_attach = function(client)
			if client.server_capabilities.document_formatting then
				vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
			end
		end,
	})
end

return M
