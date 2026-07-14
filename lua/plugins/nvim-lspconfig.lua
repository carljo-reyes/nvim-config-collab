return {
  "neovim/nvim-lspconfig",
  opts = function(_, opts)
    local keys = opts.servers["*"].keys or {}
    vim.list_extend(keys, {
      { "gi", vim.lsp.buf.implementation, "Go to Implementation" },
    })
    opts.servers["*"].keys = keys
  end,
}
