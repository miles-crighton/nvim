local M = {}
M.methods = {}

M.setup = function()
	vim.g.coq_settings = {
		auto_start = "shut-up",
		keymap = {
			jump_to_mark = "",
		},
	}
	require("coq")
end

return M
