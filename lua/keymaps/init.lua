local key_maps = {
	leader = "space",
	keys = {
		insert_mode = {
			["jk"] = "<ESC>",

			-- Navigate quickfix list
			["<A-j>"] = "<cmd>cnext<CR>",
			["<A-k>"] = "<cmd>cprev<CR>",
		},

		normal_mode = {
			-- Search and replace word under cursor
			["<Leader>rr"] = { ":%s/<C-R><C-W>//g<Left><Left>", { noremap = true, silent = true } },

			["<Space>"] = "<NOP>",

			-- Better window movement
			["<C-h>"] = "<C-w>h",
			["<C-j>"] = "<C-w>j",
			["<C-k>"] = "<C-w>k",
			["<C-l>"] = "<C-w>l",

			-- Make Y work like D
			["Y"] = "y$",

			-- Jumplist Mutations
			["k"] = { '(v:count > 5 ? "m\'" . v:count : "") . \'k\'', { noremap = true, silent = true, expr = true } },
			["j"] = { '(v:count > 5 ? "m\'" . v:count : "") . \'j\'', { noremap = true, silent = true, expr = true } },

			-- Resize with arrows
			-- Doesn't work with mac bindings
			["<C-Up>"] = ":resize -2<CR>",
			["<C-Down>"] = ":resize +2<CR>",
			["<C-Left>"] = ":vertical resize -2<CR>",
			["<C-Right>"] = ":vertical resize +2<CR>",

			-- Stable center for next/prev
			["n"] = { "nzzzv", { noremap = true, silent = true } },
			["N"] = { "Nzzzv", { noremap = true, silent = true } },
			["J"] = { "mzJ`z", { noremap = true, silent = true } },

			-- QuickFix
			["]q"] = ":cnext<CR>",
			["[q"] = ":cprev<CR>",
			["<C-q>"] = ":call QuickFixToggle()<CR>",

			-- Re-source config
			["<Leader>ss"] = { ":luafile $MYVIMRC<CR>", { noremap = true } },

			-- Telescope
			["<Leader>f"] = ":lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})<CR>",

			-- Tree
			["<Leader>E"] = ":NvimTreeToggle<CR>",
			["<Leader>e"] = ":lua require('oil').open()<CR>",

			-- Buffers
			["<Leader>c"] = ":BufferClose<CR>",

			-- Highlights
			["<Leader>h"] = ":set hlsearch!<CR>",

			["<Leader><C-r>"] = ":OpenInGHRepo<CR>",
			["<Leader>gf"] = ":OpenInGHFile<CR>",
		},
		term_mode = {
			-- Terminal window navigation
			["<C-h>"] = "<C-\\><C-N><C-w>h",
			["<C-j>"] = "<C-\\><C-N><C-w>j",
			["<C-k>"] = "<C-\\><C-N><C-w>k",
			["<C-l>"] = "<C-\\><C-N><C-w>l",

			-- Exit terminal input
			["<Esc>"] = "<C-\\><C-n>",
		},

		visual_mode = {
			-- Better indenting
			["<"] = "<gv",
			[">"] = ">gv",

			-- Comments
			["<leader>/"] = ":CommentToggle<CR>",

			-- Go to file in repo
			["<Leader>gf"] = ":OpenInGHFileLines<CR>",
		},

		visual_block_mode = {
			-- Move selected line / block of text in visual mode
			["K"] = ":move '<-2<CR>gv-gv",
			["J"] = ":move '>+1<CR>gv-gv",
		},

		command_mode = {
			-- navigate tab completion with <c-j> and <c-k>, runs conditionally
			["<C-j>"] = { 'pumvisible() ? "\\<C-n>" : "\\<C-j>"', { expr = true, noremap = true } },
			["<C-k>"] = { 'pumvisible() ? "\\<C-p>" : "\\<C-k>"', { expr = true, noremap = true } },
		},
	},
}

return {
	setup = function()
		vim.g.mapleader = (key_maps.leader == "space" and " ")
		require("keymaps.loader").load(key_maps.keys)
	end,
}
