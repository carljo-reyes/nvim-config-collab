return function (_, bufnr)
    local nmap = function(keys, func, desc)
        if desc then
            desc = 'LSP: ' .. desc
        end

        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
    end

    nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
    nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
    nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
    nmap('gi', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
    nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
    nmap('<leader>k', vim.lsp.buf.signature_help, 'Signature Documentation')

    nmap('gd[', vim.diagnostic.goto_prev, '[G]oto Prev [D]iagnostic')
    nmap('gd]', vim.diagnostic.goto_next, '[G]oto Next [D]iagnostic')

    nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
    nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
    nmap('<leader>gD', vim.lsp.buf.type_definition, 'Type [D]efinition')

    vim.keymap.set('v', '<Space>ca', vim.lsp.buf.code_action, { desc = '[C]ode [A]ction 2' })

    -- Lesser used LSP functionality
    nmap('<leader>f', vim.lsp.buf.format, '[F]ormat')

    -- Create a command `:Format` local to the LSP buffer
    vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
        vim.lsp.buf.format()
    end, { desc = 'Format current buffer with LSP' })

end
