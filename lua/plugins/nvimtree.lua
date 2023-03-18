local M = {}

M.config = {
	renderer = {
		highlight_git = true,
		indent_markers = {
			enable = true,
		},
		icons = {
			glyphs = {
				default = "",
				symlink = "",
				git = { unstaged = "", staged = "✓", unmerged = "", renamed = "➜", untracked = "" },
				folder = { default = "", open = "", empty = "", empty_open = "", symlink = "" },
			},
		},
	},
	diagnostics = { enable = true },
	update_focused_file = { enable = true },
	hijack_cursor = true,
	view = {
		width = 40,
	},
}

M.setup = function()
	require("nvim-tree").setup(M.config)
end

return M
