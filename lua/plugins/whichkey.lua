local M = {}

M.config = {
  plugins = {
    marks = true,   -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = true, -- adds help for operators like d, y, ...
      motions = true,   -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true,   -- default bindings on <c-w>
      nav = true,       -- misc bindings to work with windows
      z = true,         -- bindings for folds, spelling and others prefixed with z
      g = true,         -- bindings for prefixed with g
    },
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and its label
    group = "+", -- symbol prepended to a group
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3,                  -- spacing between columns
  },
  show_help = true,               -- show help message on the command line when the popup is visible
}

M.opts = {
  mode = "n",    -- NORMAL mode
  prefix = "<leader>",
  buffer = nil,  -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = false, -- use `nowait` when creating keymaps
}

M.mappings = {
  { "<leader>/", desc = "Comment", nowait = false, remap = false },
  { "<leader>H", desc = "No Highlight", nowait = false, remap = false },
  { "<leader>S", group = "Session", nowait = false, remap = false },
  { "<leader>Sl", "<cmd>SessionLoad<cr>", desc = "Load Session", nowait = false, remap = false },
  { "<leader>Ss", "<cmd>SessionSave<cr>", desc = "Save Session", nowait = false, remap = false },
  { "<leader>c", desc = "bd", nowait = false, remap = false },
  { "<leader>d", group = "Debug", nowait = false, remap = false },
  { "<leader>db", "<cmd>DebugToggleBreakpoint<cr>", desc = "Toggle Breakpoint", nowait = false, remap = false },
  { "<leader>dc", "<cmd>DebugContinue<cr>", desc = "Continue", nowait = false, remap = false },
  { "<leader>di", "<cmd>DebugStepInto<cr>", desc = "Step Into", nowait = false, remap = false },
  { "<leader>do", "<cmd>DebugStepOver<cr>", desc = "Step Over", nowait = false, remap = false },
  { "<leader>dr", "<cmd>DebugToggleRepl<cr>", desc = "Toggle Repl", nowait = false, remap = false },
  { "<leader>ds", "<cmd>DebugStart<cr>", desc = "Start", nowait = false, remap = false },
  { "<leader>e", desc = "Explorer", nowait = false, remap = false },
  { "<leader>f", desc = "Find File", nowait = false, remap = false },
  { "<leader>g", group = "Git", nowait = false, remap = false },
  { "<leader>gC", "<cmd>Telescope git_bcommits<cr>", desc = "Checkout commit(for current file)", nowait = false, remap = false },
  { "<leader>gR", "<cmd>Gitsigns reset_buffer<cr>", desc = "Reset Buffer", nowait = false, remap = false },
  { "<leader>gb", "<cmd>Telescope git_branches<cr>", desc = "Checkout branch", nowait = false, remap = false },
  { "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "Checkout commit", nowait = false, remap = false },
  { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Multi file diff view", nowait = false, remap = false },
  { "<leader>gg", "<cmd>Neogit<cr>", desc = "Neogit", nowait = false, remap = false },
  { "<leader>gj", "<cmd>Gitsigns next_hunk<cr>", desc = "Next Hunk", nowait = false, remap = false },
  { "<leader>gk", "<cmd>Gitsigns prev_hunk<cr>", desc = "Prev Hunk", nowait = false, remap = false },
  { "<leader>go", "<cmd>Telescope git_status<cr>", desc = "Open changed file", nowait = false, remap = false },
  { "<leader>gp", "<cmd>Gitsigns preview_hunk<cr>", desc = "Preview Hunk", nowait = false, remap = false },
  { "<leader>gr", "<cmd>Gitsigns reset_hunk<cr>", desc = "Reset Hunk", nowait = false, remap = false },
  { "<leader>gs", "<cmd>Gitsigns stage_hunk<cr>", desc = "Stage Hunk", nowait = false, remap = false },
  { "<leader>gu", "<cmd>Gitsigns undo_stage_hunk<cr>", desc = "Undo Stage Hunk", nowait = false, remap = false },
  { "<leader>h", group = "Harpoon", nowait = false, remap = false },
  { "<leader>h1", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", desc = "File 1", nowait = false, remap = false },
  { "<leader>h2", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", desc = "File 2", nowait = false, remap = false },
  { "<leader>h3", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", desc = "File 3", nowait = false, remap = false },
  { "<leader>h4", "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", desc = "File 4", nowait = false, remap = false },
  { "<leader>h5", "<cmd>lua require('harpoon.ui').nav_file(5)<cr>", desc = "File 5", nowait = false, remap = false },
  { "<leader>h6", "<cmd>lua require('harpoon.ui').nav_file(6)<cr>", desc = "File 6", nowait = false, remap = false },
  { "<leader>ha", "<cmd>lua require('harpoon.mark').add_file()<cr>", desc = "Add file", nowait = false, remap = false },
  { "<leader>hm", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = "Quick Menu", nowait = false, remap = false },
  { "<leader>ht", "<cmd>lua require('harpoon.term').gotoTerminal(1)<cr>", desc = "Terminal 1", nowait = false, remap = false },
  { "<leader>hx", "<cmd>lua require('harpoon.mark').rm_file()<cr>", desc = "Remove file mark", nowait = false, remap = false },
  { "<leader>l", group = "LSP", nowait = false, remap = false },
  { "<leader>lA", "<cmd>Lspsaga range_code_action<cr>", desc = "Selected Action", nowait = false, remap = false },
  { "<leader>lD", "<cmd>Telescope lsp_workspace_diagnostics<cr>", desc = "Workspace Diagnostics", nowait = false, remap = false },
  { "<leader>lL", "<cmd>lua vim.diagnostic.open_float()<cr>", desc = "Line Diagnostics", nowait = false, remap = false },
  { "<leader>lN", "<cmd>:lua vim.diagnostic.goto_prev()<cr>", desc = "Go to prev", nowait = false, remap = false },
  { "<leader>lS", "<cmd>Telescope lsp_workspace_symbols<cr>", desc = "Workspace Symbols", nowait = false, remap = false },
  { "<leader>lT", "<cmd>TroubleToggle<cr>", desc = "Toggle trouble", nowait = false, remap = false },
  { "<leader>la", "<cmd>Lspsaga code_action<cr>", desc = "Code Action", nowait = false, remap = false },
  { "<leader>lc", "<cmd>:lua require('copilot.panel').open({'right', 0.4})<CR>", desc = "Open Copilot Panel", nowait = false, remap = false },
  { "<leader>ld", "<cmd>Telescope lsp_document_diagnostics<cr>", desc = "Document Diagnostics", nowait = false, remap = false },
  { "<leader>lf", "<cmd>LspFormatting<cr>", desc = "Format", nowait = false, remap = false },
  { "<leader>li", "<cmd>LspInfo<cr>", desc = "Info", nowait = false, remap = false },
  { "<leader>ll", "<cmd>Lspsaga lsp_finder<cr>", desc = "LSP Finder", nowait = false, remap = false },
  { "<leader>ln", "<cmd>:lua vim.diagnostic.goto_next()<cr>", desc = "Go to next", nowait = false, remap = false },
  { "<leader>lo", "<cmd>:TSToolsOrganizeImports<cr>", desc = "Organize Imports", nowait = false, remap = false },
  { "<leader>lp", "<cmd>Lspsaga preview_definition<cr>", desc = "Preview Definition", nowait = false, remap = false },
  { "<leader>lq", "<cmd>Telescope quickfix<cr>", desc = "Quickfix", nowait = false, remap = false },
  { "<leader>lr", "<cmd>Lspsaga rename<cr>", desc = "Rename", nowait = false, remap = false },
  { "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Document Symbols", nowait = false, remap = false },
  { "<leader>lt", "<cmd>LspTypeDefinition<cr>", desc = "Type Definition", nowait = false, remap = false },
  { "<leader>lx", "<cmd>cclose<cr>", desc = "Close Quickfix", nowait = false, remap = false },
  { "<leader>s", group = "Search", nowait = false, remap = false },
  { "<leader>sD", "<cmd>Telescope lsp_workspace_diagnostics<cr>", desc = "Workspace Diagnostics", nowait = false, remap = false },
  { "<leader>sM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages", nowait = false, remap = false },
  { "<leader>sR", "<cmd>Telescope registers<cr>", desc = "Registers", nowait = false, remap = false },
  { "<leader>sb", "<cmd>Telescope git_branches<cr>", desc = "Checkout branch", nowait = false, remap = false },
  { "<leader>sc", "<cmd>Telescope colorscheme<cr>", desc = "Colorscheme", nowait = false, remap = false },
  { "<leader>sd", "<cmd>Telescope lsp_document_diagnostics<cr>", desc = "Document Diagnostics", nowait = false, remap = false },
  { "<leader>sf", "<cmd>Telescope find_files<cr>", desc = "Find File", nowait = false, remap = false },
  { "<leader>sm", "<cmd>Telescope marks<cr>", desc = "Marks", nowait = false, remap = false },
  { "<leader>sr", "<cmd>Telescope oldfiles<cr>", desc = "Open Recent File", nowait = false, remap = false },
  { "<leader>st", "<cmd>:lua require('telescope.builtin').live_grep({vimgrep_arguments={'rg', '--hidden', '-g', '!.git', '--color=never', '--no-heading', '--with-filename', '--line-number', '--column', '--smart-case' }})<cr>", desc = "Text", nowait = false, remap = false },
  { "<leader>tf", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", desc = "Run tests in file", nowait = false, remap = false },
  { "<leader>tr", "<cmd>lua require('neotest').run.run()<cr>", desc = "Run nearest test", nowait = false, remap = false },
  { "<leader>ts", "<cmd>lua require('neotest').summary.open()<cr>", desc = "Open test summary", nowait = false, remap = false },
  { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen", nowait = false, remap = false },
}

M.setup = function()
  local wk = require("which-key")

  wk.setup(M.config)
  wk.add(M.mappings, M.opts)
end

return M
