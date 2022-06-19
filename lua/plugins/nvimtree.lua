local M = {}

M.config = function(tree_cb)
	return {
		hijack_netrw = false,
		disable_netrw = false,
		open_on_setup = false,
		renderer = {
			highlight_git = true,
			indent_markers = {
				enable = true,
			},
			icons = {
				show = {
					git = true,
					folder = true,
					file = true,
				},
				glyphs = {
					default = "",
					symlink = "",
					git = { unstaged = "", staged = "✓", unmerged = "", renamed = "➜", untracked = "" },
					folder = { default = "", open = "", empty = "", empty_open = "", symlink = "" },
				},
			},
		},
		ignore_ft_on_setup = { " " },
		diagnostics = { enable = true },
		open_on_tab = false,
		update_focused_file = { enable = true },
		hijack_cursor = true,
		git = { enable = true, ignore = true, timeout = 501 },
		filters = { dotfiles = false, custom = {} },
		view = {
			width = 30,
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
