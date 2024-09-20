return {
    "rcarriga/nvim-dap-ui",
    dependencies = {
        { "mfussenegger/nvim-dap" }
    },
    config = {
        floating = {
            mappings = {
                close = { "<M-d>", "q" }
            }
        },
        layouts = {
            {
                position = "right",
                size = 0.2,
                elements = {
                    {
                        id = "scopes",
                        size = 0.2
                    },
                    {
                        id = "breakpoints",
                        size = 0.2
                    },
                    {
                        id = "stacks",
                        size = 0.2
                    },
                    {
                        id = "watches",
                        size = 0.2
                    },
                    {
                        id = "repl",
                        size = 0.2
                    },
                },
            },
        },

    },
    keys = {
        { "<M-d>", function() require('dapui').float_element("console", { position = "center", width = 180, height = 25, enter = true }) end },
        { "<M-D>", function() require('dapui').toggle() end },
        { "<M-y>", function() require('dap').toggle_breakpoint() end },
        { "<M-Y>", function() require('dap').toggle_breakpoint(vim.fn.input('Breakpoint condition: ')) end },
        { "<M-u>", function() require('dap').step_over() end },
        { "<M-i>", function() require('dap').step_into() end },
        { "<M-o>", function() require('dap').step_out() end },
        { "<M-p>", function() require('dap').continue() end },
    }
}
