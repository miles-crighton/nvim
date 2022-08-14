local M = {}

M.config = {
	plugins = {
		marks = true, -- shows a list of your marks on ' and `
		registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
		-- the presets plugin, adds help for a bunch of default keybindings in Neovim
		-- No actual key bindings are created
		presets = {
			operators = true, -- adds help for operators like d, y, ...
			motions = true, -- adds help for motions
			text_objects = true, -- help for text objects triggered after entering an operator
			windows = true, -- default bindings on <c-w>
			nav = true, -- misc bindings to work with windows
			z = true, -- bindings for folds, spelling and others prefixed with z
			g = true, -- bindings for prefixed with g
		},
	},
	icons = {
		breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
		separator = "➜", -- symbol used between a key and its label
		group = "+", -- symbol prepended to a group
	},
	window = {
		border = "single", -- none, single, double, shadow
		position = "bottom", -- bottom, top
		margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
		padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
	},
	layout = {
		height = { min = 4, max = 25 }, -- min and max height of the columns
		width = { min = 20, max = 50 }, -- min and max width of the columns
		spacing = 3, -- spacing between columns
	},
	hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
	show_help = true, -- show help message on the command line when the popup is visible
}

M.opts = {
	mode = "n", -- NORMAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = false, -- use `nowait` when creating keymaps
}

M.mappings = {
	["/"] = "Comment",
	["c"] = "bd",
	["e"] = "Explorer",
	["f"] = "Find File",
	["H"] = "No Highlight",
	["z"] = { "<cmd>ZenMode<cr>", "Zen" },
	h = {
		name = "+Harpoon",
		["1"] = { "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", "File 1" },
		["2"] = { "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", "File 2" },
		["3"] = { "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", "File 3" },
		["4"] = { "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", "File 4" },
		["5"] = { "<cmd>lua require('harpoon.ui').nav_file(5)<cr>", "File 5" },
		["6"] = { "<cmd>lua require('harpoon.ui').nav_file(6)<cr>", "File 6" },
		a = { "<cmd>lua require('harpoon.mark').add_file()<cr>", "Add file" },
		x = { "<cmd>lua require('harpoon.mark').rm_file()<cr>", "Remove file mark" },
		t = {
			"<cmd>lua require('harpoon.term').gotoTerminal(1)<cr><cmd>lua require('harpoon.term').sendCommand(1, 'fish')<cr>",
			"Terminal 1",
		},
		m = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", "Quick Menu" },
	},
	d = {
		name = "+Debug",
		b = { "<cmd>DebugToggleBreakpoint<cr>", "Toggle Breakpoint" },
		c = { "<cmd>DebugContinue<cr>", "Continue" },
		i = { "<cmd>DebugStepInto<cr>", "Step Into" },
		o = { "<cmd>DebugStepOver<cr>", "Step Over" },
		r = { "<cmd>DebugToggleRepl<cr>", "Toggle Repl" },
		s = { "<cmd>DebugStart<cr>", "Start" },
	},
	g = {
		name = "+Git",
		g = { "<cmd>Neogit<cr>", "Neogit" },
		j = { "<cmd>Gitsigns next_hunk<cr>", "Next Hunk" },
		k = { "<cmd>Gitsigns prev_hunk<cr>", "Prev Hunk" },
		p = { "<cmd>Gitsigns preview_hunk<cr>", "Preview Hunk" },
		r = { "<cmd>Gitsigns reset_hunk<cr>", "Reset Hunk" },
		R = { "<cmd>Gitsigns reset_buffer<cr>", "Reset Buffer" },
		s = { "<cmd>Gitsigns stage_hunk<cr>", "Stage Hunk" },
		u = { "<cmd>Gitsigns undo_stage_hunk<cr>", "Undo Stage Hunk" },
		o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
		b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
		c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
		C = { "<cmd>Telescope git_bcommits<cr>", "Checkout commit(for current file)" },
		d = { "<cmd>DiffviewOpen<cr>", "Multi file diff view" },
	},
	l = {
		name = "+LSP",
		a = { "<cmd>Lspsaga code_action<cr>", "Code Action" },
		A = { "<cmd>Lspsaga range_code_action<cr>", "Selected Action" },
		d = { "<cmd>Telescope lsp_document_diagnostics<cr>", "Document Diagnostics" },
		D = { "<cmd>Telescope lsp_workspace_diagnostics<cr>", "Workspace Diagnostics" },
		f = { "<cmd>LspFormatting<cr>", "Format" },
		i = { "<cmd>LspInfo<cr>", "Info" },
		l = { "<cmd>Lspsaga lsp_finder<cr>", "LSP Finder" },
		L = { "<cmd>lua vim.diagnostic.open_float()<cr>", "Line Diagnostics" },
		p = { "<cmd>Lspsaga preview_definition<cr>", "Preview Definition" },
		q = { "<cmd>Telescope quickfix<cr>", "Quickfix" },
		r = { "<cmd>Lspsaga rename<cr>", "Rename" },
		t = { "<cmd>LspTypeDefinition<cr>", "Type Definition" },
		x = { "<cmd>cclose<cr>", "Close Quickfix" },
		s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
		S = { "<cmd>Telescope lsp_workspace_symbols<cr>", "Workspace Symbols" },
		n = { "<cmd>:lua vim.diagnostic.goto_next()<cr>", "Go to next" },
		N = { "<cmd>:lua vim.diagnostic.goto_prev()<cr>", "Go to prev" },
		T = { "<cmd>TroubleToggle<cr>", "Toggle trouble" },
	},

	s = {
		name = "+Search",
		b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
		c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
		d = { "<cmd>Telescope lsp_document_diagnostics<cr>", "Document Diagnostics" },
		D = { "<cmd>Telescope lsp_workspace_diagnostics<cr>", "Workspace Diagnostics" },
		f = { "<cmd>Telescope find_files<cr>", "Find File" },
		m = { "<cmd>Telescope marks<cr>", "Marks" },
		M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
		r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
		R = { "<cmd>Telescope registers<cr>", "Registers" },
		t = {
			"<cmd>:lua require('telescope.builtin').live_grep({vimgrep_arguments={'rg', '--hidden', '-g', '!.git', '--color=never', '--no-heading', '--with-filename', '--line-number', '--column', '--smart-case' }})<cr>",
			"Text",
		},
	},

	S = {
		name = "+Session",
		s = { "<cmd>SessionSave<cr>", "Save Session" },
		l = { "<cmd>SessionLoad<cr>", "Load Session" },
	},

	t = {
		r = { "<cmd>lua require('neotest').run.run()<cr>", "Run nearest test" },
		f = { "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", "Run tests in file" },
		s = { "<cmd>lua require('neotest').summary.open()<cr>", "Open test summary" },
	},
}

M.setup = function()
	local wk = require("which-key")

	wk.setup(M.config)
	wk.register(M.mappings, M.opts)
end

return M
