-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local cmd = function(command)
  return "<cmd>" .. command .. "<cr>"
end

local map = function(mode, lhs, rhs, opts)
  vim.keymap.set(vim.split(mode, ""), lhs, rhs, opts)
end

map("t", "<ESC>", [[<C-\><C-N>]])
map("n", "<M-i>", cmd("bprevious"))
map("n", "<M-o>", cmd("bnext"))
map("v", "<Enter>", '"+y')

map("n", "<Tab>i", cmd("tabprevious"))
map("n", "<Tab>o", cmd("tabnext"))
map("n", "<Tab>n", cmd("tab split"))
map("n", "<Tab>q", cmd("tabclose"))

map("n", "_", [[<C-x>]])
map("n", "+", [[<C-a>]])
map("inv", "<C-a>", [[<Esc>ggVG]])

map("inv", "<M-/>", [[gcc]], { remap = true })
