return {
  "mfussenegger/nvim-jdtls",
  opts = function(_, opts)
    return vim.tbl_deep_extend("force", opts, {
      settings = {
        java = {
          format = {
            enabled = false,
          },
        },
      },
    })
  end,
}
