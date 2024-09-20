return {
    "mfussenegger/nvim-dap",
    dependencies = {
        'Joakker/lua-json5',
        build = './install.sh'
    },
    init = function()
        local vscext = require('dap.ext.vscode')
        vscext.json_decode = require 'json5'.parse
        vim.api.nvim_create_user_command(
            'DapLoadLaunchJson',
            function()
                vscext.load_launchjs()
            end,
            {}
        )
    end
}
