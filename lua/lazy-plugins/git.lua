local cmd = require('cal.helpers.cmd');

return {
    {
        "lewis6991/gitsigns.nvim",
        lazy = false,
        config = true,
        keys = {
            { "g[", cmd "Gitsigns prev_hunk" },
            { "g]", cmd "Gitsigns next_hunk" },
        }
    },
    {
        "tpope/vim-fugitive",
        lazy = false,
        keys = {
            { "<leader>G", cmd "tab G" },
            { "<leader>gg", cmd "tab G" },
            { "<leader>gl", cmd "tab G log" }
        }
    }
}
