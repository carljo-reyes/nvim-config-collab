-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.dbs = {
  localhost = "mysql://127.0.0.1:3306/payparkph",
}

vim.opt.clipboard = ""
vim.opt.wrap = true

vim.g.autoformat = false
