return {
    spec = {
        import = "lazy-setup.plugins"
    },
    change_detection = {
        enabled = true,
        notify = false
    },
    git = {
        timeout = 300
    },
    install = {
        colorscheme = { "tokyonight-moon" },
    },
    performance = {
        rtp = {
            paths = {
                vim.fn.stdpath("config") .. '/lua/cal/rtp',
                -- vim.fn.stdpath("config") .. '/lua/snippets'
            }
        }
    },
}
