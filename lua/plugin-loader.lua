local plugin_loader = {}

local _, packer = pcall(require, "packer")

local install_path = vim.fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"

-- Current method of initialising on first nvim load
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then plugin_loader.init() end

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
            plugin_loader.require_plugin("harpoon")
            plugin_loader.require_plugin("lspsaga.nvim")
            plugin_loader.require_plugin("nvim-lspinstall")
            plugin_loader.require_plugin("popup.nvim")
            plugin_loader.require_plugin("plenary.nvim")
            plugin_loader.require_plugin("telescope.nvim")
            plugin_loader.require_plugin("nvim-dap")
            plugin_loader.require_plugin("nvim-compe")
            plugin_loader.require_plugin("vim-vsnip")
            plugin_loader.require_plugin("nvim-treesitter")
            plugin_loader.require_plugin("nvim-ts-autotag")
            plugin_loader.require_plugin("nvim-tree.lua")
            plugin_loader.require_plugin("gitsigns.nvim")
            plugin_loader.require_plugin("which-key.nvim")
            plugin_loader.require_plugin("dashboard-nvim")
            plugin_loader.require_plugin("nvim-autopairs")
            plugin_loader.require_plugin("nvim-comment")
            plugin_loader.require_plugin("nvim-bqf")
            plugin_loader.require_plugin("nvcode-color-schemes.vim")
            plugin_loader.require_plugin("nvim-web-devicons")
            plugin_loader.require_plugin("galaxyline.nvim")
        end)
    end, debug.traceback)
    if not status_ok then
        print("problems detected while loading plugins' configurations")
        print(debug.traceback())
    end

end

return plugin_loader
