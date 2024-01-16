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

lspconfig.gopls.setup({})

lspconfig.html.setup({})

lspconfig.htmx.setup({})

lspconfig.svelte.setup({})

lspconfig.ocamllsp.setup({
	on_attach = require("lsp/on-attach").on_attach,
})
