vim.cmd "autocmd BufWritePost plugin-config.lua PackerCompile" -- Auto compile when there are changes in plugins.lua

return {
    {"wbthomason/packer.nvim"}, -- Currently doesn't work https://github.com/wbthomason/packer.nvim/issues/180
    {"nvim-lua/plenary.nvim"}, -- Packer can manage itself as an optional plugin
    -- {'lewis6991/impatient.nvim', rocks = 'mpack'}
    -- Icons
    {"kyazdani42/nvim-web-devicons", opt = true}, -- Git integration
    {"tpope/vim-fugitive"}, {"APZelos/blamer.nvim"}, {
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
    {"neovim/nvim-lspconfig", opt = true}, {"rinx/lspsaga.nvim", opt = true}, {
        "kabouzeid/nvim-lspinstall",
        config = function()
            require("lspinstall").setup {}
        end,
        opt = true
    }, {"nvim-lua/popup.nvim", opt = true}, {
        "nvim-telescope/telescope.nvim",
        config = function()
            require("plugins.telescope").setup()
        end
    }, {"nvim-telescope/telescope-fzy-native.nvim", opt = true}, -- Harpoon
    {
        "ThePrimeagen/harpoon",
        config = function()
            require("harpoon").setup({global_settings = {save_on_toggle = false, save_on_change = true}})
        end
    }, -- Debugging
    {"mfussenegger/nvim-dap", opt = true}, -- Autocomplete
    {"hrsh7th/nvim-compe", opt = true}, {"hrsh7th/vim-vsnip", opt = true}, {"rafamadriz/friendly-snippets", opt = true},

    -- Treesitter
    {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}, {"windwp/nvim-ts-autotag", opt = true}, -- Explorer
    {"kyazdani42/nvim-tree.lua"}, -- TODO remove when open on dir is supported by nvimtree
    {"kevinhwang91/rnvimr"}, -- {'lukas-reineke/indent-blankline.nvim', opt=true, branch = 'lua'}
    {
        "lewis6991/gitsigns.nvim",
        event = "BufRead",
        config = function()
            require("plugins.gitsigns").setup()
        end
    }, {"folke/which-key.nvim", opt = true}, {"ChristianChiarulli/dashboard-nvim", opt = true},
    {"windwp/nvim-autopairs", opt = true}, {"terrortylor/nvim-comment", opt = true},
    {"kevinhwang91/nvim-bqf", opt = true}, -- Color
    {"christianchiarulli/nvcode-color-schemes.vim", opt = true}, -- Status Line and Bufferline
    {"glepnir/galaxyline.nvim"}
}
