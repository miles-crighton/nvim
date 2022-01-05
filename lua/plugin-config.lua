return {
    {"wbthomason/packer.nvim"}, -- Currently doesn't work https://github.com/wbthomason/packer.nvim/issues/180
    {"nvim-lua/plenary.nvim"}, {"kyazdani42/nvim-web-devicons"}, {"tpope/vim-fugitive"}, {"APZelos/blamer.nvim"}, {
        'sindrets/diffview.nvim',
        config = function()
            require("plugins.diffview").setup()
        end
    }, {"TimUntersberger/neogit"}, {
        "kdheepak/lazygit.nvim", {
            "folke/lsp-trouble.nvim",
            config = function()
                require("trouble").setup {}
            end
        }
    }, {"sbdchd/neoformat"}, {"drewtempelmeyer/palenight.vim"}, {'metakirby5/codi.vim'}, {"folke/tokyonight.nvim"},
    {"rebelot/kanagawa.nvim"}, {"styled-components/vim-styled-components"},

    -- TODO refactor all of this (for now it works, but yes I know it could be wrapped in a simpler function)
    -- LSP
    "neovim/nvim-lspconfig", -- enable LSP
    "williamboman/nvim-lsp-installer", -- simple to use language server installer
    "tamago324/nlsp-settings.nvim", -- language server settings defined in json for
    "jose-elias-alvarez/null-ls.nvim", { -- for formatters and linters, {"nvim-lua/popup.nvim"}, {
        "nvim-telescope/telescope.nvim",
        commit = "991d0127f0abc6db9d8efd3a49e53a6867de5559",
        config = function()
            require("plugins.telescope").setup()
        end
    }, {"nvim-telescope/telescope-fzy-native.nvim"}, -- Harpoon
    {
        "ThePrimeagen/harpoon",
        config = function()
            require("harpoon").setup({global_settings = {save_on_toggle = false, save_on_change = true}})
        end
    }, -- Debugging
    {"mfussenegger/nvim-dap"}, -- Autocomplete
    {
        "hrsh7th/nvim-cmp",
        config = function()
            require("plugins.cmp").setup()
        end
    }, {"rafamadriz/friendly-snippets"}, -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        config = function()
            require("plugins.treesitter").setup()
        end
    }, {"windwp/nvim-ts-autotag"}, -- Explorer
    {
        "kyazdani42/nvim-tree.lua",
        config = function()
            require("plugins.nvimtree").setup()
        end
    }, {"kevinhwang91/rnvimr"}, -- {'lukas-reineke/indent-blankline.nvim', opt=true, branch = 'lua'}
    {
        "lewis6991/gitsigns.nvim",
        event = "BufRead",
        config = function()
            require("plugins.gitsigns").setup()
        end
    }, {
        "folke/which-key.nvim",
        config = function()
            require("plugins.whichkey").setup()
        end
    }, {"ChristianChiarulli/dashboard-nvim"}, {
        "windwp/nvim-autopairs",
        config = function()
            require("plugins.autopairs").setup()
        end
    }, {
        "terrortylor/nvim-comment",
        config = function()
            require('nvim_comment').setup()
        end
    }, {"kevinhwang91/nvim-bqf"}, -- Color
    {"christianchiarulli/nvcode-color-schemes.vim"}, -- Status Line and Bufferline
    {
        'nvim-lualine/lualine.nvim',
        config = function()
            require("plugins.lualine").setup()
        end
    }
}
