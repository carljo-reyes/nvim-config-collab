vim.keymap.set('n', '<M-e>', [[<cmd>E<cr>]])        -- explorer

-----------------------------------------------------------
-- tabs
-----------------------------------------------------------
vim.keymap.set('n', '<M-n>', [[<cmd>tabnew<cr>]])
vim.keymap.set('n', '<M-,>', [[<cmd>tabprev<cr>]])
vim.keymap.set('n', '<M-.>', [[<cmd>tabnext<cr>]])

-----------------------------------------------------------
-- panes
-----------------------------------------------------------
vim.keymap.set('', '<M-->', [[<cmd>new<cr>]])
vim.keymap.set('', '<M-\\>', [[<cmd>vnew<cr>]])
vim.keymap.set('', '<M-h>', [[<C-w>h]])
vim.keymap.set('', '<M-j>', [[<C-w>j]])
vim.keymap.set('', '<M-k>', [[<C-w>k]])
vim.keymap.set('', '<M-l>', [[<C-w>l]])

-----------------------------------------------------------
-- close vim :)
-----------------------------------------------------------
vim.keymap.set('n', '<M-X>', [[<cmd>x<cr>]])

vim.keymap.set('n', '<M-w>', [[<cmd>bd<cr>]])
vim.keymap.set('n', '<M-W>', [[<cmd>bd!<cr>]])

vim.keymap.set('n', '<M-q>', [[<cmd>qa<cr>]])
vim.keymap.set('n', '<M-Q>', [[<cmd>qa!<cr>]])
