local M = {}

M.setup = function()
	require("nvim-treesitter.configs").setup({
		ensure_installed = "all",
		ignore_install = { "haskell" },
		highlight = {
			enable = true,
		},
	})
end

return M
