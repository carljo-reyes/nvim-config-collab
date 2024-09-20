return {
    'alexghergh/nvim-tmux-navigation',
    lazy = false,
    config = true,
    keys = {
        { '<M-h>', '<Cmd>NvimTmuxNavigateLeft<CR>', mode = {'t', 'i', 'n'}},
        { '<M-j>', '<Cmd>NvimTmuxNavigateDown<CR>', mode = {'t', 'i', 'n'}},
        { '<M-k>', '<Cmd>NvimTmuxNavigateUp<CR>', mode = {'t', 'i', 'n'}},
        { '<M-l>', '<Cmd>NvimTmuxNavigateRight<CR>', mode = {'t', 'i', 'n'}},
    }
}
