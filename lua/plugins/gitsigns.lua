local M = {}

M.config = {
	signs = {
		add = { text = "▎" },
		change = { text = "▎" },
		delete = { text = "契" },
		topdelete = { text = "契" },
		changedelete = { text = "▎" },
	},
}

M.setup = function()
	require("gitsigns").setup(M.config)
end

return M
