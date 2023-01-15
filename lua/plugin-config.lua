return {
	-- Misc
	{ "wbthomason/packer.nvim" },
	{ "nvim-lua/plenary.nvim" },
	{ "kyazdani42/nvim-web-devicons" },
	{ "NvChad/ui" },
	{
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			vim.cmd("hi IndentBlanklineIndent1 guifg=#363647 gui=NONE")
			require("indent_blankline").setup({
				char_highlight_list = {
					"IndentBlanklineIndent1",
				},
			})
		end,
	},
	{
		"NvChad/nvterm",
		config = function()
			require("plugins.nvterm").setup()
		end,
	},
	-- { "metakirby5/codi.vim" },
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup(nil, {
				RGB = true, -- #RGB hex codes
				RRGGBB = true, -- #RRGGBB hex codes
				names = false, -- "Name" codes like Blue
				RRGGBBAA = true, -- #RRGGBBAA hex codes
				rgb_fn = true, -- CSS rgb() and rgba() functions
				hsl_fn = true, -- CSS hsl() and hsla() functions
				css = false, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
				css_fn = false, -- Enable all CSS *functions*: rgb_fn, hsl_fn
				-- Available modes: foreground, background
				mode = "background", -- Set the display mode.
			})
		end,
	},
	{ "antoinemadec/FixCursorHold.nvim" },
	{
		"folke/zen-mode.nvim",
		config = function()
			require("zen-mode").setup({})
		end,
	},

	-- Git
	{
		"lewis6991/gitsigns.nvim",
		event = "BufRead",
		config = function()
			require("plugins.gitsigns").setup()
		end,
	},
	{ "tpope/vim-fugitive" },
	{ "APZelos/blamer.nvim" },
	{
		"sindrets/diffview.nvim",
		config = function()
			require("plugins.diffview").setup()
		end,
	},
	{ "TimUntersberger/neogit" },
	{
		"kdheepak/lazygit.nvim",
	},

	-- Themes
	{ "folke/tokyonight.nvim" },
	{ "drewtempelmeyer/palenight.vim" },
	{
		"rebelot/kanagawa.nvim",
		config = function()
			require("kanagawa").setup({})
		end,
	},
	{ "styled-components/vim-styled-components" },

	-- LSP
	"neovim/nvim-lspconfig",
	"williamboman/nvim-lsp-installer",
	{
		"j-hui/fidget.nvim",
		config = function()
			require("fidget").setup({})
		end,
	},
	-- Mason is not really ready yet,
	-- {
	-- 	"williamboman/mason.nvim",
	-- 	config = function()
	-- 		require("mason").setup()
	-- 	end,
	-- },
	"jose-elias-alvarez/null-ls.nvim",
	-- {
	-- 	"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
	-- 	config = function()
	-- 		require("lsp_lines").setup()
	-- 	end,
	-- },
	{
		"simrat39/rust-tools.nvim",
		config = function()
			require("rust-tools").setup()
		end,
	},

	-- LSP utils
	{
		"folke/trouble.nvim",
		config = function()
			require("trouble").setup({})
		end,
	},
	{
		"glepnir/lspsaga.nvim",
		config = function()
			require("lspsaga").init_lsp_saga({
				code_action_lightbulb = {
					enable = false,
				},
			})
		end,
	},

	-- Navigation
	{
		"nvim-telescope/telescope.nvim",
		commit = "991d0127f0abc6db9d8efd3a49e53a6867de5559",
		config = function()
			require("plugins.telescope").setup()
		end,
	},
	{ "nvim-telescope/telescope-fzy-native.nvim" }, -- Harpoon
	{
		"ThePrimeagen/harpoon",
		config = function()
			require("harpoon").setup({
				global_settings = { save_on_toggle = false, save_on_change = true, enter_on_sendcmd = true },
			})
		end,
	},

	-- Debugging
	{ "mfussenegger/nvim-dap" },

	-- Autocomplete & Snippits
	{
		"hrsh7th/nvim-cmp",
		config = function()
			require("plugins.nvimcmp").setup()
		end,
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/nvim-cmp",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
		},
	},
	-- Unfortunately coq struggles with long LSP timeouts from TSServer
	-- {
	-- 	"ms-jpq/coq_nvim",
	-- 	branch = "coq",
	-- 	requires = {
	-- 		{ "ms-jpq/coq.artifacts", branch = "artifacts" },
	-- 		{ "ms-jpq/coq.thirdparty", branch = "3p" },
	-- 	},
	-- },
	{ "rafamadriz/friendly-snippets" },
	{
		"windwp/nvim-autopairs",
		config = function()
			require("plugins.autopairs").setup()
		end,
	},
	{
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	},

	-- Code utils
	{
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		config = function()
			require("plugins.treesitter").setup()
		end,
	},
	{ "nvim-treesitter/playground" },
	{
		"nvim-treesitter/nvim-treesitter-context",
		config = function()
			require("treesitter-context").setup()
		end,
	},
	{
		"numToStr/Comment.nvim",
		config = function()
			require("plugins.comment").setup()
		end,
		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
	},

	-- UI
	{ "kevinhwang91/nvim-bqf" },
	{
		"kyazdani42/nvim-tree.lua",
		config = function()
			require("plugins.nvimtree").setup()
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			require("plugins.lualine").setup()
		end,
	},
	{
		"folke/which-key.nvim",
		config = function()
			require("plugins.whichkey").setup()
		end,
	},

	-- Test and Debugging
	{
		"nvim-neotest/neotest",
		dependencies = {
			"haydenmeade/neotest-jest",
			"nvim-neotest/neotest-go",
			"nvim-neotest/neotest-plenary",
		},
		config = function()
			require("neotest").setup({
				adapters = {
					require("neotest-jest"),
					require("neotest-go"),
					require("neotest-plenary"),
				},
			})
		end,
	},
}
