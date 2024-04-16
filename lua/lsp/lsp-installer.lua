local lspconfig = require("lspconfig")

lspconfig.tailwindcss.setup({
	settings = {
		tailwindCSS = {
			classAttributes = {
				"class",
				"className",
				".*Classes",
			},
			experimental = {
				classRegex = { -- for haml :D
					"tw`([^`]*)", -- tw`...`
					'tw="([^"]*)', -- <div tw="..." />
					'tw={"([^"}]*)', -- <div tw={"..."} />
					"tw\\.\\w+`([^`]*)", -- tw.xxx`...`
					"tw\\(.*?\\)`([^`]*)", -- tw(Component)`...`
					{ "Classes \\=([^;]*);", "'([^']*)'" },
					{ "Classes \\=([^;]*);", '"([^"]*)"' },
					{ "Classes \\=([^;]*);", "\\`([^\\`]*)\\`" },
					{ "cva\\(([^)]*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]" },
				},
			},
		},
	},
})

lspconfig.terraformls.setup({
	filetypes = { "terraform", "tf" },
})

lspconfig.gopls.setup({ on_attach = require("lsp/on-attach").on_attach })

lspconfig.html.setup({ on_attach = require("lsp/on-attach").on_attach })

lspconfig.htmx.setup({ on_attach = require("lsp/on-attach").on_attach })

lspconfig.svelte.setup({
	on_attach = function(client, bufnr)
		-- Changes in TS files is not picked up in .svelte files,
		-- so we need to manually notify the server
		-- See: https://github.com/neovim/nvim-lspconfig/issues/725#issuecomment-1837509673
		vim.api.nvim_create_autocmd("BufWritePost", {
			pattern = { "*.js", "*.ts" },
			callback = function(ctx)
				client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
			end,
		})
		require("lsp/on-attach").on_attach(client, bufnr)
	end,
})

lspconfig.ocamllsp.setup({
	on_attach = require("lsp/on-attach").on_attach,
})
