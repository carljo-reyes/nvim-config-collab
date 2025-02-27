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
    config = true
}
