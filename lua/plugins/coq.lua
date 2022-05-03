local M = {}
M.methods = {}

M.setup = function()
	vim.g.coq_settings = {
		auto_start = "shut-up",
	}
	require("coq")
end

return M
