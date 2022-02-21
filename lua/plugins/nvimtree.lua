local M = {}

M.config = function(tree_cb)
	return {
		hijack_netrw = false,
		disable_netrw = false,
		open_on_setup = false,
		auto_close = false,
		nvim_tree_hide_dotfiles = false,
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
	-- Legacy global settings, slowly being migrated by maintainers
	vim.g.nvim_tree_show_icons = { git = 1, folders = 1, files = 1 }
	vim.g.nvim_tree_git_hl = 1 -- 0 by default, will enable file highlight for git attributes (can be used without the icons).
	vim.g.nvim_tree_indent_markers = 1 -- "0 by default, this option shows indent markers when folders are open
	vim.g.nvim_tree_auto_ignore_ft = "startify" -- empty by default, don't auto open tree on specific filetypes.
	vim.g.nvim_tree_icons = {
		default = "",
		symlink = "",
		git = { unstaged = "", staged = "✓", unmerged = "", renamed = "➜", untracked = "" },
		folder = { default = "", open = "", empty = "", empty_open = "", symlink = "" },
	}

	local tree_cb = require("nvim-tree.config").nvim_tree_callback
	require("nvim-tree").setup(M.config(tree_cb))
end

return M
