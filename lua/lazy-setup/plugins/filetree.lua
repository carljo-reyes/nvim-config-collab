local cmd = require("cal.helpers.cmd");

return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    opts = {
        window = {
            commands = {
            },
            mappings = {
                ["-"] = "close_node"
            }
        },
    },
    keys = {
        { "<M-e>", cmd "Neotree reveal toggle" },
        { "-", cmd "Neotree focus reveal" }
    }
}
