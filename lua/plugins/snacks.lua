local replace = function(keys, i, prev_key, new_key, opts)
  local item = keys[i]
  if item.key == prev_key then
    item.key = new_key
    keys[i] = vim.tbl_extend("force", item, opts or {})
  end
end

return {
  "folke/snacks.nvim",
  opts = function(_, opts)
    local keys = opts.dashboard.preset.keys
    for i, _ in ipairs(keys) do
      replace(keys, i, "g", "/")
      replace(keys, i, "n", "i", {
        action = ":ene | set buftype=nofile | startinsert",
        desc = "New Scratch",
      })
    end

    table.insert(keys, {
      {
        hidden = true,
        key = "o",
        action = ":lua Snacks.dashboard.pick('files')",
      },
      {
        hidden = true,
        key = "n",
        action = ":ene | set buftype=nofile | startinsert",
      },
    })
  end,
}
