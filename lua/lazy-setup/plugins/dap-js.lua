return {
    {
        "microsoft/vscode-js-debug",
        build = "rm -rf out && git restore . && git clean -ffd && npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out && git restore package-lock.json",
    },
    {
        "mxsdev/nvim-dap-vscode-js",
        dependencies = {
            "microsoft/vscode-js-debug",
        },
        opts = function()
            local path = vim.fn.stdpath("data") .. "/lazy/vscode-js-debug"
            return {
                adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' },
                debugger_path = path
            }
        end,
        init = function()
            for _, language in ipairs({ "typescript", "javascript" }) do
                require("dap").configurations[language] = {
                    {
                        type = "pwa-node",
                        request = "launch",
                        name = "Launch file",
                        program = "${file}",
                        cwd = "${workspaceFolder}",
                        -- runtimeExecutable = "bun"
                    },
                    {
                        type = "pwa-node",
                        request = "attach",
                        name = "Attach",
                        processId = require 'dap.utils'.pick_process,
                        cwd = "${workspaceFolder}",
                        -- runtimeExecutable = "bun"
                    },
                    {
                        type = "pwa-node",
                        request = "attach",
                        port = 9229,
                        name = "Auto Attach",
                        cwd = "${workspaceFolder}",
                        -- runtimeExecutable = "bun"
                    },
                    -- {
                    --     skipFiles = { "<node_internals>/**" },
                    --     type = "node-terminal",
                    --     request = "launch",
                    --     name = "npm script: dev",
                    --     command = "npm run dev",
                    --     cwd = "${workspaceFolder}",
                    --     runtimeExecutable = "bun"
                    -- }
                }
            end
        end
    }
}
