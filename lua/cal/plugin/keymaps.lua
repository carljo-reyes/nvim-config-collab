local cmd = function(command)
    return '<cmd>' .. command .. '<cr>'
end

vim.keymap.set('n', '<leader>l', cmd "Lazy")
vim.keymap.set('n', '<leader>L', cmd "LspInfo")

----------------------------------------------------------------
-- editor
----------------------------------------------------------------
vim.keymap.set('v', '<cr>', [["+y]])
vim.keymap.set('v', '<C-c>', [["+y]])
vim.keymap.set('', '<M-e>', cmd "set nohls!")

----------------------------------------------------------------
-- tabs
----------------------------------------------------------------
vim.keymap.set('n', '<M-n>', cmd "tabnew")
vim.keymap.set('n', '<M-,>', cmd "tabprev")
vim.keymap.set('n', '<M-.>', cmd "tabnext")

----------------------------------------------------------------
-- panes
----------------------------------------------------------------
vim.keymap.set('', '<M-->', cmd "new")
vim.keymap.set('', '<M-=>', cmd "vnew")
-- disabled in favor of alexghergh/nvim-tmux-navigation plugin:
-- vim.keymap.set('', '<M-h>', [[<C-w>h]])
-- vim.keymap.set('', '<M-j>', [[<C-w>j]])
-- vim.keymap.set('', '<M-k>', [[<C-w>k]])
-- vim.keymap.set('', '<M-l>', [[<C-w>l]])

-----------------------------------------------------------
-- close vim :)
-----------------------------------------------------------
vim.keymap.set('n', '<M-X>', cmd "x")

vim.keymap.set('n', '<M-w>', cmd "bd")
vim.keymap.set('n', '<M-W>', cmd "bd!")

vim.keymap.set('n', '<M-q>', cmd "q")
vim.keymap.set('n', '<M-Q>', cmd "qa!")
