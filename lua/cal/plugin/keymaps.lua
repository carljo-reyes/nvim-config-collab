local cmd = require('cal.helpers.cmd')

vim.keymap.set('n', '<leader>l', cmd "Lazy")
vim.keymap.set('n', '<leader>L', cmd "LspInfo")

----------------------------------------------------------------
-- editor
----------------------------------------------------------------
vim.keymap.set('', '<C-f>', cmd "set nohls!")
vim.keymap.set('n', '<C-a>', [[<ESC>ggVG]])
vim.keymap.set('v', '<C-c>', [["+y]])
vim.keymap.set('v', '<cr>', [["+y]])

vim.keymap.set('n', '<leader>w', cmd "update")


----------------------------------------------------------------
-- tabs
----------------------------------------------------------------
vim.keymap.set('n', '<M-t>', cmd "tabnew")
vim.keymap.set('n', '<C-t>', cmd "tabnew")
vim.keymap.set('n', '<M-n>', cmd "tabnew")
vim.keymap.set('n', '<C-n>', cmd "tabnew")

vim.keymap.set('n', '<M-q>', cmd "tabclose")
vim.keymap.set('n', '<M-i>', cmd "tabprev")
vim.keymap.set('n', '<M-o>', cmd "tabnext")

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
vim.keymap.set('t', '<ESC>', [[<C-\><C-N>]])

vim.keymap.set('n', '<M-w>', cmd "bd")
vim.keymap.set('n', '<M-W>', cmd "bd!")

vim.keymap.set('', '<M-H>', cmd "wincmd <")
vim.keymap.set('', '<M-J>', cmd "wincmd +")
vim.keymap.set('', '<M-K>', cmd "wincmd -")
vim.keymap.set('', '<M-L>', cmd "wincmd >")

-----------------------------------------------------------
-- close vim :)
-----------------------------------------------------------
vim.keymap.set('n', '<M-c>', cmd "q")
vim.keymap.set('n', '<M-C>', cmd "q!")
