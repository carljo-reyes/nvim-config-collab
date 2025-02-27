return {
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            highlight = {
                enable = true,
                disable = { "vimdoc" },
                additional_vim_regex_highlighting = false,
            },
            incremental_selection = {
                enable = true,
                keymaps = {
                    -- init_selection = "V", -- set to `false` to disable one of the mappings
                    node_incremental = "J",
                    node_decremental = "K",
                },
            },
            indent = {
                enable = true,
            }
        },
        -- config = function(plugin, opts)
        -- end,
        config = true,
        lazy = false,
        main = 'nvim-treesitter.configs',
        ft = "",
        keys = {
            {
                "U",
                function()
                    local utils = require 'nvim-treesitter.ts_utils'
                    local currNode = utils.get_node_at_cursor()
                    local prevNode = utils.get_previous_node(currNode)
                    print( vim.inspect(prevNode) )
                    return prevNode
                end,
                { "v" }
            }
        }
    },
    -- {
    --     "nvim-treesitter/playground",
    --     lazy = false
    -- }
}
