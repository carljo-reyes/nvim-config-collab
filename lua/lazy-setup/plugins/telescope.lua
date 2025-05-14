local cmd = require('cal.helpers.cmd')

return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-tree/nvim-web-devicons", config = true, }
    },
    opts = function()
        local actions = require("telescope.actions")
        return {
            defaults = {
                layout_strategy = 'vertical',
                layout_config = {
                    preview_cutoff = 10,
                    preview_height = 0.4
                },
                mappings = {
                    n = {
                        ["<M-q>"] = actions.close,
                        ["<M-w>"] = actions.close,
                        ["<esc>"] = actions.close,
                        ["<C-c>"] = actions.close,
                        ["C-j"] = actions.move_selection_next,
                        ["C-k"] = actions.move_selection_previous,
                    },
                    i = {
                        ["<M-q>"] = actions.close,
                        ["<M-w>"] = actions.close,
                        ["<C-j>"] = actions.move_selection_next,
                        ["<C-k>"] = actions.move_selection_previous,
                    }
                },
            }
        }
    end,
    config = true,
    keys = {
        { "<leader>T",        cmd "Telescope builtin" },

        { "<leader><leader>", cmd "Telescope builtin" },
        { "<M-f>",            cmd "Telescope live_grep" },

        { "<leader>o",        cmd "Telescope find_files" },
        { "<leader>f",        cmd "Telescope live_grep" },
        { "<leader>df",        cmd "Telescope current_buffer_fuzzy_find" },
        { "<leader>e",        cmd "Telescope buffers" },
        { "<leader>cf",       cmd "Telescope filetypes" },

        { "<leader>h",        cmd "Telescope help_tags" },
    }
}
