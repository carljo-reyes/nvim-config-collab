local cmd = require('cal.helpers.cmd');

return {
    {
        "lewis6991/gitsigns.nvim",
        lazy = false,
        config = {
            current_line_blame = false,
            current_line_blame_opts = {
                virt_text = true,
                virt_text_pos = 'right_align', -- 'eol' | 'overlay' | 'right_align'
                delay = 0,
                ignore_whitespace = true,
                virt_text_priority = 100,
                use_focus = true,
                max_line_length = 50
            },
            -- current_line_blame_formatter = function(name, blame_info) 
            --     return {{
            --         string.sub(blame_info.committer, 0, 10),
            --         "GitSignsCurrentLineBlame"
            --     }}
            -- end
            
        },
        keys = {
            { "g[", cmd "Gitsigns prev_hunk" },
            { "g]", cmd "Gitsigns next_hunk" },
        }
    },
    {
        "tpope/vim-fugitive",
        lazy = false,
        keys = {
            { "<leader>G",  cmd "tab G" },
            { "<leader>gg", cmd "tab G" },
            { "<leader>gl", cmd "tab G log" }
        }
    }
}
