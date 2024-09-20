local init = function()
    vim.cmd [[colo tokyonight]]
    vim.cmd [[hi StatusLine guibg=NONE]]
    vim.cmd [[hi StatusLineNC guibg=NONE]]
end

local function make_transparent(hlgroup, c)
    hlgroup.bg = c.none
    -- hlgroup.fg = c.none
end

return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
        transparent = true,
        on_highlights = function(hl, c)
            make_transparent(hl.NeoTreeNormal, c)
            make_transparent(hl.NeoTreeNormalNC, c)
            make_transparent(hl.NormalSB, c)

            make_transparent(hl.TelescopePromptTitle, c)
            -- make_transparent(hl.TelescopePromptNormal, c)
            make_transparent(hl.TelescopePromptBorder, c)
            make_transparent(hl.TelescopeNormal, c)
            make_transparent(hl.TelescopeBorder, c)

        end
    },
    config = true,
    init = init
}
