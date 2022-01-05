local M = {}
M.methods = {}

---checks if the character preceding the cursor is a space character
---@return boolean true if it is a space character, false otherwise
local check_backspace = function()
    local col = vim.fn.col "." - 1
    return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end
M.methods.check_backspace = check_backspace

M.config = function()
    local status_cmp_ok, cmp = pcall(require, "cmp")
    if not status_cmp_ok then return end

    local kind_icons = {
        Text = "",
        Method = "m",
        Function = "",
        Constructor = "",
        Field = "",
        Variable = "",
        Class = "",
        Interface = "",
        Module = "",
        Property = "",
        Unit = "",
        Value = "",
        Enum = "",
        Keyword = "",
        Snippet = "",
        Color = "",
        File = "",
        Reference = "",
        Folder = "",
        EnumMember = "",
        Constant = "",
        Struct = "",
        Event = "",
        Operator = "",
        TypeParameter = ""
    }

    return {}
end

function M.setup()
    require("cmp").setup(M.config())
    print('running cmp setup')
end

return M
