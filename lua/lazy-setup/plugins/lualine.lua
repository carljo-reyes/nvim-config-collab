return {
    "nvim-lualine/lualine.nvim",
    dependency = {
        "folke/tokyonight.nvim",
    },
    lazy = false,
    opts = {
        options = {
            icons_enabled = true,
            theme = 'tokyonight',
        }
    },
    config = {
        sections = {
            lualine_y = {},
            lualine_z = {
                {
                    require("noice").api.statusline.mode.get,
                    cond = require("noice").api.statusline.mode.has,
                }
            }
        }
    }
}
