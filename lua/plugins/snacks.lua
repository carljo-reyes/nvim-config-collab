return {
  "folke/snacks.nvim",
  opts = function(_, opts)
    local keys = opts.dashboard.preset.keys
    table.insert(keys, {
      {
        hidden = true,
        icon = " ",
        key = "i",
        desc = "New Scratch",
        action = ":ene | set buftype=nofile | startinsert",
      },
    })
    for i, item in ipairs(keys) do
      if item.key == "n" then
        opts.dashboard.preset.keys[i] = vim.tbl_extend("force", item, {
          desc = "New Scratch",
          action = ":ene | set buftype=nofile | startinsert",
        })
        break
      end
    end
  end,
}
