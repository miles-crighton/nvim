return {
  -- Misc
  "almo7aya/openingh.nvim",
  "nvim-lua/plenary.nvim",
  "NvChad/ui",
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = {
          auto_trigger = true,
        },
        panel = {
          layout = {
            position = "right",
          },
        },
      })
    end,
  },
  { "nvim-tree/nvim-web-devicons" },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup(nil, {
        RGB = true,      -- #RGB hex codes
        RRGGBB = true,   -- #RRGGBB hex codes
        names = false,   -- "Name" codes like Blue
        RRGGBBAA = true, -- #RRGGBBAA hex codes
        rgb_fn = true,   -- CSS rgb() and rgba() functions
        hsl_fn = true,   -- CSS hsl() and hsla() functions
        css = false,     -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = false,  -- Enable all CSS *functions*: rgb_fn, hsl_fn
        -- Available modes: foreground, background
        mode = "background", -- Set the display mode.
      })
    end,
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup()
    end,
  },

  -- Git
  {
    "lewis6991/gitsigns.nvim",
    ft = "gitcommit",
    init = function()
      -- load gitsigns only when a git file is opened -- from https://github.com/NvChad/NvChad/blob/v2.0/lua/plugins/init.lua#L95
      vim.api.nvim_create_autocmd({ "BufRead" }, {
        group = vim.api.nvim_create_augroup("GitSignsLazyLoad", { clear = true }),
        callback = function()
          vim.fn.system("git -C " .. vim.fn.expand("%:p:h") .. " rev-parse")
          if vim.v.shell_error == 0 then
            vim.api.nvim_del_augroup_by_name("GitSignsLazyLoad")
            vim.schedule(function()
              require("lazy").load({ plugins = { "gitsigns.nvim" } })
            end)
          end
        end,
      })
    end,
    config = function()
      require("plugins.gitsigns").setup()
    end,
  },
  { "APZelos/blamer.nvim" },

  -- Themes
  { "folke/tokyonight.nvim" },
  { "drewtempelmeyer/palenight.vim" },
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  { "rktjmp/lush.nvim" },

  -- LSP
  "neovim/nvim-lspconfig",
  { "williamboman/mason.nvim", opts = {} },
  {
    "j-hui/fidget.nvim",
    tag = "legacy",
    config = function()
      require("fidget").setup({
        sources = {
          ["null-ls"] = {
            ignore = true,
          },
        },
      })
    end,
  },
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    config = function()
      require("typescript-tools").setup({
        on_attach = function(client, bufnr)
          require("lsp.on-attach").on_attach(client, bufnr)
        end,
      })
    end,
  },
  {
    "luckasRanarison/tailwind-tools.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = {}, -- your configuration
  },
  "jose-elias-alvarez/null-ls.nvim",
  {
    "simrat39/rust-tools.nvim",
    config = function()
      require("rust-tools").setup()
    end,
  },

  -- -- LSP utils
  {
    "glepnir/lspsaga.nvim",
    event = "BufRead",
    config = function()
      require("lspsaga").setup({
        code_action_lightbulb = {
          enable = false,
        },
        symbol_in_winbar = {
          enable = false,
        },
      })
    end,
  },

  -- Navigation
  {
    "nvim-telescope/telescope.nvim",
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
    },
  },
  {
    "altermo/ultimate-autopair.nvim",
    event = { "InsertEnter", "CmdlineEnter" },
    branch = "v0.6",
    opts = {},
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
    build = ":TSUpdate",
    config = function()
      require("plugins.treesitter").setup()
    end,
  },
  "nvim-treesitter/playground",
  -- {
  -- 	"nvim-treesitter/nvim-treesitter-context",
  -- 	init = function()
  -- 		require("treesitter-context").setup()
  -- 	end,
  -- },
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
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
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
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles", "DiffviewFileHistory" },
  },
  {
    "stevearc/oil.nvim",
    opts = {
      view_options = {
        show_hidden = true,
      },
    },
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  -- Test and Debugging
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
  },
}
