vim.keymap.set("n", "w", function()
    vim.fn.search [=[\w\+\|\s\zs[^[:space:][:alpha:]]\ze\(\A\|$\)]=]
end)

vim.keymap.set("n", "b", function()
    vim.fn.search([=[\w\+\|\s\zs[^[:space:][:alpha:]]\ze\(\A\|$\)]=], "b")
end)
