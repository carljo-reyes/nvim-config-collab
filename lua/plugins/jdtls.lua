return {
  -- use java21
  {
    "mfussenegger/nvim-jdtls",
    opts = function(_, opts)
      local cmd = { vim.fn.exepath("jdtls") }

      local java21 = vim.fn.expand("~/.sdkman/candidates/java/21/bin/java")
      if vim.fn.executable(java21) == 1 then
        table.insert(cmd, string.format("--java-executable=%s", java21))
      end

      if LazyVim.has("mason.nvim") then
        local lombok_jar = vim.fn.expand("$MASON/share/jdtls/lombok.jar")
        table.insert(cmd, string.format("--jvm-arg=-javaagent:%s", lombok_jar))
      end
      opts.cmd = cmd
    end,
  },

  -- turn off format
  {
    "mfussenegger/nvim-jdtls",
    opts = {
      settings = {
        java = {
          format = {
            enabled = false,
          },
        },
      },
    },
  },
}
