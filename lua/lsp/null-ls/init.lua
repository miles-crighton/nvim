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
			diagnostics.eslint_d.with({
				extra_filetypes = { "svelte" },
				-- Use command to properly load the eslint config
				command = "./node_modules/.bin/eslint",
			}),
			-- Possibly use this if eslint_d does not now work for other filetypes (other than .svelte)
			-- diagnostics.eslint.with({
			-- 	filetypes = { "svelte" },
			-- 	command = "./node_modules/.bin/eslint",
			-- }),
			formatting.prettierd.with({
				extra_filetypes = { "svelte" },
			}),
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
