local function cmd(command)
  return "<cmd>" .. command .. "<cr>"
end

local function map(mode, lhs, rhs, opts)
  vim.keymap.set(vim.split(mode, ""), lhs, rhs, opts)
end

return {
  cmd = cmd,
  map = map,
}
