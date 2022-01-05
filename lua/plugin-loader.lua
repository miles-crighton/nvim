local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path
    }
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins-config.lua | plugins-loader.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-config.lua source <afile> | PackerSync!
    autocmd BufWritePost plugins-loader.lua source <afile> | PackerSync
  augroup end
]]

local plugin_loader = {}

-- Use a protected call so we don't error out on first use
local packer_status_ok, packer = pcall(require, "packer")
if not packer_status_ok then return end

function plugin_loader.init(opts)
    opts = opts or {}

    local package_root = vim.fn.stdpath "data" .. "/site/pack"

    if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
        vim.fn.system {"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path}
        vim.cmd "packadd packer.nvim"
    end

    packer.init {
        package_root = package_root,
        log = {level = "warn"},
        git = {clone_timeout = 300},
        max_jobs = 50,
        display = {
            open_fn = function()
                return require("packer.util").float {border = "rounded"}
            end
        }
    }
end

--- Check if a file or directory exists in this path
function plugin_loader.require_plugin(plugin)
    local plugin_prefix = vim.fn.stdpath("data") .. "/site/pack/packer/opt/"

    local plugin_path = plugin_prefix .. plugin .. "/"
    --	print('test '..plugin_path)
    local ok, err, code = os.rename(plugin_path, plugin_path)
    if not ok then
        if code == 13 then
            -- Permission denied, but it exists
            return true
        end
    end
    --	print(ok, err, code)
    if ok then vim.cmd("packadd " .. plugin) end
    return ok, err, code
end

function plugin_loader.load(configurations)
    local status_ok, _ = xpcall(function()
        packer.startup(function(use)
            -- Initialise configs
            for _, plugins in ipairs(configurations) do for _, plugin in ipairs(plugins) do use(plugin) end end

            -- Load plugins - this needs sorting
            plugin_loader.require_plugin("nvim-lspconfig")
            plugin_loader.require_plugin("lspsaga.nvim")
            plugin_loader.require_plugin("nvim-lspinstall")
            plugin_loader.require_plugin("nvim-dap")
            plugin_loader.require_plugin("vim-vsnip")
            plugin_loader.require_plugin("nvim-treesitter")
            plugin_loader.require_plugin("nvim-ts-autotag")
            plugin_loader.require_plugin("which-key.nvim")
            plugin_loader.require_plugin("nvim-autopairs")
            plugin_loader.require_plugin("nvim-bqf")
            plugin_loader.require_plugin("nvcode-color-schemes.vim")
            plugin_loader.require_plugin("nvim-web-devicons")

            if PACKER_BOOTSTRAP then require("packer").sync() end
        end)
    end, debug.traceback)

    if not status_ok then
        print("problems detected while loading plugins' configurations")
        print(debug.traceback())
    end
end

return plugin_loader
