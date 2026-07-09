return {
  "folke/snacks.nvim",
  opts = function(_, opts)
    for i, item in ipairs(opts.dashboard.preset.keys) do
      if item.key == "n" then
        opts.dashboard.preset.keys[i] = vim.tbl_extend("force", item, {
          desc = "New scratch",
          action = ":ene | set buftype=nofile | startinsert",
        })
        break
      end
    end
  end,
}
