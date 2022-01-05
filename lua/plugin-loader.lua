local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins-config.lua | plugins-loader.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-config.lua source <afile> | PackerSync
  augroup end
]])

local plugin_loader = {}

-- Use a protected call so we don't error out on first use
local packer_status_ok, packer = pcall(require, "packer")
if not packer_status_ok then
	return
end

function plugin_loader.init(opts)
	opts = opts or {}

	local package_root = vim.fn.stdpath("data") .. "/site/pack"

	if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
		vim.fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd("packadd packer.nvim")
	end

	packer.init({
		package_root = package_root,
		log = { level = "warn" },
		git = { clone_timeout = 300 },
		max_jobs = 50,
		display = {
			open_fn = function()
				return require("packer.util").float({ border = "rounded" })
			end,
		},
	})
end

function plugin_loader.load(configurations)
	local status_ok, _ = xpcall(function()
		packer.startup(function(use)
			-- Initialise configs
			for _, plugins in ipairs(configurations) do
				for _, plugin in ipairs(plugins) do
					use(plugin)
				end
			end

			if PACKER_BOOTSTRAP then
				require("packer").sync()
			end
		end)
	end, debug.traceback)

	if not status_ok then
		print("problems detected while loading plugin configurations")
		print(debug.traceback())
	end
end

return plugin_loader
