return {
    'williamboman/mason.nvim',
    config = {
        ui = {
            check_outdated_packages_on_open = false
        }
    },
    keys = {
       { '<leader>m', '<cmd>Mason<cr>' }
    }
}
