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
    }, {"sbdchd/neoformat"}, {"drewtempelmeyer/palenight.vim"}, {'metakirby5/codi.vim', "folke/tokyonight.nvim"},
    {"styled-components/vim-styled-components"},

    -- TODO refactor all of this (for now it works, but yes I know it could be wrapped in a simpler function)
    {"neovim/nvim-lspconfig"}, {"rinx/lspsaga.nvim"}, {
        "kabouzeid/nvim-lspinstall",
        config = function()
            require("lspinstall").setup {}
        end
    }, {"nvim-lua/popup.nvim"}, {
        "nvim-telescope/telescope.nvim",
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
    {"hrsh7th/nvim-compe"}, {"rafamadriz/friendly-snippets"}, -- Treesitter
    {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}, {"windwp/nvim-ts-autotag"}, -- Explorer
    {"kyazdani42/nvim-tree.lua"}, -- TODO remove when open on dir is supported by nvimtree
    {"kevinhwang91/rnvimr"}, -- {'lukas-reineke/indent-blankline.nvim', opt=true, branch = 'lua'}
    {
        "lewis6991/gitsigns.nvim",
        event = "BufRead",
        config = function()
            require("plugins.gitsigns").setup()
        end
    }, {"folke/which-key.nvim"}, {"ChristianChiarulli/dashboard-nvim"}, {"windwp/nvim-autopairs"}, {
        "terrortylor/nvim-comment",
        config = function()
            require('nvim_comment').setup()
        end
    }, {"kevinhwang91/nvim-bqf"}, -- Color
    {"christianchiarulli/nvcode-color-schemes.vim"}, -- Status Line and Bufferline
    {"glepnir/galaxyline.nvim"}
}
