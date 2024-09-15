-- [[
-- lua.core.custom-mappings.lua
-- ]]

-- n, v, i, t = mode names
local M = {}

M.general = {
    i = {
        -- go to  beginning and end
        ["<C-b>"] = { "<ESC>^i", "Beginning of line" },
        ["<C-e>"] = { "<End>", "End of line" },

        -- navigate within insert mode
        ["<C-h>"] = { "<Left>", "Move left" },
        ["<C-l>"] = { "<Right>", "Move right" },
        ["<C-j>"] = { "<Down>", "Move down" },
        ["<C-k>"] = { "<Up>", "Move up" },
    },

    n = {
        -- clear highlights
        ["<Esc>"] = { "<cmd> noh <CR>", "Clear highlights" },
        -- switch between windows
        ["<C-h>"] = { "<C-w>h", "Window left" },
        ["<C-l>"] = { "<C-w>l", "Window right" },
        ["<C-j>"] = { "<C-w>j", "Window down" },
        ["<C-k>"] = { "<C-w>k", "Window up" },

        -- save
        ["<C-s>"] = { "<cmd> w <CR>", "Save file" },

        -- Copy all
        ["<C-c>"] = { "<cmd> %y+ <CR>", "Copy whole file" },

        -- line numbers
        ["<leader>n"] = { "<cmd> set nu! <CR>", "Toggle line number" },
        ["<leader>rn"] = { "<cmd> set rnu! <CR>", "Toggle relative number" },

        -- Allow moving the cursor through wrapped lines with j, k, <Up> and <Down>
        -- http://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
        -- empty mode is same as using <cmd> :map
        -- also don't use g[j|k] when in operator pending mode, so it doesn't alker d, y or c behaviour
        ["j"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', "Move down", opts = { expr = true } },
        ["k"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', "Move up", opts = { expr = true } },
        ["<Up>"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', "Move up", opts = { expr = true } },
        ["<Down>"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', "Move down", opts = { expr = true } },

        -- new buffer
        ["<leader>b"] = { "<cmd> enew <CR>", "New buffer" },

        ["<leader>fm"] = {
            function()
                vim.lsp.buf.format({ async = true })
            end,
            "LSP formatting",
        },

        -- diagnostic keymaps
        ["[d"] = {
            function()
                vim.lsp.diagnostic.goto_prev()
            end,
            "Go to previos [D]iagnostic message",
        },
        ["]d"] = {
            function()
                vim.lsp.diagnostic.goto_next()
            end,
            "Go to next [D]iagnostic message",
        },
        ["<leader>e"] = {
            function()
                vim.diagnostic.open_float()
            end,
            "Show diagnostic [E]rror messages",
        },
        ["<leader>q"] = {
            function()
                vim.diagnostic.setloclist()
            end,
            "Open diagnositc [Q]quickfix list",
        },
        ["]n"] = {
            function()
                local node = vim.treesitter.get_node()
                if node then
                    local next = node:next_named_sibling()
                    if next then
                        vim.api.nvim_win_set_cursor(0, { next:range() })
                    end
                end
            end
        }
    },

    t = {
        ["<C-x>"] = { vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true), "Escape terminal mode" },
    },

    v = {
        ["<Up>"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', "Move up", opts = { expr = true } },
        ["<Down>"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', "Move down", opts = { expr = true } },
        ["<"] = { "<gv", "Indent line" },
        [">"] = { ">gv", "Indent line" },
    },

    x = {
        ["j"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', "Move down", opts = { expr = true } },
        ["k"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', "Move up", opts = { expr = true } },
        -- Don't copy the replaced text after pasting in visual mode
        -- https://vim.fandom.com/wiki/Replace_a_word_with_yanked_text#Alternative_mapping_for_paste
        ["p"] = { 'p:let @+=@0<CR>:let @"=@0<CR>', "Dont copy replaced text", opts = { silent = true } },
    },
}

M.nvim_tree = {
    plugin = true,
    -- insert mode
    i = {},
    -- normal mode
    n = {
        ["<leader>t"] = { ":NvimTreeFocus<CR>", "Open NvimTree", opts = { silent = true } },
        ["<leader>T"] = { ":NvimTreeClose<CR>", "Close NvimTree", opts = { silent = true } },
    },
    -- visual mode
    v = {},
    -- terminal mode
    t = {},
    -- select mode
    x = {}

}

M.telescope = {
    plugin = true,
    -- insert mode
    i = {},
    -- normal mode
    n = {},
    -- visual mode
    v = {},
    -- terminal mode
    t = {},
    -- select mode
    x = {}

}

M.template = {
    plugin = true,
    -- insert mode
    i = {},
    -- normal mode
    n = {},
    -- visual mode
    v = {},
    -- terminal mode
    t = {},
    -- select mode
    x = {}

}

return M
