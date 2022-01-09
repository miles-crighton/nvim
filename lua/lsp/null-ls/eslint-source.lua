local M = {}

M.setup = function()
	local null_ls_status_ok, null_ls = pcall(require, "null-ls")
	if not null_ls_status_ok then
		return
	end

	local h = require("null-ls.helpers")

	local handle_eslint_output = function(params)
		params.messages = params.output and params.output[1] and params.output[1].messages or {}
		if params.err then
			table.insert(params.messages, { message = params.err })
		end
		for _, value in ipairs(params.messages) do
			if type(value.ruleId) == "string" then
				value.message = value.message .. " [" .. value.ruleId .. "]"
			end
		end

		local parser = h.diagnostics.from_json({
			attributes = {
				severity = "severity",
			},
			severities = {
				h.diagnostics.severities["warning"],
				h.diagnostics.severities["error"],
			},
		})

		return parser({ output = params.messages })
	end

	local generator_opts = {
		command = "eslint_d",
		args = { "-f", "json", "--stdin", "--stdin-filename", "$FILENAME" },
		to_stdin = true,
		format = "json_raw",
		check_exit_code = function(code)
			return code <= 1
		end,
		on_output = handle_eslint_output,
	}

	local eslint_source = {
		name = "eslint-custom",
		method = null_ls.methods.DIAGNOSTICS,
		filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" },
	}

	setmetatable(eslint_source, {
		__index = function(tab, key)
			return key == "generator" and h.generator_factory(generator_opts) or rawget(tab, key)
		end,
	})

	return eslint_source
end

return M
