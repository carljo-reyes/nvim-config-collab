return {
  "folke/snacks.nvim",
  opts = function(_, opts)
    local keys = opts.dashboard.preset.keys
    -- commented for reference
    -- table.insert(keys, {
    --   {
    --     hidden = true,
    --     icon = " ",
    --     key = "i",
    --     desc = "New Scratch",
    --     action = ":ene | set buftype=nofile | startinsert",
    --   },
    -- })
    for i, item in ipairs(keys) do
      -- change default "f" -> "o"
      if item.key == "f" then
        item.key = "o"
      end

      -- change default "n" -> "i"
      if item.key == "n" then
        item.key = "i"
        opts.dashboard.preset.keys[i] = vim.tbl_extend("force", item, {
          -- open scratch buffer instead
          action = ":ene | set buftype=nofile | startinsert",
          desc = "New Scratch",
        })
        break
      end
    end
  end,
}
