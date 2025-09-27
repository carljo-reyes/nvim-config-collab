local cmd = require('cal.helpers.cmd')

return {
    {
        'lukas-reineke/indent-blankline.nvim',
        main = 'ibl',
        opts = {
            indent = {
                char = '┊'
            }
        },
    },

    -- notify window, cmdline
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
            -- add any options here
        },
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        },
        keys = {
            { "<M-x>", cmd "NoiceDismiss" }
        }
    },
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = true
    },
    {
        "tpope/vim-surround",
        lazy = false
    },
}
