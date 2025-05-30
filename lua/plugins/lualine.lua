local M = { "nvim-lualine/lualine.nvim" }

local function diff_source()
  local gitsigns = vim.b.gitsigns_status_dict
  if gitsigns then
    return { added = gitsigns.added, modified = gitsigns.changed, removed = gitsigns.removed }
  end
end

local window_width_limit = 70

M.conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
  end,
  hide_in_width = function()
    return vim.fn.winwidth(0) > window_width_limit
  end,
}

M.components = {
  mode = {
    function()
      return " "
    end,
    padding = { left = 0, right = 0 },
    color = {},
    cond = nil,
  },
  branch = { "b:gitsigns_head", icon = " ", color = { gui = "bold" }, cond = M.conditions.hide_in_width },
  filename = {
    "filename",
    file_status = true,
    path = 1,
    -- shorting_target = 90,
    color = { gui = "bold" },
    cond = nil,
  },
  filetype = { "filetype", icon_only = true, cond = M.conditions.hide_in_width, color = {}, icon = { align = 'right' } },
  diagnostics = {
    "diagnostics",
    sources = { "nvim_diagnostic" },
    symbols = { error = " ", warn = " ", info = " ", hint = " " },
    color = {},
    cond = M.conditions.hide_in_width,
  },
  diff = {
    "diff",
    source = diff_source,
    symbols = { added = "  ", modified = "柳", removed = " " },
    color = {},
    cond = nil,
  },
  location = { "location", cond = M.conditions.hide_in_width, color = {} },
  progress = { "progress", cond = M.conditions.hide_in_width, color = {} },
}

M.opts = {
  options = {
    icons_enabled = true,
    theme = "auto",
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = {},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = { M.components.mode },
    lualine_b = { M.components.filetype, M.components.filename },
    lualine_c = { M.components.diagnostics },
    lualine_x = { M.components.branch, M.components.diff },
    lualine_y = { M.components.location },
    lualine_z = { M.components.progress },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { "filename" },
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  extensions = {},
}

return M
