local M = {}

M.config = function(tree_cb)
	return {
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
			mappings = {
				list = {
					{ key = { "l", "<CR>", "o" }, cb = tree_cb("edit") },
					{ key = "h", cb = tree_cb("close_node") },
					{ key = "v", cb = tree_cb("vsplit") },
				},
			},
		},
	}
end

M.setup = function()
	local tree_cb = require("nvim-tree.config").nvim_tree_callback
	require("nvim-tree").setup(M.config(tree_cb))
end

return M
