local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return
end

local function organize_imports()
	local params = { command = "_typescript.organizeImports", arguments = { vim.api.nvim_buf_get_name(0) }, title = "" }
	vim.lsp.buf.execute_command(params)
end

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
	local opts = {
		on_attach = require("lsp.handlers").on_attach,
		capabilities = require("lsp.handlers").capabilities,
	}

	if server.name == "tsserver" then
		local tsserver_opts = {
			commands = { OrganizeImports = { organize_imports, description = "Organize Imports" } },
			cmd = {
				"typescript-language-server",
				"--stdio",
				-- This loads typescript@next from npm i -g installation
				"--tsserver-path=/usr/local/lib/node_modules/typescript",
			},
		}
		opts = vim.tbl_deep_extend("force", tsserver_opts, opts)
	end

	if server.name == "jsonls" then
		local jsonls_opts = require("lsp.settings.jsonls")
		opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
	end

	if server.name == "sumneko_lua" then
		local sumneko_opts = require("lsp.settings.sumneko_lua")
		opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
	end

	if server.name == "tailwindcss" then
		local tailwindcss_opts = {
			settings = {
				tailwindCSS = {
					experimental = {
						classRegex = { -- for haml :D
							"tw`([^`]*)", -- tw`...`
							'tw="([^"]*)', -- <div tw="..." />
							'tw={"([^"}]*)', -- <div tw={"..."} />
							"tw\\.\\w+`([^`]*)", -- tw.xxx`...`
							"tw\\(.*?\\)`([^`]*)", -- tw(Component)`...`
						},
					},
				},
			},
		}
		opts = vim.tbl_deep_extend("force", tailwindcss_opts, opts)
	end

	-- This setup() function is exactly the same as lspconfig's setup function.
	-- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
	server:setup(opts)
end)
