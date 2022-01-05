return {
	{ "wbthomason/packer.nvim" }, -- Currently doesn't work https://github.com/wbthomason/packer.nvim/issues/180
	{ "nvim-lua/plenary.nvim" },
	{ "kyazdani42/nvim-web-devicons" },
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
		{
			"folke/lsp-trouble.nvim",
			config = function()
				require("trouble").setup({})
			end,
		},
	},
	{
		"tami5/lspsaga.nvim",
		config = function()
			require("lspsaga").init_lsp_saga()
		end,
	},
	{ "sbdchd/neoformat" },
	{ "drewtempelmeyer/palenight.vim" },
	{ "metakirby5/codi.vim" },

	-- Themes
	{ "folke/tokyonight.nvim" },
	{ "rebelot/kanagawa.nvim" },
	{ "styled-components/vim-styled-components" },

	-- LSP
	"neovim/nvim-lspconfig",
	"williamboman/nvim-lsp-installer", -- simple to use language server installer
	"tamago324/nlsp-settings.nvim", -- language server settings defined in json for
	"jose-elias-alvarez/null-ls.nvim",
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
			require("harpoon").setup({ global_settings = { save_on_toggle = false, save_on_change = true } })
		end,
	}, -- Debugging
	{ "mfussenegger/nvim-dap" }, -- Autocomplete
	{
		"hrsh7th/nvim-cmp",
		config = function()
			require("plugins.nvimcmp").setup()
		end,
		requires = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/nvim-cmp",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
		},
	},
	{ "rafamadriz/friendly-snippets" }, -- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		config = function()
			require("plugins.treesitter").setup()
		end,
	},
	{ "windwp/nvim-ts-autotag" }, -- Explorer
	{
		"kyazdani42/nvim-tree.lua",
		config = function()
			require("plugins.nvimtree").setup()
		end,
	},
	{ "kevinhwang91/rnvimr" }, -- {'lukas-reineke/indent-blankline.nvim', opt=true, branch = 'lua'}
	{
		"lewis6991/gitsigns.nvim",
		event = "BufRead",
		config = function()
			require("plugins.gitsigns").setup()
		end,
	},
	{
		"folke/which-key.nvim",
		config = function()
			require("plugins.whichkey").setup()
		end,
	},
	{ "ChristianChiarulli/dashboard-nvim" },
	{
		"windwp/nvim-autopairs",
		config = function()
			require("plugins.autopairs").setup()
		end,
	},
	{
		"terrortylor/nvim-comment",
		config = function()
			require("nvim_comment").setup()
		end,
	},
	{ "kevinhwang91/nvim-bqf" }, -- Color
	{ "christianchiarulli/nvcode-color-schemes.vim" }, -- Status Line and Bufferline
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			require("plugins.lualine").setup()
		end,
	},
}
