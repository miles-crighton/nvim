local M = {}

M.config = {
    ensure_installed = "all",
    ignore_install = {"haskell"},
    highlight = {enable = true},
    playground = {enable = true}
}

M.setup = function()
    require"nvim-treesitter.configs".setup(M.config)
end

return M
