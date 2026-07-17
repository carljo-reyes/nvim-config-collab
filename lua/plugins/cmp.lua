local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local select = function(cmp, direction)
  return function(fallback)
    if cmp.visible() then
      local entries = cmp.get_entries()

      if #entries == 1 and direction >= 1 then
        cmp.confirm({ select = true })
      elseif direction >= 1 then
        cmp.select_next_item()
      else
        cmp.select_prev_item()
      end
    elseif vim.snippet.active({ direction = direction }) then
      vim.schedule(function()
        vim.snippet.jump(direction)
      end)
    elseif has_words_before() then
      cmp.complete()
    else
      fallback()
    end
  end
end

return {
  -- add emoji
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "hrsh7th/cmp-emoji" },
    opts = function(_, opts)
      table.insert(opts.sources, { name = "emoji" })
    end,
  },

  --
  {
    "hrsh7th/nvim-cmp",
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local cmp = require("cmp")

      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<Tab>"] = cmp.mapping(select(cmp, 1), { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(select(cmp, -1), { "i", "s" }),
        ["<C-j>"] = cmp.mapping(select(cmp, 1), { "i", "s" }),
        ["<C-k>"] = cmp.mapping(select(cmp, -1), { "i", "s" }),
      })
    end,
  },
}
