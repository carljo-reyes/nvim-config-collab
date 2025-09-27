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
    init = function ()
        local builtin = require("telescope.builtin")
        local actions = require("telescope.actions")
        local action_state = require("telescope.actions.state")

        local function pick_branch()
            builtin.git_branches({
                attach_mappings = function(prompt_bufnr, map)
                    local function on_select(...)
                        local selection = action_state.get_selected_entry()
                        actions.close(prompt_bufnr)
                        -- print("You picked branch: " .. selection.value)
                        vim.cmd(string.format("Gitsigns change_base %s 1'", selection.value))
                        require('neo-tree.command').execute({
                            action = "show",
                            source = "git_status",
                            git_base = selection.value,
                        })
                    end

                    map("i", "<CR>", on_select)
                    map("n", "<CR>", on_select)
                    return true
                end,
            })
        end

        vim.api.nvim_create_user_command("PickGitBranch", pick_branch, {})
    end,
    config = true,
    keys = {
        { "<leader>T",        cmd "Telescope builtin" },

        { "<leader><leader>", cmd "Telescope builtin" },
        { "<M-f>",            cmd "Telescope live_grep" },

        { "<leader>o",        cmd "Telescope find_files" },
        { "<leader>f",        cmd "Telescope live_grep" },
        { "<leader>df",        cmd "Telescope current_buffer_fuzzy_find" },
        { "<C-f>",        cmd "Telescope current_buffer_fuzzy_find" },
        { "<leader>e",        cmd "Telescope buffers" },
        { "<leader>cf",       cmd "Telescope filetypes" },

        { "<leader>h",        cmd "Telescope help_tags" },
    }
}
