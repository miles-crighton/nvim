local M = {}

vim.opt.completeopt = "menuone,noselect"

M.config = function()
	local cmp = require("cmp")
	return {
		-- formatting = {
		-- 	format = function(_, vim_item)
		-- 		local icons = require("nvchad_ui.icons").lspkind
		-- 		vim_item.kind = string.format("%s %s", icons[vim_item.kind], vim_item.kind)
		-- 		return vim_item
		-- 	end,
		-- },
		mapping = {
			["<C-y>"] = cmp.mapping.confirm({ select = false }),
			["<C-e>"] = cmp.mapping.abort(),
			["<Up>"] = cmp.mapping.select_prev_item({ behavior = "select" }),
			["<Down>"] = cmp.mapping.select_next_item({ behavior = "select" }),
			["<C-p>"] = cmp.mapping(function()
				if cmp.visible() then
					cmp.select_prev_item({ behavior = "insert" })
				else
					cmp.complete()
				end
			end),
			["<C-n>"] = cmp.mapping(function()
				if cmp.visible() then
					cmp.select_next_item({ behavior = "insert" })
				else
					cmp.complete()
				end
			end),
		},
		sources = {
			{ name = "luasnip" },
			{ name = "nvim_lsp" },
			{ name = "buffer" },
			{ name = "nvim_lua" },
			{ name = "path" },
		},
	}
end

M.setup = function()
	require("cmp").setup(M.config())
end

return M
