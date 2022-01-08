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
		sources = {
			require("lsp.null-ls.eslint-source").setup(),
			formatting.prettierd, --{ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }
			formatting.black.with({ extra_args = { "--fast" } }),
			formatting.stylua,
			diagnostics.shellcheck,
		},
		-- does not work with tsx, needs BufWritePost
		on_attach = function(client)
			if client.resolved_capabilities.document_formatting then
				vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
			end
		end,
	})
end

return M
