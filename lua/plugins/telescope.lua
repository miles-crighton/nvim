local M = {}

M.setup = function()
    local actions = require('telescope.actions')

    require('telescope').setup {
        defaults = {
            prompt_prefix = " ",
            selection_caret = " ",
            entry_prefix = "  ",
            vimgrep_arguments = {
                'rg', '--hidden', '--color=never', '--no-heading', '--with-filename', '--line-number', '--column',
                '--smart-case'
            },
            initial_mode = "insert",
            selection_strategy = "reset",
            sorting_strategy = "descending",
            layout_strategy = "horizontal",
            layout_config = {
                width = 0.75,
                prompt_position = "bottom",
                preview_cutoff = 120,
                horizontal = {mirror = false},
                vertical = {mirror = false}
            },
            file_sorter = require("telescope.sorters").get_fzy_sorter,
            file_ignore_patterns = {},
            generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
            path_display = {shorten = 5},
            winblend = 0,
            border = {},
            borderchars = {"─", "│", "─", "│", "╭", "╮", "╯", "╰"},
            color_devicons = true,
            use_less = true,
            set_env = {["COLORTERM"] = "truecolor"}, -- default = nil,
            file_previewer = require("telescope.previewers").vim_buffer_cat.new,
            grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
            qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
            mappings = {
                i = {
                    ["<C-n>"] = actions.move_selection_next,
                    ["<C-p>"] = actions.move_selection_previous,
                    ["<C-c>"] = actions.close,
                    ["<C-j>"] = actions.cycle_history_next,
                    ["<C-k>"] = actions.cycle_history_prev,
                    ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
                    ["<CR>"] = actions.select_default + actions.center
                },
                n = {
                    ["<C-n>"] = actions.move_selection_next,
                    ["<C-p>"] = actions.move_selection_previous,
                    ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist
                }
            }
        },
        extensions = {fzy_native = {override_generic_sorter = false, override_file_sorter = true}}
    }
end

return M