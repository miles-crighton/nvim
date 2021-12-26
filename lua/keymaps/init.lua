local key_maps = {
    leader = "space",
    keys = {
        insert_mode = {
            -- 'jk' for quitting insert mode
            ["jk"] = "<ESC>",

            -- Move current line / block with Alt-j/k ala vscode.
            ["<A-j>"] = "<Esc>:m .+1<CR>==gi",

            -- Move current line / block with Alt-j/k ala vscode.
            ["<A-k>"] = "<Esc>:m .-2<CR>==gi",

            -- Navigation
            ["<A-Up>"] = "<C-\\><C-N><C-w>k",
            ["<A-Down>"] = "<C-\\><C-N><C-w>j",
            ["<A-Left>"] = "<C-\\><C-N><C-w>h",
            ["<A-Right>"] = "<C-\\><C-N><C-w>l",

            -- Navigate tab completion with <c-j> and <c-k>,runs conditionally
            ["<C-j>"] = {'pumvisible() ? "\\<C-n>" : "\\<C-j>"', {expr = true, noremap = true}},
            ["<C-k>"] = {'pumvisible() ? "\\<C-p>" : "\\<C-k>"', {expr = true, noremap = true}},

            -- Undo break points (ie. undo up to comma)
            [','] = ',<c-g>u',
            [';'] = ';<c-g>u'
        },

        normal_mode = {
            ["<Space>"] = '<NOP>',

            -- Comments
            ["<leader>/"] = ':CommentToggle<CR>',

            -- Better window movement
            ["<C-h>"] = "<C-w>h",
            ["<C-j>"] = "<C-w>j",
            ["<C-k>"] = "<C-w>k",
            ["<C-l>"] = "<C-w>l",

            -- Lsp
            ['K'] = ':lua require(\'lspsaga.hover\').render_hover_doc()<CR>',
            ['gs'] = ':lua require(\'lspsaga.signaturehelp\').signature_help()<CR>',

            -- Make Y work like D
            ['Y'] = 'y$',

            -- Jumplist Mutations
            ['k'] = {'(v:count > 5 ? "m\'" . v:count : "") . \'k\'', {noremap = true, silent = true, expr = true}},
            ['j'] = {'(v:count > 5 ? "m\'" . v:count : "") . \'j\'', {noremap = true, silent = true, expr = true}},

            -- Resize with arrows
            -- Doesn't work with mac bindings
            ["<C-Up>"] = ":resize -2<CR>",
            ["<C-Down>"] = ":resize +2<CR>",
            ["<C-Left>"] = ":vertical resize -2<CR>",
            ["<C-Right>"] = ":vertical resize +2<CR>",

            -- Tab switch buffer
            ["<S-l>"] = ":BufferNext<CR>",
            ["<S-h>"] = ":BufferPrevious<CR>",

            -- Move current line / block with Alt-j/k a la vscode.
            ["<A-j>"] = ":m .+1<CR>==",
            ["<A-k>"] = ":m .-2<CR>==",

            -- Stable center for next/prev
            ['n'] = {'nzzzv', {noremap = true, silent = true}},
            ['N'] = {'Nzzzv', {noremap = true, silent = true}},
            ['J'] = {'mzJ`z', {noremap = true, silent = true}},

            -- QuickFix
            ["]q"] = ":cnext<CR>",
            ["[q"] = ":cprev<CR>",
            ["<C-q>"] = ":call QuickFixToggle()<CR>",

            -- Add a line above/below
            ['<ENTER>'] = ':set paste<CR>m`o<Esc>``:set nopaste<CR>',
            -- currently broken https://stackoverflow.com/questions/16359878/how-to-map-shift-enter
            ['<C-ENTER>'] = ':set paste<CR>m`O<Esc>``:set nopaste<CR>',

            -- Re-source config
            ['<Leader>ss'] = {':luafile $MYVIMRC<CR>', {noremap = true}},

            -- Telescope
            ['<Leader>f'] = ":lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})<CR>",

            -- Nvimtree
            ['<Leader>e'] = ":NvimTreeToggle<CR>",

            -- Buffers
            ['<Leader>c'] = ':BufferClose<CR>',

            -- Highlights
            ['<Leader>h'] = ':set hlsearch!<CR>'
        },

        term_mode = {
            -- Terminal window navigation
            ["<C-h>"] = "<C-\\><C-N><C-w>h",
            ["<C-j>"] = "<C-\\><C-N><C-w>j",
            ["<C-k>"] = "<C-\\><C-N><C-w>k",
            ["<C-l>"] = "<C-\\><C-N><C-w>l",

            -- Exit terminal input
            ["<Esc>"] = "<C-\\><C-n>"
        },

        visual_mode = {
            -- Better indenting
            ["<"] = "<gv",
            [">"] = ">gv",

            -- Comments
            ["<leader>/"] = ':CommentToggle<CR>'
        },

        visual_block_mode = {
            -- Move selected line / block of text in visual mode
            ["K"] = ":move '<-2<CR>gv-gv",
            ["J"] = ":move '>+1<CR>gv-gv",

            -- Move current line / block with Alt-j/k ala vscode.
            ["<A-j>"] = ":m '>+1<CR>gv-gv",
            ["<A-k>"] = ":m '<-2<CR>gv-gv"
        },

        command_mode = {
            -- navigate tab completion with <c-j> and <c-k>, runs conditionally
            ["<C-j>"] = {'pumvisible() ? "\\<C-n>" : "\\<C-j>"', {expr = true, noremap = true}},
            ["<C-k>"] = {'pumvisible() ? "\\<C-p>" : "\\<C-k>"', {expr = true, noremap = true}}
        }
    }
}

return {
    setup = function()
        vim.g.mapleader = (key_maps.leader == "space" and " ")
        require("keymaps.loader").load(key_maps.keys)
    end
}
