-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local cmd = function(command)
  return "<cmd>" .. command .. "<cr>"
end

vim.keymap.set("t", "<ESC>", [[<C-\><C-N>]])
vim.keymap.set("n", "<M-i>", cmd("bprevious"))
vim.keymap.set("n", "<M-o>", cmd("bnext"))
vim.keymap.set("v", "<Enter>", '"+y')

vim.keymap.set("n", "<Tab>[", cmd("tabprevious"))
vim.keymap.set("n", "<Tab>]", cmd("tabnext"))
vim.keymap.set("n", "<Tab>n", cmd("tab split"))
vim.keymap.set("n", "<Tab>q", cmd("tabclose"))
