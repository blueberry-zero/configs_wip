-- [[
-- lua.plugins.tree-sitter.lua
-- ]]

return {
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = "all",
            sync_install = false,
            auto_install = true,

            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },

            disable = function(_, buf)
                local max_filesize = 100 * 1024 -- 100 KB
                local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                if ok and stats and stats.size > max_filesize then
                    print("too large file:\t" .. stats.size)
                    return true
                end

                return false
            end,
        },
        config = function(_, opts)
            local ts = require("nvim-treesitter.configs")
            ts.setup(opts)
        end
    },
    { "nvim-treesitter/nvim-treesitter-context" },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            require 'nvim-treesitter.configs'.setup {
                textobjects = {
                    select = {
                        enable = true,

                        -- Automatically jump forward to textobj, similar to targets.vim
                        lookahead = true,

                        keymaps = {
                            ["af"] = "@function.outer",
                            ["if"] = "@function.inner",
                            ["ac"] = "@class.outer",
                            ["ic"] = "@class.inner",
                            ["ap"] = "@parameter.outer",
                            ["ip"] = "@parameter.inner"
                            -- ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
                        },
                        selection_modes = {
                            ['@parameter.outer'] = 'v',
                            ['@parameter.inner'] = 'v',
                            ['@function.outer'] = 'V',
                            ['@class.outer'] = 'V',
                            ["@function.inner"] = '<c-v>'
                            -- '<c-v>' -- blockwise
                            -- 'v' -- charwise
                            -- 'V' -- linewise
                        },
                        include_surrounding_whitespace = false,
                    },
                },
            }
        end
    }
}
